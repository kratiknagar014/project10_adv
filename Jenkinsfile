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

        stage('Build Backend') {
            steps {
                echo "🏗️ Building Spring Boot backend..."
                dir("${BACKEND_PATH}") {
                    script {
                        if (isUnix()) {
                            sh 'mvn clean compile -DskipTests'
                            sh 'mvn package -DskipTests -Pprod'
                        } else {
                            bat 'mvn clean compile -DskipTests'
                            bat 'mvn package -DskipTests -Pprod'
                        }
                    }
                }
                echo "✅ Backend build completed"
            }
        }

        stage('Build Frontend') {
            steps {
                echo "🎨 Building Angular frontend..."
                dir("${FRONTEND_PATH}") {
                    script {
                        if (isUnix()) {
                            sh 'npm ci --only=production'
                            sh 'npx ng build --configuration production'
                        } else {
                            bat 'npm ci --only=production'
                            bat 'npx ng build --configuration production'
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
            cleanWs()
        }
        success {
            echo "🎉 Pipeline executed successfully!"
            echo "✅ Application deployed and ready for use"
            
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
