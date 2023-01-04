pipeline {
  agent any
  stages {
    stage('Build Container') {
      steps {
        sh '''cd Containers/simple-flask-app
docker build -t simple-flask-app:latest .'''
      }
    }

  }
}