# sccm-lab
Some of my scripts, regfiles, gpos and miscellaneous files for my sccm testing lab

- setup winsrv 2012 R2 iso
- custom packaging logic using wget and yaml
- setup mssql server
- testing environment using docker
- more to follow **wip**...

## Concepts I'm trying to get work

- SAP 32bit on Ubuntu
- Custom Office deployments
- Testing PXE-boot on docker images
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
```

## Licensing

Copyright (C) 2020 - 2021 Timo Sarkar <sartimo10@gmail.com>
