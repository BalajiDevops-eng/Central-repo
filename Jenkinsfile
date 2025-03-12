pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
    }

    environment {
        PROJECT_NAME = 'My Project'
        BUILD_NUMBER = env.BUILD_NUMBER
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/BalajiDevops-eng/Central-repo.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Unit Tests') {
            steps {
                sh 'mvn test'
            }
            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(credentials: ['your-ssh-credentials']) {
                    sh 'scp target/your-app.jar your-username@your-dev-server:/path/to/deploy'
                    sh 'ssh your-username@your-dev-server /path/to/restart-app.sh'
                }
            }
        }
    }
