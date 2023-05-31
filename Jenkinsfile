pipeline {
    agent any
    stages {
        parallel {
            stage("Build type 1") {
                steps {
                    echo "This is build phase 1"
                }
            }

            stage("Build type 2") {
                steps {
                    echo "This is build phase 2"
                }
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
            slackSend(channel: "#builds", color: "green", message: "build success")
        }

        failure {
            slackSend(channel: "builds", color: "danger", message: "build failure")
        }
    }
}
