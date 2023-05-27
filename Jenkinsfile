pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                echo "This is build phase."
            }
        }

        stage("Test") {
            steps {
                echo "This is test phase."

                script {
                    if (Math.random() > 0.5) {
                        throw new Exception()
                    }
                }
            }
        }

        stage("Artifacts") {
            steps {
                writeFile(file: "test-results.txt", text: "passed")
                archiveArtifacts("test-results.txt")
            }
        }
    }

    post {
        success{
            slackSend(channel: "#builds", color: "success", message: "build success")
        }

        failure {
            slackSend(channel: "builds", color: "danger", message: "build failure")
        }
    }
}
