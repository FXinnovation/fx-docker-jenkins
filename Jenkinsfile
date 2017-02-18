node {
  dockerhub_repo = 'fxinnovation/terraform'
  ansiColor('xterm') {
    stage('checkout') {
      // Checking out scm
      checkout scm
      // Getting current commit sha1
      commit_id = sh(
        returnStdout: true,
        script: "git rev-parse HEAD"
      ).trim()
      // Getting current tag or commit sha1
      tag_id = sh(
        returnStdout: true,
        script: "git describe --tags --exact-match || git rev-parse HEAD"
      ).trim()
      // Getting scm url
      scm_url = sh(
        returnStdout: true,
        script: "git config --get remote.origin.url"
      ).trim()
    }
    stage('pre-build') {
      // Verifying docker is up and running
      sh 'docker --version && docker images'
    }
    stage("build") {
      // Building Docker Image
      sh "docker build \
           --build-arg \"VCS_REF\"=\"${commit_id}\" \
           --build-arg \"VERSION\"=\"${tag_id}\" \
           --build-arg \"BUILD_DATE\"=\"\$(date -u +\"%Y-%m-%dT%H:%M:%SZ\")\" \
           -t ${dockerhub_repo}:${tag_id} ."
    }
    stage("test") {
      // Testing Image Works
      sh "docker run ${dockerhub_repo}:${tag_id} version"
      sh "docker inspect ${dockerhub_repo}:${tag_id}"
    }
  }
}
