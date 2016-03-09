jenkins Cookbook
================
To create a Jenkins instance using the cookbook, please follow the below steps:

1.Create a ubuntu 14.04 instance  with a disc space of minimum 10GB
2.Assuming that a chef-repo has already been setup, run the below command

knife-solo prepare ~/.ssh/private_key ubuntu@IPADDRESS

the above command will install chef-solo on the instance and create a node.json file with respect to the instance name in the nodes folder.Update it with run-list "recipe[Jenkins]".

3.Run the following command:
knife-solo cook ~/.ssh/private_key ubuntu@IPADDRESS

this will install Jenkins and the required tools and restore all the builds from the backup branch.To view the jenkins UI you can run the IP address to the Openstack instance

4.Host key verification:Though the private key has been placed in the ssh folder verification needs to be done.
         sudo su - jenkins
         ssh git.bestbuy.com

5.Setting the JAVA_HOME env variable: Click on manage Jenkins -> Configure system and then in the JDK section change the JAVA_HOME to /usr/lib/jvm/java-7-openjdk-amd64/ and then run the desired build.
