library identifier: 'shared-libraries-test@master', retriever: modernSCM([$class: 'GitSCMSource', credentialsId: 'rdsystems-jenkins', remote: 'https://bitbucket.org/uplandsoftware/shared-libraries-test.git', traits: [gitBranchDiscovery()]])

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
            VERSION_SUFFIX = getVersionSuffix rcNumber: ${VERSION_RC}, isReleaseCandidate: ${RC}
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


