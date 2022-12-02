# Output file

output "vpc_id" {
  description = "Display the vpc id"
  value       = aws_vpc.demo-vpc.id

}