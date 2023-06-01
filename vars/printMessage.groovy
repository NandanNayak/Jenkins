def call(Map config) {
    node {
        echo "${config.message}"
    }
}