// =============== for jar file ===============
// pipeline {
//     agent any

//     tools {
//         // Ensure 'Maven3.9.10' is defined in Jenkins > Global Tool Configuration
//         maven 'Maven3.9.10'
//     }

//     environment {
//         IMAGE_NAME = 'qrgenerator-app'
//         CONTAINER_NAME = 'qrgenerator-app'
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }

//         stage('Build App') {
//             steps {
//                 bat 'mvn -version'
//                 bat 'echo Building on Windows'
//                 bat 'mvn clean package'
//             }
//         }

//         stage('Build Docker Image') {
//             steps {
//                 echo 'Building Docker image...'
//                 bat "docker build -t %IMAGE_NAME% ."
//             }
//         }

//         stage('Stop Old Container') {
//             steps {
//                 script {
//                     try {
//                         bat "docker stop %CONTAINER_NAME%"
//                     } catch (e) {
//                         echo "No running container to stop."
//                     }

//                     try {
//                         bat "docker rm %CONTAINER_NAME%"
//                     } catch (e) {
//                         echo "No container to remove."
//                     }
//                 }
//             }
//         }

//         stage('Run Docker Container') {
//             steps {
//                 bat "docker run -d -p 8080:8080 --name %CONTAINER_NAME% %IMAGE_NAME%"
//             }
//         }
//     }
// }

// =============== for war file ===============
pipeline {
    agent any

    tools {
        maven 'Maven3.9.10' // Make sure this name matches your Jenkins Maven tool
    }

    environment {
        IMAGE_NAME = 'qrgenerator-app-war'
        CONTAINER_NAME = 'qrgenerator-war'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build WAR') {
            steps {
                bat 'mvn -version'
                bat 'echo Building WAR on Windows'
                bat 'mvn clean package' // Will generate .war in target/
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image with WAR and Tomcat...'
                bat "docker build -t %IMAGE_NAME% ."
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    try {
                        bat "docker stop %CONTAINER_NAME%"
                    } catch (e) {
                        echo "No running container to stop."
                    }

                    try {
                        bat "docker rm %CONTAINER_NAME%"
                    } catch (e) {
                        echo "No container to remove."
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker run -d -p 8080:8080 --name %CONTAINER_NAME% %IMAGE_NAME%"
            }
        }
    }
}
// =============== for war file ===============