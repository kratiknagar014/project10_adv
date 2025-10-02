pipeline {
    agent any

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
        
        // Cache directories (using Jenkins home - has proper permissions)
        MAVEN_CACHE = '/var/lib/jenkins/.m2'
        NPM_CACHE = '/var/lib/jenkins/.npm'
        NODE_MODULES_CACHE = '/var/lib/jenkins/cache/node_modules'
        JENKINS_CACHE_DIR = '/var/lib/jenkins/cache'
        
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

        stage('Setup Maven Cache') {
            steps {
                echo "📦 Setting up Maven dependency cache..."
                // Create cache directories in Jenkins home (has proper permissions)
                sh "mkdir -p ${MAVEN_CACHE}"
                sh "mkdir -p ${JENKINS_CACHE_DIR}/maven"
                sh "mkdir -p ${MAVEN_CACHE}/repository"
                
                // Check permissions
                sh "ls -la ${MAVEN_CACHE}"
                sh "whoami"
                echo "✅ Maven cache setup completed"
            }
        }

        stage('Build Backend') {
            steps {
                echo "🏗️ Building Spring Boot backend with cache..."
                dir("${BACKEND_PATH}") {
                    // Use Maven with local repository cache
                    sh "mvn clean compile -DskipTests -Dmaven.repo.local=${MAVEN_CACHE}/repository"
                    sh "mvn package -DskipTests -Pprod -Dmaven.repo.local=${MAVEN_CACHE}/repository"
                }
                echo "✅ Backend build completed"
            }
        }

        stage('Setup NPM Cache') {
            steps {
                echo "📦 Setting up NPM dependency cache..."
                // Create NPM cache directories in Jenkins home
                sh "mkdir -p ${NPM_CACHE}"
                sh "mkdir -p ${NODE_MODULES_CACHE}"
                sh "mkdir -p ${JENKINS_CACHE_DIR}/npm"
                
                // Check permissions and existing cache
                sh "ls -la ${NPM_CACHE} || echo 'NPM cache directory created'"
                sh "ls -la ${JENKINS_CACHE_DIR} || echo 'Jenkins cache directory created'"
                echo "✅ NPM cache setup completed"
            }
        }

        stage('Build Frontend') {
            steps {
                echo "🎨 Building Angular frontend with cache..."
                dir("${FRONTEND_PATH}") {
                    // Debug: Check current directory and files
                    sh 'pwd'
                    sh 'ls -la'
                    sh 'cat package.json | head -20'
                    
                    script {
                        // Check if cached node_modules exists
                        def nodeModulesExists = sh(script: "test -d ${NODE_MODULES_CACHE}/node_modules", returnStatus: true) == 0
                        def packageChanged = sh(script: "test package.json -nt ${NODE_MODULES_CACHE}/package.json.timestamp", returnStatus: true) == 0
                        
                        if (!nodeModulesExists || packageChanged) {
                            echo "📥 Installing dependencies (cache miss or package.json changed)..."
                            sh "npm config set cache ${NPM_CACHE}"
                            
                            // Try with legacy peer deps first
                            script {
                                try {
                                    echo "🔄 Attempting npm install with --legacy-peer-deps..."
                                    sh 'npm install --legacy-peer-deps --no-audit --no-fund --verbose'
                                } catch (Exception e) {
                                    echo "⚠️ Legacy peer deps failed: ${e.getMessage()}"
                                    echo "🔄 Trying with --force flag..."
                                    try {
                                        sh 'npm install --force --no-audit --no-fund --verbose'
                                    } catch (Exception e2) {
                                        echo "❌ Both install methods failed!"
                                        echo "Error 1 (legacy-peer-deps): ${e.getMessage()}"
                                        echo "Error 2 (force): ${e2.getMessage()}"
                                        
                                        // Try basic install as last resort
                                        echo "🔄 Trying basic npm install..."
                                        sh 'npm install --no-audit --no-fund'
                                    }
                                }
                            }
                            
                            // Verify node_modules was created
                            sh 'ls -la node_modules/ | head -10'
                            
                            // Cache the node_modules
                            sh "rm -rf ${NODE_MODULES_CACHE}/node_modules"
                            sh "cp -r node_modules ${NODE_MODULES_CACHE}/"
                            sh "cp package.json ${NODE_MODULES_CACHE}/package.json.timestamp"
                            echo "💾 Dependencies cached for future builds"
                        } else {
                            echo "🚀 Using cached dependencies (faster build)..."
                            sh "cp -r ${NODE_MODULES_CACHE}/node_modules ."
                            sh 'ls -la node_modules/ | head -5'
                        }
                        
                        // Verify Angular CLI is available
                        sh 'npx ng version || echo "Angular CLI not found, installing..."'
                        
                        // Build with timeout and simpler approach
                        echo "🏗️ Starting Angular build (with timeout protection)..."
                        script {
                            def buildSuccess = false
                            
                            // Skip verbose mode - it can cause hanging
                            echo "🔄 Using npm run build:jenkins (optimized for Jenkins)..."
                            try {
                                // Set timeout to prevent hanging
                                timeout(time: 15, unit: 'MINUTES') {
                                    sh 'npm run build:jenkins'
                                }
                                buildSuccess = true
                                echo "✅ Angular build completed successfully!"
                            } catch (Exception e) {
                                echo "⚠️ npm run build failed or timed out, trying basic ng build..."
                                
                                try {
                                    timeout(time: 10, unit: 'MINUTES') {
                                        // Use basic ng build without --prod and --verbose
                                        sh 'npx ng build'
                                    }
                                    buildSuccess = true
                                    echo "✅ Angular build completed with basic ng build!"
                                } catch (Exception e2) {
                                    echo "❌ All build methods failed or timed out!"
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
            echo "🧹 Cleaning up workspace..."
            script {
                // Clean workspace but preserve caches
                cleanWs(patterns: [[pattern: '.git/**', type: 'EXCLUDE'],
                                 [pattern: 'cache/**', type: 'EXCLUDE']])
                
                // Cache maintenance - keep only recent caches
                sh """
                    echo "📊 Cache Statistics:"
                    echo "Maven cache size: \$(du -sh ${MAVEN_CACHE} 2>/dev/null || echo 'Not found')"
                    echo "NPM cache size: \$(du -sh ${NPM_CACHE} 2>/dev/null || echo 'Not found')"
                    echo "Node modules cache size: \$(du -sh ${NODE_MODULES_CACHE} 2>/dev/null || echo 'Not found')"
                    
                    # Clean old cache files (older than 7 days)
                    find ${MAVEN_CACHE} -type f -mtime +7 -delete 2>/dev/null || true
                    find ${NPM_CACHE} -type f -mtime +7 -delete 2>/dev/null || true
                """
            }
        }
        success {
            echo "🎉 Pipeline executed successfully!"
            echo "✅ Application deployed and ready for use"
            echo "💾 Dependencies cached for faster future builds"
            
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
