pipeline {
    agent {
        docker {
            image 'mvn-java17:v1' 
        }
    }
    stages{
        stage ('Checkout stage-01') {
            steps {
                checkout scm 
                sh 'echo "Check out done"'
            }
        }
        stage ('Static Code Analysis') {
            environment {
                SONAR_URL = 'http://localhost:9000'
            }
            steps {
                    withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_AUTH_TOKEN')]) {
                    sh 'mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=${SONAR_URL}'
        }
      }
        }
        stage ('Cleaning workspace stage-02') {
            steps {
                sh 'mvn clean'
            }
        }
        stage ('Package the app') {
            steps {
                sh 'mvn clean package' 
            }
        }
    }
}