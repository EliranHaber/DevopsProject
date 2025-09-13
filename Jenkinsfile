pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'main', url: 'https://github.com/EliranHaber/DevopsProject.git'
            }
        }
        
        stage('Build') {
            steps {
                echo 'Building JSP application...'
                // JSP files don't need compilation, just validation
                script {
                    if (fileExists('index.jsp')) {
                        echo 'JSP file found - build successful'
                    } else {
                        error 'JSP file not found - build failed'
                    }
                }
            }
        }
        
        stage('Deploy to Tomcat') {
            steps {
                echo 'Deploying to Tomcat...'
                script {
                    def tomcatPath = 'C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps'
                    def appFolder = 'eliran-nimrod-saar-nikita-ido'
                    def targetPath = "${tomcatPath}\\${appFolder}"
                    
                    // Create target directory if it doesn't exist
                    bat "if not exist \"${targetPath}\" mkdir \"${targetPath}\""
                    
                    // Copy files to Tomcat
                    bat "xcopy /E /Y \"${WORKSPACE}\\*\" \"${targetPath}\""
                    
                    echo "Application deployed to: ${targetPath}"
                }
            }
        }
        
        stage('Health Check') {
            steps {
                echo 'Performing health check...'
                script {
                    // Wait a moment for Tomcat to process the deployment
                    sleep(5)
                    
                    // Check if the application is accessible
                    def response = httpRequest url: 'http://localhost:8080/eliran-nimrod-saar-nikita-ido/', 
                                        validResponseCodes: '200,404'
                    
                    if (response.status == 200) {
                        echo 'Health check passed - application is running'
                    } else {
                        echo "Health check failed - status: ${response.status}"
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Pipeline completed successfully!'
            // You can add notifications here (email, Slack, etc.)
        }
        failure {
            echo 'Pipeline failed!'
            // You can add failure notifications here
        }
    }
}
