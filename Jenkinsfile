pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/Jagriti143/Portfolio_website.git'
        BRANCH = 'main'
    }

    stages {

        stage('Clone') {
            steps {
                git branch: "${BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Build') {
            steps {
                echo 'Build step started...'
                // Example: if you're using Node.js
                // sh 'npm install'
                // or for basic HTML/CSS/JS project just skip this
                echo 'Build step completed.'
            }
        }

        stage('Test') {
            steps {
                echo 'Running test scripts...'
                // Add your test commands here
                echo 'Tests passed.'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                // You can add Docker build, Azure CLI, or SCP here
                echo 'Deployment complete.'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
