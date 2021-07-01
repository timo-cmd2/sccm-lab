# sccm-lab
Some of my scripts, regfiles, gpos and miscellaneous files for my sccm testing lab

- setup winsrv 2012 R2 iso
- custom packaging logic using wget and yaml
- setup mssql server
- testing environment using vagrant 
- deployment on unreachable client will end with a wake-on-lan forcer
- more to follow **wip**...

## Concepts I'm trying to get work

- SAP 32bit on Ubuntu
- Custom Office deployments
- Testing PXE-boot on docker images
- deployment on unreachable client will end with a wake-on-lan forcer
- Managing fake clients using docker and sccm collections with wmi filters
- Deployment (install/uninstall) with docker
- Serverless Distribution-Points
  - **No local package storage** using wget and cURL/temp

## A sample SCCM package

```yaml
name: Foopackage
description: A sample SCCM package with serverless arch and yaml
manufacturer: Timo Sarkar 

# optional
language: English

# optional
version: 0.0.1

# Fixme: global vars for currentdir
targetfiles:
  install: "#CURRENTDIR#/installer.exe"
  uninstall: "#CURRENTDIR#/uninstall.exe"

commands:
  install:
    name: "#CURRENTDIR#/installer.exe"
    arguments: "/silent /norestart"

  uninstall:
    name: "#CURRENTDIR#/uninstall.exe"
    arguments: "/silent /norestart"

knownerrcodes:
  success: 0, 310
```

### Filestructure

```
./samplepackage
├─── ./installer.exe 
├─── ./uninstall.exe
├─── ./Package.yaml
└─── ./Scaffold.ps1
```

## Architecture 

**./samplepackage** is just the root folder, where the wget client fetched the sources. **Installer.exe** and **uninstall.exe** are the program's installation executables, which are used for the installation. **Package.yaml** is the serialization file for fetching important indexed strings quickly. It is the main configuration file for a sccm package in my env. At point of distribution, you do not need to touch this file cuz it's beeing managed by the **Scaffold.ps1** Scaffold.ps1 contains all of the deployment methods, used to deliver the package to the end users.

## Usage with a task-sequence

In the case, when you wan't to stage a computer from base pxe, you will need to create a seperate task-sequence with the sources of the wget registries. After choosing pxe in the boot menu, the computer will fetch the windows NT drivers and then you will be prompted by the task wizard. After completing the authentication, the NT will switch to the base image and will install the wget regs by using **scaffold.ps1**. All sources are beeing fetched from the official wget registries and are not stored on the distribution point locally.

> Note: All of the above ideas are still just concepts. I am working on the core logic, so don't expetc too much yet!

## Licensing

Copyright (C) 2020 - 2021 Timo Sarkar <sartimo10@gmail.com>
