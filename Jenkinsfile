pipeline {
    agent any
    
    // ACTIVACIÓN AUTOMÁTICA
    triggers {
        pollSCM('* * * * *')   // Jenkins revisa cambios cada minuto
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Harold242001/jenkins-release-final.git'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Compilando aplicación..."'
            }
        }

        stage('Tests Paralelos') {
            parallel {
                stage('Firefox') {
                    steps {
                        sh 'echo "Ejecutando pruebas en Firefox..."'
                    }
                }
                stage('Edge') {
                    steps {
                        sh 'echo "Ejecutando pruebas en Edge..."'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Ejecutando pruebas..."'
            }
        }

        stage('Package Release') {
            steps {
                sh 'echo "Generando artefacto release..."'
                sh 'zip -r release.zip ./src'
            }
        }

        stage('Publish Artifact') {
            steps {
                sh 'echo "Publicando artefacto..."'
            }
        }
    }

    post {
        success {
            archiveArtifacts artifacts: 'release.zip', fingerprint: true
            echo "Release generado exitosamente."
        }
        failure {
            echo "Falló el release."
        }
    }
}
