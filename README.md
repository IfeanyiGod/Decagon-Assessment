# Decagon-Assessment

# PROJECT DESCRIPTION AND REQUIMENTS
A new FinTech company has worked on a web-based service that needs to be deployed on the public internet for their customers.

The project is written in Java with the following criteria.
Java Spring boot
It has some static content like HTML, CSS, images, and javascript.
The application needs to support sessions, cookies, and token-based tokenization.
It allows users to upload dynamic data to S3 buckets.
Database is Postgres 
We do a lot of logging
It has unit & integration testing
On the first deployment, the company expects the deployment to support 5000 concurrent users with the option of scaling up and down as needed. While we want to support 5000 concurrent users, we want to protect the system against any DDoS attack and expect important firewalls to be in place.

Your task:
Design all the needed infrastructure for the application and meets the above requirements. You should add diagrams to help explain your flow. Our cloud of choice is Amazon & Azure. 
Provide an example of Dockerfiles & any deployment scripts. You can use any dummy open source project as a sample. 

Your submission will be assessed based on the followings.
Simplicity and security
Maintainability of your code
Your documentation 
Cost 


# SOLUTION
The proposed architecture for the FinTech company's web-based service would be a combination of Amazon Web Services (AWS) and Azure. The following are the components required to meet the stated requirements:

1. Load Balancer: An application load balancer from AWS Elastic Load Balancer (ELB) or Azure Load Balancer can be used to balance the incoming traffic to multiple instances of the web application.

2. Web Application Server: The web application would be deployed on EC2 instances or Azure Virtual Machines (VMs) with Java and Postgres database. The VMs can be auto-scaled based on the traffic demands to handle the 5000 concurrent users.

3. S3 Buckets: AWS S3 buckets can be used to store the uploaded dynamic data. S3 is an object-based storage service and can store unlimited amounts of data.

4. Database: Postgres database can be deployed on RDS instances in AWS or Azure Database for PostgreSQL service in Azure. This would ensure high availability and scalability for the database.

5. Security Group: AWS Security Groups or Azure Network Security Groups can be used to control the incoming and outgoing traffic to the instances. This would help in protecting the system against DDoS attacks.

6. Docker: Docker containers can be used to package the application and its dependencies in a single unit, making it easier to deploy and manage. 

7. Deployment Scripts: AWS CodeDeploy or Azure DevOps can be used to automate the deployment of the Docker containers to the web application servers. The following is an example of a bash script to deploy the application:

8. Monitoring and Logging: AWS CloudWatch or Azure Monitor can be used to monitor the performance of the web application and the infrastructure. Logs can be stored in AWS CloudWatch Logs or Azure Log Analytics.

In conclusion, Terraform can be used to manage the infrastructure of this FinTech company's web-based service with ease and maintainability, meeting the requirements for security, simplicity, cost, and documentation. This architecture is simple, secure, maintainable, and cost-effective. The cost would depend on the number of instances, storage, and data transfer required.

