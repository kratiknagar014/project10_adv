pipeline {
    agent any

    tools {
        jdk 'JDK11'        // Jenkins me configured JDK11 ka name
        maven 'Maven3'     // Jenkins me configured Maven
        nodejs 'Node16'    // Jenkins me configured NodeJS
    }

    environment {
        BACKEND_PATH = 'Project_10_adv/projectORS'
        FRONTEND_PATH = 'Project_10_adv/ORSProject10-UI'
        JAR_OUTPUT = '/opt/ors-project/ors10.jar'
        DEPLOY_DIR = '/opt/ors-project'
        
        // Cache directories
        MAVEN_CACHE = '/var/lib/jenkins/.m2'
        NPM_CACHE = '/var/lib/jenkins/.npm'
        NODE_MODULES_CACHE = '/var/lib/jenkins/cache/node_modules'
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
                script {
                    if (isUnix()) {
                        sh 'java -version'
                        sh 'mvn -version'
                        sh 'node --version'
                        sh 'npm --version'
                        
                        // Verify project structure
                        sh "ls -la ${BACKEND_PATH}/pom.xml"
                        sh "ls -la ${FRONTEND_PATH}/package.json"
                    } else {
                        bat 'java -version'
                        bat 'mvn -version'
                        bat 'node --version'
                        bat 'npm --version'
                        
                        // Verify project structure
                        bat "dir \"${BACKEND_PATH}\\pom.xml\""
                        bat "dir \"${FRONTEND_PATH}\\package.json\""
                    }
                }
                echo "✅ Environment validation completed"
            }
        }

        stage('Setup Maven Cache') {
            steps {
                echo "📦 Setting up Maven dependency cache..."
                script {
                    if (isUnix()) {
                        sh "mkdir -p ${MAVEN_CACHE}"
                        sh "mkdir -p ${DEPLOY_DIR}/cache/maven"
                    } else {
                        bat "if not exist \"C:\\jenkins-cache\\.m2\" mkdir \"C:\\jenkins-cache\\.m2\""
                        bat "if not exist \"C:\\opt\\ors-project\\cache\\maven\" mkdir \"C:\\opt\\ors-project\\cache\\maven\""
                    }
                }
                echo "✅ Maven cache setup completed"
            }
        }

        stage('Build Backend') {
            steps {
                echo "🏗️ Building Spring Boot backend with cache..."
                dir("${BACKEND_PATH}") {
                    script {
                        if (isUnix()) {
                            // Use Maven with local repository cache
                            sh "mvn clean compile -DskipTests -Dmaven.repo.local=${MAVEN_CACHE}/repository"
                            sh "mvn package -DskipTests -Pprod -Dmaven.repo.local=${MAVEN_CACHE}/repository"
                        } else {
                            bat "mvn clean compile -DskipTests -Dmaven.repo.local=C:\\jenkins-cache\\.m2\\repository"
                            bat "mvn package -DskipTests -Pprod -Dmaven.repo.local=C:\\jenkins-cache\\.m2\\repository"
                        }
                    }
                }
                echo "✅ Backend build completed"
            }
        }

        stage('Setup NPM Cache') {
            steps {
                echo "📦 Setting up NPM dependency cache..."
                script {
                    if (isUnix()) {
                        sh "mkdir -p ${NPM_CACHE}"
                        sh "mkdir -p ${NODE_MODULES_CACHE}"
                        sh "mkdir -p ${DEPLOY_DIR}/cache/npm"
                    } else {
                        bat "if not exist \"C:\\jenkins-cache\\.npm\" mkdir \"C:\\jenkins-cache\\.npm\""
                        bat "if not exist \"C:\\jenkins-cache\\node_modules\" mkdir \"C:\\jenkins-cache\\node_modules\""
                        bat "if not exist \"C:\\opt\\ors-project\\cache\\npm\" mkdir \"C:\\opt\\ors-project\\cache\\npm\""
                    }
                }
                echo "✅ NPM cache setup completed"
            }
        }

        stage('Build Frontend') {
            steps {
                echo "🎨 Building Angular frontend with cache..."
                dir("${FRONTEND_PATH}") {
                    script {
                        if (isUnix()) {
                            // Check if cached node_modules exists
                            def nodeModulesExists = sh(script: "test -d ${NODE_MODULES_CACHE}/node_modules", returnStatus: true) == 0
                            def packageChanged = sh(script: "test package.json -nt ${NODE_MODULES_CACHE}/package.json.timestamp", returnStatus: true) == 0
                            
                            if (!nodeModulesExists || packageChanged) {
                                echo "📥 Installing dependencies (cache miss or package.json changed)..."
                                sh "npm config set cache ${NPM_CACHE}"
                                
                                // Try with legacy peer deps first
                                script {
                                    try {
                                        sh 'npm install --legacy-peer-deps --no-audit --no-fund'
                                    } catch (Exception e) {
                                        echo "⚠️ Legacy peer deps failed, trying with force..."
                                        sh 'npm install --force --no-audit --no-fund'
                                    }
                                }
                                
                                // Cache the node_modules
                                sh "rm -rf ${NODE_MODULES_CACHE}/node_modules"
                                sh "cp -r node_modules ${NODE_MODULES_CACHE}/"
                                sh "cp package.json ${NODE_MODULES_CACHE}/package.json.timestamp"
                                echo "💾 Dependencies cached for future builds"
                            } else {
                                echo "🚀 Using cached dependencies (faster build)..."
                                sh "cp -r ${NODE_MODULES_CACHE}/node_modules ."
                            }
                            
                            sh 'npx ng build --prod'
                        } else {
                            // Windows caching logic
                            script {
                                def cacheExists = bat(script: "if exist \"C:\\jenkins-cache\\node_modules\\node_modules\" (exit 0) else (exit 1)", returnStatus: true) == 0
                                
                                if (!cacheExists) {
                                    echo "📥 Installing dependencies (cache miss)..."
                                    bat "npm config set cache C:\\jenkins-cache\\.npm"
                                    
                                    try {
                                        bat 'npm install --legacy-peer-deps --no-audit --no-fund'
                                    } catch (Exception e) {
                                        echo "⚠️ Legacy peer deps failed, trying with force..."
                                        bat 'npm install --force --no-audit --no-fund'
                                    }
                                    
                                    // Cache the node_modules
                                    bat "if exist \"C:\\jenkins-cache\\node_modules\\node_modules\" rmdir /s /q \"C:\\jenkins-cache\\node_modules\\node_modules\""
                                    bat "xcopy node_modules \"C:\\jenkins-cache\\node_modules\\node_modules\\\" /E /I /Y"
                                    echo "💾 Dependencies cached for future builds"
                                } else {
                                    echo "🚀 Using cached dependencies (faster build)..."
                                    bat "xcopy \"C:\\jenkins-cache\\node_modules\\node_modules\\*\" node_modules\\ /E /Y"
                                }
                            }
                            
                            bat 'npx ng build --prod'
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
                    if (isUnix()) {
                        sh "mkdir -p ${DEPLOY_DIR}"
                        sh "mkdir -p ${DEPLOY_DIR}/logs"
                        sh "mkdir -p ${DEPLOY_DIR}/backup"
                    } else {
                        bat "if not exist \"C:\\opt\\ors-project\" mkdir \"C:\\opt\\ors-project\""
                        bat "if not exist \"C:\\opt\\ors-project\\logs\" mkdir \"C:\\opt\\ors-project\\logs\""
                        bat "if not exist \"C:\\opt\\ors-project\\backup\" mkdir \"C:\\opt\\ors-project\\backup\""
                    }
                }
                echo "✅ Deployment directory created"
            }
        }

        stage('Deploy Backend') {
            steps {
                echo "🚀 Deploying backend JAR..."
                script {
                    if (isUnix()) {
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
                    } else {
                        // Windows deployment
                        bat """
                            if exist "C:\\opt\\ors-project\\ors10.jar" (
                                copy "C:\\opt\\ors-project\\ors10.jar" "C:\\opt\\ors-project\\backup\\ors10_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.jar"
                                echo ✅ Existing JAR backed up
                            )
                        """
                        bat "copy \"${BACKEND_PATH}\\target\\*.jar\" \"C:\\opt\\ors-project\\ors10.jar\""
                    }
                }
                echo "✅ Backend deployment completed"
            }
        }

        stage('Deploy Frontend') {
            steps {
                echo "🌐 Deploying frontend files..."
                script {
                    if (isUnix()) {
                        sh "mkdir -p /var/www/html"
                        sh "cp -r ${FRONTEND_PATH}/dist/P10-UI/* /var/www/html/"
                        sh "chown -R www-data:www-data /var/www/html"
                    } else {
                        bat "if not exist \"C:\\inetpub\\wwwroot\" mkdir \"C:\\inetpub\\wwwroot\""
                        bat "xcopy \"${FRONTEND_PATH}\\dist\\P10-UI\\*\" \"C:\\inetpub\\wwwroot\\\" /E /Y"
                    }
                }
                echo "✅ Frontend deployment completed"
            }
        }

        stage('Health Check') {
            steps {
                echo "🏥 Performing health check..."
                script {
                    // Wait for application to start
                    sleep(time: 10, unit: 'SECONDS')
                    
                    if (isUnix()) {
                        sh """
                            echo "Checking if JAR file exists..."
                            ls -la ${JAR_OUTPUT}
                            
                            echo "Checking frontend files..."
                            ls -la /var/www/html/index.html
                        """
                    } else {
                        bat """
                            echo Checking if JAR file exists...
                            dir "C:\\opt\\ors-project\\ors10.jar"
                            
                            echo Checking frontend files...
                            dir "C:\\inetpub\\wwwroot\\index.html"
                        """
                    }
                }
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
                if (isUnix()) {
                    sh """
                        echo "📊 Cache Statistics:"
                        echo "Maven cache size: \$(du -sh ${MAVEN_CACHE} 2>/dev/null || echo 'Not found')"
                        echo "NPM cache size: \$(du -sh ${NPM_CACHE} 2>/dev/null || echo 'Not found')"
                        echo "Node modules cache size: \$(du -sh ${NODE_MODULES_CACHE} 2>/dev/null || echo 'Not found')"
                        
                        # Clean old cache files (older than 7 days)
                        find ${MAVEN_CACHE} -type f -mtime +7 -delete 2>/dev/null || true
                        find ${NPM_CACHE} -type f -mtime +7 -delete 2>/dev/null || true
                    """
                } else {
                    bat """
                        echo 📊 Cache Statistics:
                        if exist "C:\\jenkins-cache\\.m2" (
                            echo Maven cache exists
                        ) else (
                            echo Maven cache not found
                        )
                        if exist "C:\\jenkins-cache\\.npm" (
                            echo NPM cache exists
                        ) else (
                            echo NPM cache not found
                        )
                        if exist "C:\\jenkins-cache\\node_modules" (
                            echo Node modules cache exists
                        ) else (
                            echo Node modules cache not found
                        )
                    """
                }
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
            
            // Send failure notification (if configured)
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
