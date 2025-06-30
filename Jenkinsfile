pipeline {
    agent any

    tools {
        // Assumes Maven was added in Jenkins > Global Tool Configuration as 'Maven3.9'
        maven 'Maven3.9'
    }

    environment {
        IMAGE_NAME = 'qrgenerator-app'
        CONTAINER_NAME = 'qrgenerator-app'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build App') {
            steps {
                bat 'echo Building on Windows'
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Stop Old Container') {
            steps {
                bat "docker stop %CONTAINER_NAME% || echo Container not running"
                bat "docker rm %CONTAINER_NAME% || echo Container not found"
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker run -d -p 8080:8080 --name %CONTAINER_NAME% %IMAGE_NAME%"
            }
        }
    }
}
