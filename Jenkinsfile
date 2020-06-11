pipeline {
    agent {  docker {image 'mcr.microsoft.com/dotnet/framework/sdk:4.8'} } 
    
    stages {

    stage('Setting the stage'){
    
        steps{

            bat label: '', script: '''dir'''

        }
    }

    stage("Building"){
        steps{
                dir("${env.WORKSPACE}/aspnetapp"){
                    bat label: '', script: 'Building'
                    bat label: 'Restore Packages', script: 'nuget restore'
                    bat label: 'Compile Project', script: 'msbuild /p:Configuration=Release'
                }

        }
            
    }

    }
}
