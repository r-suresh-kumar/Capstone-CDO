pipeline  {
        options {
        timestamps()
    }
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

        
    }
}
