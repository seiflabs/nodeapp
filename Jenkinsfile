pipeline {
    agent any
    
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
                docker tag nodeapp:latest seiflabs/nodeapp:latest
                docker push seiflabs/nodeapp:latest
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
               sh '''
               aws eks --region eu-west-3 update-kubeconfig --name k8maghraoui-cluster
               
               curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
               kubectl apply -f deploy.yml
               kubectl apply -f service.yml
               
               kubectl get svc
               '''
            }
        }
    }
}
