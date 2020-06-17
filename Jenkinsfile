pipeline {

    agent {  docker {image 'mcr.microsoft.com/dotnet/framework/sdk:4.8'} } 

    parameters{
        booleanParam(name: 'RC', defaultValue: false, description: 'Is this a Release Candidate?')
        }
    
    environment{
        VERSION = "0.1.0"
        VERSION_RC = "rc.2"
        }

    stages {

    stage("Building"){
        environment{
            VERSION_SUFFIX = getVersionSuffix()
        }
        steps{
                dir("${env.WORKSPACE}/aspnetapp"){
                    bat label: '', script: 'echo Building'
                    bat label: 'Restore Packages', script: 'nuget restore'
                    bat label: 'Compile Project', script: 'msbuild /p:Configuration=Release'
                }


        }
            
    }

    stage("Publish"){
        when{
            expression {return params.RC}
        }
        steps{
            echo "Published"
        }
    }
    }
}

String getVersionSuffix(){
    if (params.RC){
    return env.VERSION_RC
    }
    else{
    return env.VERSIOJ_RC + '+ci.' + env.BUILD_NUMBER
    }
}

