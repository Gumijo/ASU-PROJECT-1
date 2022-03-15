# ASU-PROJECT-1
ASU Cybersecurity Bootcamp Project 1

## Automated ELK Stack Deployment
The files in this repository were used to configure the network depicted below.

 Diagrams/AoiResource+Elk.drawio.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Elk-vm.yml file may be used to install only certain pieces of it, such as Filebeat.

  Ansible/Elk-vm.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

_Load balancers protect us against distributed denial of service attacks. It can also provide a encrypted link between a web server and the web._

_Having am jump box in placed also helps protecting our web servers. if set up correctly, only allowed admins will be able to remote to the web servers from specific computers and logins, something different will be immediately denied_

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- _Filebeat helps us to centralize logs and files from any device, in this case for our VMs_
- _Metricbeat helps us collect metrics on any device, from the operating system and running services_

The configuration details of each machine may be found below.

| Name                 | Function                          | IP Address | Operating System |
|----------------------|-----------------------------------|------------|------------------|
| Jump-Box-Provisioner | Gateway                           | 10.0.0.4   | Linux            |
| Web-1                | Web Server                        | 10.0.0.5   | Linux            |
| Web-2                | Web Server                        | 10.0.0.6   | Linux            |
| Elk-VM               | Application Server for Monitoring | 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet.

Only the Jump Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _Kibana port 5061_

Machines within the network can only be accessed by Jump-box-Provisioner.
- _10.0.0.4_

A summary of the access policies in place can be found in the table below.

| Name                 | Publicity Accessible | Allowed IP Address |
|----------------------|----------------------|--------------------|
| Jump-Box-Provisioner | Yes                  | 20.115.5.45        |
| Web-1                | No                   | 10.0.0.5           |
| Web-2                | No                   | 10.0.0.6           |
| Elk-VM               | No                   | 10.1.0.5           |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because there is less room for errors, and the timeline is way shorter than do it manually. Everything of course, if you have set up your playbook properly.

The playbook implements the following tasks:
  -Install docker.io
  -Install python3.pip3
  -Install docker module
  -Increase virtual memory
  -Use more memory
  -Download and launch a docker elk container
  -Enable service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
- _Web-1 10.0.0.5_
- _Web-2 10.0.0.6_

We have installed the following Beats on these machines:
- _Filebeat_
- _Metricbeat_

These Beats allow us to collect the following information from each machine:
- _Filebeat help us collect logs from our VM's, like syslog, that can help ups see successfully or unsuccessfully attempts to remote into our VM's_
- _Metricbeat helps us collect metrics from our VM's, such as CPU usage and memory usage"_

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:

SSH into the control node and follow the steps below:
- Copy the Playbook file to Ansible. (You can also create the playbook directly on Ansible if desired)
- The playbook use it this project is Ansible/Elk-vm.yml, it should be copy here /etc/ansible# you can create subfolders if desired. Remember that on out playbook we must specify the VM's group we want this to applied (webservers or elk for this project)
- Modify the hosts file to add your webservers and elk VMs, the file can be located in /etc/ansible/hosts. It can be modify by using nano command.
 _/etc/ansible# nano hosts_
  - Adding your VMs should be like this:

  [webservers]
  
  10.0.0.6 ansible_python_interpreter=/usr/bin/python3
  10.0.0.5 ansible_python_interpreter=/usr/bin/python3

  [elk]
  
  10.1.0.5 ansible_python_interpreter=/usr/bin/python3

  You can test it out by using the following command:
  ansible webservers -m ping
  ansible elk -m ping

  if response is "SUCCESS" it has been set up correctly.

- Run the playbook with the following command: ansible-playbook Elk-vm.yml
- navigate to Kibana http://[Elk-VM public ip]:5601/app/kibana#/home to check that the installation worked as expected

Resources:

docs.ansible.com. (n.d.). Intro to playbooks — Ansible Documentation. [online] Available at: https://docs.ansible.com/ansible/latest/user_guide/playbooks_intro.html.
Avi Networks. (n.d.). Load Balancing 101 - Learn All About Load Balancers. [online] Available at: https://avinetworks.com/what-is-load-balancing/#:~:text=Load%20Balancing%20plays%20an%20important [Accessed 15 Mar. 2022].
