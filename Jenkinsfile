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
            }
        }

        stage("Artifacts") {
            steps {
                writeFile(file: "test-results.txt", text: "passed")
                archiveArtifacts("test-results.txt")
            }
        }

        post {
            success{
                slackSend(channel: "#builds", color: "green", message: "build success")
            }
        }
    }
}
