pipeline  {
    agent any
    stages  {
  
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
}
