pipeline  {
    environment {
            DOCKER_IMAGE = ''
            TAG = "1.0"
            DOCKER_REPO = "rsureshk/cloud-devops-capstone-project"
            DOCKER_CREDS = credentials('dockerhub')

            K8_CONFIG_FILE = 'k8-deployment-config.yml'
            CLUSTER = 'PTT-capstone'
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
            steps {
                script {
                    withAWS(credentials: 'aws-credentials', region: REGION) {
                        sh '''
                            ./scripts/get-docker-image.sh
                            ./scripts/k8-create-cluster.sh
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
                
        stage('Deploy Cluster') {        
            steps {
                    withAWS(credentials: 'aws-credentials', region: REGION) {
                    sh './scripts/k8-deploy-cluster.sh'
                    }
                }
            post {
                success {
                    withAWS(credentials: 'aws-credentials', region: REGION) {
                        sh './scripts/k8-deployment-logging.sh'
                    }
                }
            }
        }

        stage('Delete Cluster') {        
            steps {
                    withAWS(credentials: 'aws-credentials', region: REGION) {
                    sh './scripts/k8-delete-cluster.sh'
                    }
                }
             }               
        }
    
    post {
        cleanup {
            sh 'docker rmi $DOCKER_REPO:$TAG'
        }
    }    
    
    
  }    
  
