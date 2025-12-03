pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/lesantivanez/jenkins-release-demo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Compilando aplicación..."'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "Ejecutando pruebas..."'
            }
        }

        stage('Install zip if missing') {
            steps {
                sh '''
                echo "Verificando si zip está instalado..."
                if ! command -v zip >/dev/null 2>&1; then
                  echo "zip NO está instalado. Instalando..."
                  apt-get update
                  apt-get install -y zip
                else
                  echo "zip ya está instalado."
                fi
                '''
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
        success { echo "Release generado exitosamente." }
        failure { echo "Falló el release." }
    }
}
