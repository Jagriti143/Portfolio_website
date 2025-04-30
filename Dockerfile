pipeline {
    agent any
    environment {
        DOCKER_USERNAME = credentials('docker_username') 
        DOCKER_PASSWORD = credentials('docker-password')
        GIT_REPO = 'https://github.com/your-repo-url.git' // Add your repository URL here
    }
    stages {
        stage('Checkout') {
            steps {
                git url: "${GIT_REPO}", branch: 'main' // Use the correct branch name here
            }
        }
        stage('Docker Login') {
            steps {
                bat """
                    echo %DOCKER_PASSWORD% | docker login -u %DOCKER_USERNAME% --password-stdin
                """
            }
        }
        stage('Build Docker Image') {
            steps {
                bat """
                    docker build -t %DOCKER_USERNAME%/ml-api:latest .
                """
            }
        }
        stage('Push Docker Image') {
            steps {
                bat """
                    docker push %DOCKER_USERNAME%/ml-api:latest
                """
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}




