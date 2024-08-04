output "vpc-id" {
 value = aws_vpc.main.id 
}

output "public_subnets_ids" {
  value = aws_subnet.public.*.id
}

output "app_subnets_ids" {
  value = aws_subnet.app.*.id
}

output "db_subnets_ids" {
  value = aws_subnet.db.*.id
}

output "web_subnets_ids" {
  value = aws_subnet.web.*.id
}

output "subnet" {
  value = tomap({
    "web" = aws_subnet.web.*.id
    "app" = aws_subnet.app.*.id
    "db"  = aws_subnet.db.*.id
    "public" = aws_subnet.public.*.id
  })
}