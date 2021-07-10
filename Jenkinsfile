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
         stage('Git') {
            steps {
                git branch: 'main', credentialsId: 'Git', url: 'https://github.com/deepa230/KubernetesDeploy.git'
            }
        }
        stage('Helm Package Creation') {
            steps {
                sh "helm create phpmyadmin"
                sh "rm -rf ./phpmyadmin/templates/*"
                sh "cp *.yaml ./phpmyadmin/templates/"
                sh "helm package phpmyadmin"
            }
        }
        stage('Deploy to K8s') {
            steps {
                sshagent(['Kubernetes']) {
                    sh '''
                    scp -o StrictHostKeyChecking=no ./*.tgz ubuntu@65.2.129.214:/home/ubuntu
                    scp -o StrictHostKeyChecking=no /home/ubuntu/linux-amd64/helm ubuntu@65.2.129.214:/home/ubuntu
                    ssh -t ubuntu@65.2.129.214 /bin/bash << 'EOF' 
                    sudo mv ./helm /usr/local/bin/ 
                    sudo chmod +x /usr/local/bin/helm 
                    export PATH=/usr/local/bin/:$PATH
                    helm upgrade --install phpmyadm ./*.tgz 
EOF
                     '''
                    }
            }
        }
    }
}
