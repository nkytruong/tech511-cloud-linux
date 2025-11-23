# Linux

- [Linux](#linux)
  - [Why Learn Linux?](#why-learn-linux)
  - [What is Linux?](#what-is-linux)
  - [What is Bash?](#what-is-bash)
  - [What is a Shell?](#what-is-a-shell)
  - [Difference between Home and Root Directories](#difference-between-home-and-root-directories)
  - [Bash Script to Install Nginx](#bash-script-to-install-nginx)
  - [Managing Processes](#managing-processes)


## Why Learn Linux?
  
* Open-source & adaptable/flexible
* Inexpensive
  * RedHat Enterprise version of Linux - costs
* Fast-growing
* Stable
* Scales well for server tasks
* Becoming more popular for desktop/workstation use
* Often used in DevOps

## What is Linux?

* Spinoff off of Unix
* Made of a kernel (core OS), plus many libraries & utilities that rely on that kernel
* Many different distributions (we will use Ubuntu)

## What is Bash?

* Stands for Bourne Again Shell
* Type of shell
* The most commonly used shell in Linux
* Stored at: /bin/bash

## What is a Shell?

* Software/interface that runs the commands
* In Linux, there are a range of shells available

## Difference between Home and Root Directories

Home Directory
* The user's personal folder
* Default is you are taken straight there when you login
* On Linux, found here: 
    ```
    /home/<user's folder>
    ```

Root Directory
* "Final parent" in file/folder structure
* If you start a file/folder path with `/` you are saying the path starts in the root directory

## Bash Script to Install Nginx

[prov-nginx.sh](bash-scripts/prov-nginx.sh)


## Managing Processes

What is a Process?
* A program that loads in RAM/memory and uses CPU when needed

2 Types of Processes in Linux
* User
* System