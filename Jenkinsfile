node {
    stage('checkout') {
      git url: "git@gitlab.com:adopt-docker/jenkins.git", credentialsId: 'bbfe8ee7-b4a0-4d6e-a3dc-9a30aefd3902'
      commit_id = sh(returnStdout: true, script: "git rev-parse HEAD").trim()
      tag_id = sh(returnStdout: true, script: "git describe --tags --exact-match || git rev-parse HEAD").trim()
      println commit_id
      println tag_id
    }
    stage('pre-build') {
      sh 'gcloud --version && docker --version'
    }
    stage("build") {
      sh "docker build -t gcr.io/adopt-continuous-integration/jenkins:${tag_id} ."
    }
    stage("publish") {
      if(tag_id != commit_id){
        sh "gcloud docker -- push gcr.io/adopt-continuous-integration/jenkins:${tag_id}"
      }else{
        sh 'echo "This is not a tagged version, skipping publishing"'
      }
    }
    stage("cleaning") {
      sh "docker images |grep \"gcr.io/adopt-continuous-integration/jenkins\" |grep \"${tag_id}\" | awk '{print \$3}' | xargs docker rmi -f"
    }
}
