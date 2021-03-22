# VirtualBox Lab Setup

This repo contains automation for a faster standup of a Ubuntu virtualization server PC. This has been tested on Ubuntu Linux 20.10 on a physical PC. 

Step by step:
- On your personal computer, create a bootable USB flash drive of Ubuntu Linux 20.10 Groovy Gorilla.
- Plug monitor, power, keyboard, mouse, and ethernet into your new PC.
- Insert the bootable USB flash drive of Ubuntu 20.10 into your new PC.
- Boot into the installer software and install Ubuntu OS.
- Reboot and remove your USB flash drive.
- Log in and open a Terminal session.
- `sudo apt update`
- `sudo apt install xrdp -y`
- Check your IP address with `ip a`
- At this stage, remote into your Ubuntu computer from your host computer using RDP. 
- `sudo apt install git -y`
- `mkdir ~/github`
- `cd ~/github`
- `git clone https://github.com/lee5378/labsetup.git`
- `sudo bash ~/github/labsetup/labsetup.sh`

## Resources

- [AWS Security Blog: What is a cyber range and how do you build one on AWS?](https://aws.amazon.com/blogs/security/what-is-cyber-range-how-do-you-build-one-aws/)
  - You may alternatively wish to host these systems on AWS as EC2 instances. 
