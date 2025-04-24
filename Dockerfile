pipeline {
    agent any
    environment {
        DOCKER_USERNAME = credentials('docker_username') // Jenkins credentials ID
        DOCKER_PASSWORD = credentials('docker-password') // Jenkins credentials ID
    }
    stages {
        stage('Checkout') {
            steps {
                // Git plugin assumes repo is already set or use git url: '...'
                checkout scm
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
