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
}
