## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

/README/Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the repository file may be used to install only certain pieces of it, such as file beat.

  - Install-Elk.yml
  - filebeat-playbook.yml
  - metricbeat-playbook.yml
  - WebVM_Docker_Config.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redudant, in addition to restricting access to the network.
- By being highly redudant, the data stored in the Web VM servers should be available.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the network and system access.
- With Filebeat we can monitor the web VMs' logs to identify potentially suspicious patterns
- With Metricbeat we can monitor our web servers by gathering and analyzing the VMs stats and usage metrics

The configuration details of each machine may be found below.
| Name                 | Function   | IP Address              | OS    |
|----------------------|------------|-------------------------|-------|
| Jump_Box_Provisioner | Gateway    | 10.0.0.4/20.121.186.105 | Linux |
| Web-1                | Web Server | 10.0.0.5                | Linux |
| Web-2                | Web Server | 10.0.0.6                | Linux |
| Web-3                | Web Server | 10.0.0.7                | Linux |
| Elk-Server           | ELK Server | 10.1.0.4/40.122.74.62   | Linux |

### Access Policies

The web servers are on an internal network and are not exposed to the public Internet.

Only the Jump-Box-Provisioner and Elk-Server machines can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
 - 108.45.126.226

Machines within the network can only be accessed by using the gateway VM.
- The jump box's private IP can access, via SSH, all of the other VMs, and the jump box itself can be accessed only through the workstation's public IP address, 108.45.126.226.

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Address(es)   |
|----------------------|---------------------|--------------------------|
| Jump_Box_Provisioner | Yes                 | 108.45.126.226           |
| Web-1                | No                  | 10.0.0.4                 |
| Web-2                | No                  | 10.0.0.4                 |
| Web-3                | No                  | 10.0.0.4                 |
| Elk-Server           | Yes                 | 10.0.0.4; 108.45.126.226 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this allows the user to quickly deploy ELK to any number of machines and share the playbook so others can use it as well.

The playbook implements the following tasks:
- Install docker and the necessary infrastructure to run docker.
- Increase virtual memory to at least 262144.
- Download elk, specifcally sebp/elk:761.
- Enable docker to run on restart, so the user does not have to manually start the elk container in the future.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

/README/Images/Successful_Elk_Install.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 (10.0.0.4), Web-2 (10.0.0.5), and Web-3 (10.0.0.6)

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects and packages logs of the web servers' so we can see source IP addresses, OS, country, etc. enabling one to analyze traffic patterns and suspicious IPs/visitors.
- - Metricbeat collects usage metrics of the web servers themselves, showing the user statistics such as CPU usage, enabling one to analyze the strain on each VM to identify and mitigate potential issues faced by malicious actions (ex. DoS) or high traffic levels.
- 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
- Copy the configuration file to container.
- Update the configuration file to include the private IP of the machine the playbook will be installed run on.
- Run the playbook, and navigate to [ELK VM's public IP]:5601/app/kibana to check that the installation worked as expected.

## Commands to Download and Run the Ansible Containers
