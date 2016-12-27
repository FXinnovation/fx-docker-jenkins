node {
    stage('checkout') {
      git url: "git@gitlab.com:adopt-docker/jenkins.git", credentialsId: 'bbfe8ee7-b4a0-4d6e-a3dc-9a30aefd3902'
      sh "GIT_COMMIT = \$(git rev-parse HEAD)"
      sh "echo \$GIT_COMMIT"
    }
    stage('pre-build') {
      sh 'gcloud --version'
      sh 'docker --version'
    }
    stage("build") {
      sh "docker build -t gcr.io/adopt-continuous-integration/jenkins:\$GIT_COMMIT ."
    }
    stage("publish") {
      sh "gcloud docker -- push gcr.io/adopt-continuous-integration/jenkins:\$GIT_COMMIT"
    }
    stage("cleaning") {
      sh "docker images |grep \"gcr.io/adopt-continuous-integration/jenkins\" |grep \$GIT_COMMIT | awk '{print \$3}' | xargs docker rmi -f" 
    }
}
