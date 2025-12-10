pipeline {
    agent any
    
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

        stage('Tests') {
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

                stage('Opera Browser') {
                    steps {
                        sh 'echo "Ejecutando pruebas en Opera Browser ..."'
                    }
                }
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
