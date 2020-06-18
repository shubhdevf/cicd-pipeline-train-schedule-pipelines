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
            VERSION_SUFFIX = getVersionSuffix rcNumber: "${VERSION_RC}", isReleaseCandidate: "${params.RC}"
        }
        steps{
                dir("${env.WORKSPACE}/aspnetapp"){
                    sayHello 'John'
                    bat label: '', script: 'echo Building'
                    bat label: 'Restore Packages', script: 'nuget restore'
                    bat label: 'Compile Project', script: 'msbuild /p:Configuration=Release'
                }

                script {
                    def mygitfuncs = new devfactory.git.gitStuff()

                    echo "My commit: ${mygitfuncs("${env.WORKSPACE}/.git")}"

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


