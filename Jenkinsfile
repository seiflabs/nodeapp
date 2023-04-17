pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('docker_hub_creds')
	}
    stages {
        stage ('checkout') {
            steps {
            checkout([$class: 'GitSCM',
            branches: [[name: '*/main']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [[$class: 'CleanCheckout']],
            submoduleCfg: [],
            userRemoteConfigs: [[credentialsId: 'git-key', url: 'git@github.com:seiflabs/nodeapp.git']]
         ])
            }
        }
        stage('Build') {
            steps {
                sh '''
                #echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                echo "dckr_pat_aUI53BiZkGQUIRUWaAuvUqFFWNA" | docker login -u seiflabs --password-stdin
                docker build -t nodeapp .
                docker tag nodeapp:latest seiflabs/diteschool:0.0.10
                docker push seiflabs/diteschool:0.0.10
                '''
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
