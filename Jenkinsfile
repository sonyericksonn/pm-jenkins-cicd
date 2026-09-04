pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = 'p1wnPE9MHBy2nWohwjG6'
        AWS_SECRET_ACCESS_KEY = '3q1zTNL2lxQyfB9OAoPgaCYbo1NAhoHL8E19tgvNr'
    }
    stages {
        stage('init') {
            agent {
                docker {
                    image 'hashicorp/terraform:1.9.8'
                    args '-u 0:0 --entrypoint=""'
                    
 
                }
            }
            steps {
                dir('Lab/proxmox/terraform') {
                    sh '''
                    terraform init -no-color
                    '''
                }
            }
        } 
    }  
}
