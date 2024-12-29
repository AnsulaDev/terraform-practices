

resource "aws_route53_zone" "kubevpro" {
    name = "kubevpro.ansula.xyz"  # The domain name you want for the hosted zone (ensure it ends with a dot)

    comment = "My Hosted Zone for kubevpro.ansula.xyz"
}

output "hosted_zone_id" {
    value = aws_route53_zone.kubevpro.id
}
