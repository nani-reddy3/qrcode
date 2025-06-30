pipeline {
    agent any

    environment {
        IMAGE_NAME = "qrgenerator-app"
        CONTAINER_NAME = "qrgenerator-container"
    }

    stages {
        stage('Build App') {
            steps {
                bat 'echo Building on Windows'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo 'Stopping old container if exists...'
                bat '''
                    docker stop %CONTAINER_NAME%
                    IF %ERRORLEVEL% NEQ 0 echo Container not running

                    docker rm %CONTAINER_NAME%
                    IF %ERRORLEVEL% NEQ 0 echo Container not found or already removed
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running container...'
                bat 'docker run -d -p 8080:8080 --name %CONTAINER_NAME% %IMAGE_NAME%'
            }
        }
    }
}
