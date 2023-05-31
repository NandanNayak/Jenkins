pipeline {
    agent any

    // Global environment
    environment {
        GLOBAL_MSG = "This is a global variable."
    }

    stages {
        stage("Init") {
            steps {
                // Calls a function
                String initMessage = init()
                echo "${initMessage}"
            }
        }

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
            environment {
                MESSAGE = "This is a test phase."
            }
            steps {
                // Accessing env variable in a shell script
                echo "${MESSAGE}"

                script {
                    // Accessing env variable in a Groovy script
                    System.out.println(env.GLOBAL_MSG)
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

String init() {
    return "This is Init phase."
}
