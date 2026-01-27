# IAM Engineer User — Day 2

Date: Jan 22, 2026  
Account: Personal AWS account  
Role simulated: Junior Cloud Engineer

## Why IAM Users Exist

IAM users are created for daily engineering work so the root account is not used.
This limits risk and reduces the blast radius if credentials are compromised.
Root access is reserved for billing, security, and emergency actions only.

## Identity Used

- IAM user: engineer
- MFA enabled using authenticator app
- Root account not used for daily operations

## Permissions Granted

The engineer user is a member of the engineers-basic group with the following permissions:

- AmazonEC2ReadOnlyAccess
- AmazonS3ReadOnlyAccess
- CloudWatchReadOnlyAccess

## Permissions Intentionally Denied

The engineer user does not have permissions to:

- Launch or modify EC2 instances
- Create or modify networking resources
- Manage IAM users or roles
- Access billing or cost settings

These restrictions enforce least-privilege access.

## Observed Permission Boundary

While logged in as the engineer user, I attempted to perform EC2 actions beyond read-only access.
The AWS console returned AccessDenied and API error messages.
This confirms that least-privilege permissions are enforced correctly.

## Reflection

Encountering permission errors is expected and indicates correct security configuration.
This reinforces the importance of verifying identity and permissions before taking action in AWS.



