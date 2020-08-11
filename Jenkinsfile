pipeline {
    agent { label 'SSO-1' } 

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
        }
       } 
        stage("Modifying XML"){
                steps{
                echo "Trying to modify the XML"

                script{

                    def xmlman = new devfactory.xml.xmlManipulator()
                    xmlman.modifyXML('''<Project Sdk="Microsoft.NET.Sdk">

                                      <PropertyGroup>
                                        <TargetFramework>netstandard2.0</TargetFramework>
                                        <PackageId>UplandOne.Bitbucket</PackageId>
                                        <Version>1.0.0</Version>
                                        <Company>Upland Software</Company>
                                        <GeneratePackageOnBuild>true</GeneratePackageOnBuild>
                                      </PropertyGroup>

                                      <ItemGroup>
                                        <PackageReference Include="Microsoft.Extensions.Configuration" Version="2.2.0" />
                                        <PackageReference Include="Newtonsoft.Json" Version="12.0.1" />
                                        <PackageReference Include="NLog" Version="4.6.4" />
                                      </ItemGroup>
                                      </Project>''', "1.2.0")
                }
            }
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


