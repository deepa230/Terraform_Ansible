pipeline {
    agent any
environment {
       AWS_DEFAULT_REGION = 'ap-south-1'
    }
stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/deepa230/Terraform_Ansible.git'
            }
        }
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
                ansiblePlaybook credentialsId: 'privatekey', disableHostKeyChecking: true, installation: 'ansible', inventory: 'dynamicinventory.py', playbook: 'main.yml'
            }
        }
    }
}
