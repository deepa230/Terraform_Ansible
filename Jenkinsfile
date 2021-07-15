pipeline {
    agent any
environment {
       AWS_DEFAULT_REGION = 'ap-south-1'
    }
stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
         stage('execute ansible') {
            steps {
                sh 'pwd; sleep 60; echo "Hello World"'
                ansiblePlaybook credentialsId: 'privatekey', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dynamicinventory.py', playbook: 'main.yml'
            }
        }
    }
}
