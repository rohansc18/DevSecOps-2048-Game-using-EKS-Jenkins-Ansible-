pipeline {
    agent any 
    tools {
        
        nodejs 'nodejs'
    }
    environment  {
        SCANNER_HOME=tool 'sonar-scanner'
    }
    stages {
        stage('Cleaning Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/ec2tech-projects/Project-3.git'
            }
        }
        stage('Sonarqube Analysis') {
            steps {
                    withSonarQubeEnv('sonar-server') {
                        sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=2048-game \
                        -Dsonar.projectKey=2048-game '''
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
                dir('Ansible'){
                  script {
                        ansiblePlaybook credentialsId: 'SSH', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/', playbook: 'docker.yaml'
                    }     
                }    
            }
        }
        stage("TRIVY Image Scan") {
            steps {
                sh 'trivy image apatranobis59/2048-game:latest > trivyimage.txt' 
            }
        }

        stage('k8s using ansible'){
            steps{
                dir('Ansible') {
                    script{
                        ansiblePlaybook credentialsId: 'SSH', disableHostKeyChecking: true, installation: 'ansible', inventory: '/etc/ansible/', playbook: 'kube.yaml'
                    }
                } 
            }
        }
    }
}
