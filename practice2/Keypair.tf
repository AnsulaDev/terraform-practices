# Define an AWS Key Pair resource
resource "aws_key_pair" "dove-key" {
    key_name   = "dove-key"  # Name of the key pair
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDuv1dR0xeaQ8dIo3Eb1RVD17NOhoZy3nOu5KZ7pQainnflIycedqcyIRp/b9IyHjOSUkcjYMCADgBpWCSQdZcJupKe1YwmgF28AdEy/77L9rLoR5RGRcAMYdu9YkvUr45+ue+KKdQWidbwNIzAOtgdxuvqwKSBtYWdDhEHFN6J7R70/DM8vv3htoCJDFGrj4hhJqpZ7a75ezCU6mNwvNVb64z/YkZqjqy2vG+7tF4edxr3HzYOVAP9eYwpBFpcn1xTQTsTsv3CaLFKMB14AmmAhsR75LJ3q0zPdBz2Y0NNlaNkRvzYJGPXMe/xmNlWDFZcdxGKR6+eU5EH5nYWuB7yghPnQaRigN3dCny7fZ/hmn//xb7iF9zLglePO2o5Abd3+zCmgMNSyhPrTWwQPWu2RGAHc/Eu2SqLibxNmKoxv8jBl9zezZRal855eoK6K05xntcM3EETI7vqPw5FdA3DT4gMc/NrdyLQzGwFxXB2qIPNtbb4G03jXjpRa4MvTQk= root@ubuntu-focal"  # Public key value
}
