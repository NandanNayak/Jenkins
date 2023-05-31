pipeline {
    agent any
    stages {
        stage("Build") {
            failFast(true)

            parallel {
                stage("Build phase 1") {
                    steps {
                        echo "This is Build phase 1"
                    }
                }

                stage("Build phase 2") {
                    steps {
                        echo "This is Build phase 2"
                    }
                }
            }
        }

        stage("Test") {
            steps {
                echo "This is test phase."

//                 script {
//                     if (Math.random() > 0.5) {
//                         throw new Exception()
//                     }
//                 }
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
