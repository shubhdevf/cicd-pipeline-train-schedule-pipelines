pipeline {
    agent { Dockerfile true } 
    
    stages {

    stage('Setting the stage'){
    
        steps{

            sh label: '', script: '''ls'''

        }
    }

    stage("Building"){
        steps{
                dir("${env.WORKSPACE}"){
                    sh label: '', script: 'npm install'
                }

        }
            
    }

    }
}
