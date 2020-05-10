pipeline  {
    agent any
    stages  {
      stage('Build')  {
        steps {
            sh 'echo "Hello World"'
            sh  '''
                echo "Multiline shell steps works too"
                ls -lah
                '''
               }
          }
   
    
       stage('Initialize') {
            steps {
                sh '''
                    chmod +x ./scripts/*.sh
                    docker pull hadolint/hadolint
                '''
            }
        }
        stage('Build Image') {
            steps {
                script {
                    sh './scripts/build-docker-image.sh'
                }
            }
   }    
          
   }
