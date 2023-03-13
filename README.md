#
# A Fork of the Node-Red Slim Container
 Now based from Node18-slim
#
 Project was forked from Apline due to lagging updates that prevent Tensorflow from working.  

#
# Requires
#
* OS:Linux, MAC or Windows(WSL)
* Node 
* NPM
* docker, docker-compose

#
# Provides
#
* Node:18-Slim (Ubuntu Based)
* NodeJs > 18.14.0  
* nodered/node-red:latest-18-minimal
* apt-utils (Uninterrupted debconf builds)
* Tensorflow/tfjs 4.2.0 (using cocossd)
* (See package.json for more)

#
#  Demonstrates some useful design patterns 
#
* Included a MainUI Flow that Controls a TPLink Kasa HS10(x) device
* Toggle Device Button On|Off
* Toggle Detection Switch On|Off
* Time Clock 
* Results to List
* Button to Clear List
* Delayed clearing of Text Box

#
# 1st: Set in Node DoAction
#
context.kasaDevice = 'Set.Device.IP'; 
* Example
* context.kasaDevice = '10.10.0.5'; 

#
# Multi-Stage Docker | Ubuntu Based Image
#
Based on production ready images on `node18-slim`

## Usage
### Building Image & Run Script

```bash
./deploy.sh
```
The encrypted password is `password` (see .env.prod file), the current default password should be regenerated for deployment.

### Build and Run using `docker-compose` command

```bash
docker-compose build nodered-slim && docker-compose up
```

#### Build and Deploy to Docker Swarm
```bash
docker-compose build nodered-slim && docker stack deploy --compose-file docker-compose.yml wuttech
```