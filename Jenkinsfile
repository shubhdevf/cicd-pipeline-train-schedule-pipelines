pipeline {
    agent { 

    docker {image 'node:carbon'}
     } 
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
    stage("Running"){
        steps{
            sh label: '', script: 'npm start'

        }
    }

    }
}