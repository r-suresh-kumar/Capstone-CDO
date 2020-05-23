pipeline  {
    environment {
            DOCKER_IMAGE = ''
            TAG = "1.0"
            DOCKER_REPO = "rsureshk/cloud-devops-capstone-project"
            DOCKER_CREDS = credentials('dockerhub')

            K8_CONFIG_FILE = 'k8-deployment-config.yml'
            CLUSTER = 'capstone-cluster'
            REGION = 'us-west-2'
        }    

    agent any
        options {
            timestamps()
        }        
  
    stages  {  
       stage('Initialize') {
            steps {
                sh '''
                    chmod +x ./scripts/*.sh
                    docker pull hadolint/hadolint
                '''
                   }
            }

       stage('Lint HTML') {
             steps {
                     sh 'tidy -q -e static-html-directory/*.html'
                   }
             }
            
            
        stage('Build Image') {
            steps {
                script {
                    sh './scripts/build-docker-image.sh'
                }
            }
        }      
        
        stage('Upload Image') {
            steps {
                script {
                    sh './scripts/upload-docker-image.sh'
                }
            }        
        }

        stage('Create Cluster') {
            when {
                beforeInput true
                branch 'initialize-cluster'
            }
            input {
                message 'Proceed with cluster creation?'
                ok 'Yes, create cluster.'
            }
            options {
                retry(2)
            }
            steps {
                script {
                    withAWS(credentials: 'aws-credentials', region: REGION) {
                        sh '''
                            ./scripts/get-docker-image.sh
                            ./scripts/k8-initialize-cluster.sh
                        '''
                    }
                }
            }
            post {
                success {
                    withAWS(credentials: 'aws-credentials', region: REGION) {
                        sh './scripts/k8-init-logging.sh'
                    }
                }
            }
        
                
        
    }
  }
