pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build App') {
            steps {
                bat 'echo Building on Windows'
                bat 'mvn clean package' // ADD THIS LINE
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t qrgenerator-app .'
            }
        }

        stage('Stop Old Container') {
            when {
                expression { return currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                bat 'docker stop qrgenerator-app || echo "Container not running"'
                bat 'docker rm qrgenerator-app || echo "Container not found"'
            }
        }

        stage('Run Docker Container') {
            when {
                expression { return currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                bat 'docker run -d -p 8080:8080 --name qrgenerator-app qrgenerator-app'
            }
        }
    }
}
