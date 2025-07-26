pipeline {
    agent any

    stages {
        stage('Clone GitHub Repo') {
            steps {
                git branch: 'main', credentialsId: 'gitToken', url: 'https://github.com/SakibPendhari/TF-code.git'
            }
        }

        stage('Run TFLint') {
            steps {
                sh 'tflint --init && tflint --chdir=.'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -input=false'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -input=false -out=tfplan'
            }
        }

        stage('Approve or Reject Apply') {
            steps {
                script {
                    def userChoice = input(
                        message: 'Do you want to apply the Terraform plan?',
                        parameters: [
                            choice(
                                name: 'Action',
                                choices: ['Approve', 'Reject'],
                                description: 'Select whether to continue or stop the pipeline.'
                            )
                        ]
                    )

                    if (userChoice == 'Reject') {
                        echo "❌ Terraform apply was rejected by the user."
                        currentBuild.result = 'ABORTED'
                        error("Pipeline aborted due to user rejection.")
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -input=false tfplan'
            }
        }
    }

    post {
        success {
            echo '✅ Terraform pipeline completed successfully.'
        }
        aborted {
            echo '🚫 Pipeline was aborted by user during approval.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
