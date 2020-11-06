# Virtualbox

Virtualbox is great for hosting home labs for learning cyber security systems and scenarios.

- Advantages:
  - No pay-as-you-go cloud overhead charges
  - Private interactions with computers on an isolated subnet
- Disadvantages:
  - Large hard disk footprint
  - No built-in automation or IAC
  - Taxing on host system resources, especially RAM

Another free virtualization manager is VMware Player. Both software support the OVA file format for handling portable virtual machines.

## Linux

Many Linux distributions (also known as "distros") do not come with a desktop graphical user interface (GUI) preinstalled. 

### How to install GNOME Desktop on CentOS 7

On a recent installation of Security Onion 2.3 I wanted to install **GNOME** and **Virtualbox Guest Additions**. It took some tinkering but eventually I landed on these steps.

- [Install GNOME on CentOS 7](https://www.techrepublic.com/article/how-to-install-a-gui-on-top-of-centos-7/)
- Install Virtualbox Guest Additions for the best experience. This will allow you to perform useful tasks such as copy-paste and drag-drop from host PC.
  - First run `yum install dkms gcc make kernel-devel bzip2 binutils patch libgomp glibc-headers glibc-devel kernel-headers -y`
  - You may need to run `yum install gcc perl make`
  - Then insert the Virtualbox Guest Additions CD and install guest additions.
  
## Windows

While Microsoft provides some developer testing images for the general public to use, I'd strongly recommend loading Windows directly from the ISO whenever possible.
