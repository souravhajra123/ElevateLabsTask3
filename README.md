# Provision a local Docker container using Terraform.

# 1. Launch an EC2 Instance using AWS Console
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/e9d95c458644533a8fce7cce7ed21b4d8fedb467/images/24.JPG)

# 2. Connect to the EC2 Instance and Update the Instance
```bash
sudo apt-get update
```
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/1.JPG)

# 3. Install Docker
```bash
nano docker.sh     # `ctrl+s` to save the file, `ctrl+x` to exit the nano editor mode
-------------------
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo apt-get install docker-compose -y
sudo usermod -aG docker ubuntu
sudo chmod 777 /var/run/docker.sock
newgrp docker
sudo systemctl status docker
-----------------------
bash docker.sh
docker --version
docker-compose --version
```
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/2.JPG)
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/3.JPG)

# 4. Install Git(not required for the task but you can push task related files to GitHub using Git commands)
```bash
sudo apt-get install git
git --version
```
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/4.JPG)

# 5. Install Terraform
```bash
nano terraform.sh    # `ctrl+s` to save the file, `ctrl+x` to exit the nano editor mode
-------------------
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform -y
----------------------
bash terraform.sh
terraform --version
```
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/5.JPG)
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/6.JPG)

# 6. Now create a directory, then go inside the directory and write .tf file to provision the docker container
```bash
mkdir TF
cd TF
nano main.tf   # `ctrl+s` to save the file, `ctrl+x` to exit the nano editor mode
cat main.tf    # to see the content inside main.tf
```
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/28251bde6e97f076047e88f375c5197d29248a98/images/7.JPG)

# 7. Now initialize terraform(it will read your code & based on your code it will download the modules or plugins in .terraform directory)
```bash
terraform init
```
# 8. Validate the code(it will check your code's syntax)
```bash
terraform validate
```
# 9. Plan(it will tell you what this code is going to do)
```bash
terraform plan
```
# 10. Apply the code(it will create the resources)
```bash
terraform apply --auto-approve
```
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/d2b410807b4a4f73fd6687d8044ea5cc44d9f7c6/images/8.JPG)
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/d2b410807b4a4f73fd6687d8044ea5cc44d9f7c6/images/9.JPG)
![image alt](https://github.com/souravhajra123/ElevateLabsTask3/blob/d2b410807b4a4f73fd6687d8044ea5cc44d9f7c6/images/10.JPG)













