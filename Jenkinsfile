pipeline {
    agent {
        docker {
            image 'mvn-java17:v1' 
            args '--user root -v /var/run/docker.sock:/var/run/docker.sock'
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
                SONAR_URL = 'curl http://172.17.0.2:9000'
            }
            steps {
                    withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_AUTH_TOKEN')]) {
                    sh "mvn sonar:sonar -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=${SONAR_URL}"
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