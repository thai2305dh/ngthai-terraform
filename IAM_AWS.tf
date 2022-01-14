# provider "aws" {
#   region     = "us-east-2"
#   access_key = "*****"
#   secret_key = "****"
# }
#Dinh nghia IAM va nhom
resource "aws_iam_user" "user1" {
    name = "user1"
}

resource "aws_iam_user" "user2" {
    name = "user2"
}

resource "aws_iam_group" "ec2-container-registry-power-user-group" { #group ve EC2 instance
    name = "ec2-container-registry-power-user-group"
}

#Gan users cho group
resource "aws_iam_group_membership" "assigment" {
    name =  "assigment"
    users = [
        aws_iam_user.user1.name,
        aws_iam_user.user2.name
    ]
    group = aws_iam_group.ec2-container-registry-power-user-group.name
}

#Attach
# resource "aws_iam_policy_attachment" "attachment" {
#     name = "attachment"
#     groups = [aws_iam_group.ec2-container-registry-power-user-group.name]
#     policy_arn = "arn:aws:iam:aws:policy/AmazonEC2ContainerRegistryPowerUser"
# }

resource "aws_iam_account_password_policy" "stric"{
    minimum_password_length  = 8
    require_lowercase_characters = true
    require_numbers = true
    require_uppercase_characters = true
    require_symbols = true
    allow_users_to_change_password = true
}