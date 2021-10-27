pipeline {
    agent any

    stages {
        stage ('Clone') {
            steps {
                checkout scm
            }
        }

        stage ('Build docker image') {
            steps {
                script {
                    docker.build('pohomiy.jfrog.io/default-docker-local/alpine-curl:latest')
                }
            }
        }

        stage ('Push image to Artifactory') {
            steps {
                rtDockerPush(
                    serverId: "Artifactory",
                    image: "pohomiy.jfrog.io/default-docker-local/alpine-curl:latest",
                    targetRepo: 'default-docker-local',
                    // Attach custom properties to the published artifacts:
                    properties: 'project-name=docker-dummy;status=testing'
                )
            }
        }

        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "Artifactory"
                )
            }
        }
    }
}
