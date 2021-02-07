# ---------------------------------------------------------------------------------------------------
# version  1.10
# Library: https://github.com/Frankie116/my-library.git
# outputs
# ---------------------------------------------------------------------------------------------------

# req:
# None


# 06b-route53-record-lb.tf ----------------------------------------------------------
output my-website-address {
  description  = "Full website addresss including port number"
  value        = " ${aws_route53_record.my-r53-record-lb.fqdn}"
}



# output ssh-server-details {
#   value        = " ssh ubuntu@${aws_instance.my-server[0].private_ip}"
# }



# 06d-route53-record-jumpbox.tf -----------------------------------------------------
output my-jumpbox-address {
  description  = "Full website addresss including port number"
  value        = [aws_route53_record.my-r53-record-jumpbox.*.fqdn]
}

output my-ansible-master-address {
  description  = "Full website addresss including port number"
  value        = [aws_route53_record.my-r53-record-ansible-master.*.fqdn]
}

output my-server-address {
  description  = "Full website addresss including port number"
  value        = [aws_route53_record.my-r53-record-server.*.fqdn]
}

output ssh-jumpbox-details {
  value        = "ssh -A ec2-user@my-jumpbox-01.${var.my-existing-r53-zone} -i ${var.my-private-key}.pem"
}

output ssh-ansible-master-details {
  value        = "ssh -A ubuntu@my-ansible-master23-01.${var.my-existing-r53-zone} -i ${var.my-private-key}.pem"
}

output ssh-server-details {
  value        = "ssh -A ubuntu@my-server-01.${var.my-existing-r53-zone} -i ${var.my-private-key}.pem"
}