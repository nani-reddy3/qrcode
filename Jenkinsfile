pipeline {
    agent any

    environment {
        IMAGE_NAME = "qrgenerator-app"
        CONTAINER_NAME = "qrgenerator-container"
    }

    stages {
        stage('Clone Code') {
            steps {
                // No need for this step if Git repo is configured in job's SCM
                git branch: 'main', url: 'https://github.com/nani-reddy3/qrcode.git'
            }
        }

        stage('Build App') {
            steps {
                echo 'Building Spring Boot application...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                echo 'Stopping any old container if exists...'
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }
}
