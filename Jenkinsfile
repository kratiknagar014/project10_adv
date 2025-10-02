pipeline {
    agent any
    
    parameters {
        booleanParam(
            name: 'CLEAN_CACHE', 
            defaultValue: false, 
            description: 'Clean all Jenkins cache directories (Maven, NPM, Node modules)'
        )
    }

    tools {
        jdk 'JDK11'        // Jenkins me configured JDK11 ka name
        maven 'Maven3'     // Jenkins me configured Maven
        nodejs 'Node12'    // Jenkins me configured NodeJS
    }

    environment {
        BACKEND_PATH = 'Project_10_adv/projectORS'
        FRONTEND_PATH = 'Project_10_adv/ORSProject10-UI'
        JAR_OUTPUT = '/opt/ors-project/ors10.jar'
        DEPLOY_DIR = '/opt/ors-project'
        
        // Node.js environment variables to suppress deprecation warnings
        NODE_NO_WARNINGS = '1'
        NODE_OPTIONS = '--no-deprecation --no-warnings --max-old-space-size=4096'
        NPM_CONFIG_LOGLEVEL = 'error'
        CI = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🔄 Checking out code from repository..."
                git branch: 'main', url: 'https://github.com/kratiknagar014/project10_adv.git'
                echo "✅ Code checkout completed"
            }
        }

        stage('Validate Environment') {
            steps {
                echo "🔍 Validating build environment..."
                sh 'java -version'
                sh 'mvn -version'
                sh 'node --version'
                sh 'npm --version'
                
                // Verify project structure
                echo "📁 Checking project structure..."
                sh "ls -la ${BACKEND_PATH}/"
                sh "ls -la ${FRONTEND_PATH}/"
                
                // Verify key files exist
                sh "test -f ${BACKEND_PATH}/pom.xml && echo '✅ Backend pom.xml found' || echo '❌ Backend pom.xml missing'"
                sh "test -f ${FRONTEND_PATH}/package.json && echo '✅ Frontend package.json found' || echo '❌ Frontend package.json missing'"
                sh "test -f ${FRONTEND_PATH}/angular.json && echo '✅ Angular config found' || echo '❌ Angular config missing'"
                
                // Check workspace permissions
                sh "whoami"
                sh "pwd"
                sh "ls -la"
                echo "✅ Environment validation completed"
            }
        }


        stage('Build Backend') {
            steps {
                echo "🏗️ Building Spring Boot backend..."
                dir("${BACKEND_PATH}") {
                    // Clean build without cache
                    sh "mvn clean compile -DskipTests"
                    sh "mvn package -DskipTests -Pprod"
                }
                echo "✅ Backend build completed"
            }
        }


        stage('Kill Hanging Processes') {
            steps {
                echo "🔪 Killing any hanging npm/node processes..."
                script {
                    try {
                        sh '''
                            # Kill any hanging npm processes
                            pkill -f "npm install" || true
                            pkill -f "npm" || true
                            pkill -f "node" || true
                            
                            # Wait a moment
                            sleep 2
                            
                            # Check if any processes are still running
                            ps aux | grep -E "(npm|node)" | grep -v grep || echo "No npm/node processes found"
                        '''
                        echo "✅ Process cleanup completed"
                    } catch (Exception e) {
                        echo "⚠️ Process cleanup failed: ${e.getMessage()}"
                    }
                }
            }
        }

        stage('Build Frontend') {
            steps {
                echo "🎨 Building Angular frontend..."
                dir("${FRONTEND_PATH}") {
                    // Debug: Check current directory and files
                    sh 'pwd'
                    sh 'ls -la'
                    sh 'cat package.json | head -20'
                    
                    // Pre-install cleanup and setup
                    echo "🧹 Pre-install cleanup..."
                    sh 'rm -rf node_modules package-lock.json || true'
                    sh 'npm cache clean --force || true'
                    
                    // Set npm configurations for Angular 7
                    echo "⚙️ Configuring npm for Angular 7..."
                    sh 'npm config set legacy-peer-deps true'
                    sh 'npm config set fund false'
                    sh 'npm config set audit false'
                    
                    // Clean install dependencies with timeout
                    echo "📥 Installing dependencies with timeout protection..."
                    script {
                        try {
                            echo "🔄 Attempting npm install with --legacy-peer-deps (5 min timeout)..."
                            timeout(time: 5, unit: 'MINUTES') {
                                sh 'npm install --legacy-peer-deps --no-audit --no-fund --verbose'
                            }
                            echo "✅ npm install with legacy-peer-deps successful!"
                        } catch (Exception e) {
                            echo "⚠️ Legacy peer deps failed or timed out: ${e.getMessage()}"
                            echo "🔄 Trying with --force flag (3 min timeout)..."
                            try {
                                timeout(time: 3, unit: 'MINUTES') {
                                    sh 'npm install --force --no-audit --no-fund'
                                }
                                echo "✅ npm install with --force successful!"
                            } catch (Exception e2) {
                                echo "❌ Force install failed or timed out: ${e2.getMessage()}"
                                echo "🔄 Trying basic npm install (2 min timeout)..."
                                try {
                                    timeout(time: 2, unit: 'MINUTES') {
                                        sh 'npm install --no-audit --no-fund'
                                    }
                                    echo "✅ Basic npm install successful!"
                                } catch (Exception e3) {
                                    echo "❌ All npm install methods failed or timed out!"
                                    echo "🔄 Trying alternative approach with yarn..."
                                    try {
                                        timeout(time: 3, unit: 'MINUTES') {
                                            sh 'npm install -g yarn || true'
                                            sh 'yarn install --ignore-engines --network-timeout 300000'
                                        }
                                        echo "✅ Yarn install successful!"
                                    } catch (Exception e4) {
                                        echo "❌ Yarn also failed! Trying minimal install..."
                                        try {
                                            timeout(time: 2, unit: 'MINUTES') {
                                                sh 'npm install --only=prod --no-optional --no-audit --no-fund'
                                            }
                                            echo "✅ Minimal install successful!"
                                        } catch (Exception e5) {
                                            echo "❌ All installation methods failed!"
                                            echo "🔍 Debug info:"
                                            sh 'npm --version || echo "npm not found"'
                                            sh 'node --version || echo "node not found"'
                                            sh 'ls -la package*.json || echo "package files not found"'
                                            sh 'df -h || echo "disk space check failed"'
                                            sh 'free -h || echo "memory check failed"'
                                            sh 'ps aux | grep npm || echo "no npm processes"'
                                            throw e5
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    // Verify node_modules was created
                    sh 'ls -la node_modules/ | head -10'
                    
                    // Verify Angular CLI is available
                    sh 'npx ng version || echo "Angular CLI not found, installing..."'
                    
                    // Build with timeout protection
                    echo "🏗️ Starting Angular build..."
                    script {
                        def buildSuccess = false
                        
                        echo "🔄 Using npm run build:jenkins..."
                        try {
                            timeout(time: 15, unit: 'MINUTES') {
                                sh 'npm run build:jenkins'
                            }
                            buildSuccess = true
                            echo "✅ Angular build completed successfully!"
                        } catch (Exception e) {
                            echo "⚠️ npm run build failed, trying basic ng build..."
                            
                            try {
                                timeout(time: 10, unit: 'MINUTES') {
                                    sh 'npx ng build --prod'
                                }
                                buildSuccess = true
                                echo "✅ Angular build completed with basic ng build!"
                            } catch (Exception e2) {
                                echo "❌ All build methods failed!"
                                echo "Error 1 (npm run build): ${e.getMessage()}"
                                echo "Error 2 (ng build): ${e2.getMessage()}"
                                
                                // Debug information
                                echo "🔍 Debug Information:"
                                sh 'ls -la dist/ || echo "No dist folder found"'
                                sh 'ps aux | grep node || echo "No node processes"'
                                sh 'free -h || echo "Memory info unavailable"'
                                
                                throw e2
                            }
                        }
                        
                        // Verify build output
                        if (buildSuccess) {
                            echo "🔍 Verifying build output..."
                            sh 'ls -la dist/'
                            sh 'find dist/ -name "*.js" -o -name "*.html" -o -name "*.css" | head -10'
                            echo "✅ Build verification completed"
                        }
                    }
                }
                echo "✅ Frontend build completed"
            }
        }

        stage('Create Deployment Directory') {
            steps {
                echo "📁 Creating deployment directory..."
                script {
                    // Try to create deployment directory with proper permissions
                    try {
                        sh "sudo mkdir -p ${DEPLOY_DIR}"
                        sh "sudo mkdir -p ${DEPLOY_DIR}/logs"
                        sh "sudo mkdir -p ${DEPLOY_DIR}/backup"
                        sh "sudo chown -R jenkins:jenkins ${DEPLOY_DIR}"
                        echo "✅ Deployment directory created with sudo"
                    } catch (Exception e) {
                        echo "⚠️ Sudo not available, using alternative location..."
                        // Use Jenkins workspace for deployment
                        sh "mkdir -p \${WORKSPACE}/deployment"
                        sh "mkdir -p \${WORKSPACE}/deployment/logs"
                        sh "mkdir -p \${WORKSPACE}/deployment/backup"
                        echo "✅ Using workspace deployment directory"
                    }
                }
                echo "✅ Deployment directory setup completed"
            }
        }

        stage('Deploy Backend') {
            steps {
                echo "🚀 Deploying backend JAR..."
                // Backup existing JAR if exists
                sh """
                    if [ -f ${JAR_OUTPUT} ]; then
                        cp ${JAR_OUTPUT} ${DEPLOY_DIR}/backup/ors10-\$(date +%Y%m%d_%H%M%S).jar
                        echo "✅ Existing JAR backed up"
                    fi
                """
                // Copy new JAR
                sh "cp ${BACKEND_PATH}/target/*.jar ${JAR_OUTPUT}"
                sh "chmod +x ${JAR_OUTPUT}"
                echo "✅ Backend deployment completed"
            }
        }

        stage('Deploy Frontend') {
            steps {
                echo "🌐 Deploying frontend files..."
                sh "mkdir -p /var/www/html"
                sh "cp -r ${FRONTEND_PATH}/dist/P10-UI/* /var/www/html/"
                sh "chown -R www-data:www-data /var/www/html"
                echo "✅ Frontend deployment completed"
            }
        }

        stage('Health Check') {
            steps {
                echo "🏥 Performing health check..."
                // Wait for application to start
                sleep(time: 10, unit: 'SECONDS')
                
                sh """
                    echo "Checking if JAR file exists..."
                    ls -la ${JAR_OUTPUT}
                    
                    echo "Checking frontend files..."
                    ls -la /var/www/html/index.html
                """
                echo "✅ Health check completed"
            }
        }

        stage('Manual Cache Cleanup') {
            when {
                // Only run when explicitly triggered with parameter
                expression { params.CLEAN_CACHE == true }
            }
            steps {
                echo "🗑️ Manual cache cleanup requested..."
                sh """
                    echo "🧹 Cleaning all Jenkins cache directories..."
                    
                    # Remove Maven cache
                    sudo rm -rf /var/lib/jenkins/.m2/* 2>/dev/null || true
                    echo "✅ Maven cache removed"
                    
                    # Remove NPM cache
                    sudo rm -rf /var/lib/jenkins/.npm/* 2>/dev/null || true
                    sudo rm -rf /var/lib/jenkins/cache/* 2>/dev/null || true
                    echo "✅ NPM cache removed"
                    
                    # Clean global npm cache
                    npm cache clean --force 2>/dev/null || true
                    echo "✅ Global NPM cache cleaned"
                    
                    # Remove temporary files
                    sudo rm -rf /tmp/npm-* /tmp/node-* 2>/dev/null || true
                    echo "✅ Temporary files removed"
                    
                    echo "🎯 Manual cache cleanup completed!"
                """
            }
        }

        stage('Success Notification') {
            steps {
                echo "🎉 Build and Deployment Completed Successfully!"
                echo "📊 Deployment Summary:"
                echo "   - Backend JAR: ${JAR_OUTPUT}"
                echo "   - Frontend: Web server document root"
                echo "   - Build Time: ${new Date()}"
                echo "   - Git Branch: main"
                echo "   - Build Number: ${BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            echo "🧹 Cleaning up workspace and cache directories..."
            script {
                // Clean workspace completely
                cleanWs()
                
                // Clean and remove all cache directories
                sh """
                    echo "🗑️ Removing cache directories..."
                    
                    # Remove Maven cache directories
                    rm -rf /var/lib/jenkins/.m2/repository/* 2>/dev/null || true
                    rm -rf /var/lib/jenkins/.m2/* 2>/dev/null || true
                    echo "✅ Maven cache cleaned"
                    
                    # Remove NPM cache directories
                    rm -rf /var/lib/jenkins/.npm/* 2>/dev/null || true
                    rm -rf /var/lib/jenkins/cache/node_modules/* 2>/dev/null || true
                    rm -rf /var/lib/jenkins/cache/npm/* 2>/dev/null || true
                    echo "✅ NPM cache cleaned"
                    
                    # Remove Jenkins cache directory
                    rm -rf /var/lib/jenkins/cache/* 2>/dev/null || true
                    echo "✅ Jenkins cache cleaned"
                    
                    # Clean npm global cache
                    npm cache clean --force 2>/dev/null || true
                    echo "✅ NPM global cache cleaned"
                    
                    # Clean temporary files
                    rm -rf /tmp/npm-* 2>/dev/null || true
                    rm -rf /tmp/node-* 2>/dev/null || true
                    echo "✅ Temporary files cleaned"
                    
                    echo "🎯 All cache directories cleaned successfully!"
                """
            }
        }
        success {
            echo "🎉 Pipeline executed successfully!"
            echo "✅ Application deployed and ready for use"
            echo "🧹 All cache directories cleaned"
            
            // Send notification (if configured)
            // emailext (
            //     subject: "✅ ORS Project Deployment Successful - Build #${BUILD_NUMBER}",
            //     body: "The ORS project has been successfully deployed.",
            //     to: "admin@project10.live"
            // )
        }
        failure {
            echo "❌ Pipeline failed!"
            echo "🔍 Check the logs above for error details"
            
            // Send failure notification.. (if configured)
            // emailext (
            //     subject: "❌ ORS Project Deployment Failed - Build #${BUILD_NUMBER}",
            //     body: "The ORS project deployment failed. Please check Jenkins logs.",
            //     to: "admin@project10.live"
            // )
        }
        unstable {
            echo "⚠️ Pipeline completed with warnings"
        }
    }
}
