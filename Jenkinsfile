pipeline {
    agent any

    environment {
        IMAGE_NAME = "qrgenerator-app"
        CONTAINER_NAME = "qrgenerator-container"
    }

    stages {
        stage('Build App') {
            steps {
                echo 'Building Spring Boot app...'
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
                echo 'Stopping old container if exists...'
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running container...'
                sh 'docker run -d -p 8080:8080 --name $CONTAINER_NAME $IMAGE_NAME'
            }
        }
    }
}
