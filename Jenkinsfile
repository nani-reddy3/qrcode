pipeline {
    agent any

    environment {
        IMAGE_NAME = "qrgenerator-app"
    }

    stages {
        stage('Clone Code') {
            steps {
                git 'https://github.com/nani-reddy3/qrcode.git'
            }
        }

        stage('Build App') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8080:8080 $IMAGE_NAME'
            }
        }
    }
}
