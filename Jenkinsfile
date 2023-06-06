pipeline {
    agent any

    parameters {
        // Valid parameter types: [booleanParam, choice, credentials, file, text, password, run, string]
        booleanParam(name: "isPublishable", defaultValue: false, description: "Is the artifact publishable?")
    }

    // Global environment
    environment {
        GLOBAL_MSG = "This is a global variable."
    }

    stages {
        stage("Init") {
            // This environment is local to this stage
            environment {
                INIT_MESSAGE = initMessage()
            }
            steps {
                echo "${GLOBAL_MSG}"

                // Calls a function
                script {
                    echo "${INIT_MESSAGE}"
                }
            }
        }

        stage("Build") {
            // Among the two parallel stages, which ever individual stage fails, fails the entire stage
            failFast(true)

            parallel {
                stage("Build phase 1") {
                    steps {
                        //echo "This is Build phase 1."
                        printMessage("This is Build phase 1")
                    }
                }

                stage("Build phase 2") {
                    steps {
                        printMessage("This is Build phase 2")
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
            }
        }

        stage("Artifacts") {
            steps {
                // This create a file in workspace and artifacts it
                writeFile(file: "test-results.txt", text: "passed")
                archiveArtifacts("test-results.txt")
            }
        }

        stage("Publish") {
            when {
                expression { return params.isPublishable }
            }
            steps {
                printMessage("This is Publish phase")
            }
        }
    }

    post {
        success{
            // "good" is for green color
            slackSend(channel: "builds", color: "good", message: "build success")
        }

        failure {
            // "danger is for red color
            slackSend(channel: "builds", color: "danger", message: "build failure")
        }
    }
}

String initMessage() {
    return "This is Init phase"
}

void printMessage(String message) {
    echo "${message}"
}
