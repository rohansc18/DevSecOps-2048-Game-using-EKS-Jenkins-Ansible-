pipeline {
    agent any 
    tools {
        nodejs 'nodejs'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }
    stages {

        stage('Cleaning Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/rohansc18/DevSecOps-2048-Game-using-EKS-Jenkins-Ansible-.git'
            }
        }

        stage('Sonarqube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=2048-game \
                        -Dsonar.projectKey=2048-game'''
                }
            }
        }

        stage('Quality Check') {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'
                }
            }
        }

        stage('Ansible Docker') {
            steps {
                dir('Ansible') {
                    script {
                        withCredentials([usernamePassword(
                            credentialsId: 'docker-hub-creds', 
                            usernameVariable: 'DOCKER_USER', 
