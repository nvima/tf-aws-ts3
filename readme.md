# Teamspeak 3 Server on AWS EC2 with Terraform

This Terraform configuration launches an AWS EC2 instance with an attached EBS volume to host a Teamspeak 3 server.

## Requirements

- Terraform installed and configured for AWS
- AWS account with IAM user and access keys configured

## Usage

- `terraform apply -var mode=start -var password=test1234`
  Starts a new EC2 instance with an attached EBS volume and the Teamspeak 3 server installed.

- `terraform apply -var mode=stop -var password=test1234`
  Stops the EC2 instance and detaches the EBS volume, preserving the Teamspeak 3 server configuratioan (EBS).

- `terraform destroy -var mode=stop -var password=test1234`
  Destroys all resources, including the EC2 instance and the EBS volume. This will also delete the Teamspeak 3 server configuration.

## Costs

By stopping the EC2 instance and keeping the EBS volume, you can minimize the cost of running a Teamspeak 3 server on AWS when u dont need it. However, there will still be minimal charges for the EBS volume.

## Note

Stopping and starting the EC2 instance will result in a new public IP address being assigned. You may want to use an Elastic IP or a DNS provider to associate a static IP address with the instance.

For more information on how to use Telnet to create an admin token, see [this guide](https://hg-system.com/wp/de/ts3-teamspeak-3-server-admin-token-ueber-telnet-erstellen/).

Contributions, forks, and pull requests are welcome!

