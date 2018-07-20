# Ambari Blueprints Examples

A few blueprints that make it really easy to walk through a wizard and launch HDP clusters.

## List of Blueprints

1. Sandbox Equivalent - Very cheap blueprint to run something up in amazon to play with our stuff
2. Small Cluster - Likely 8-10 nodes that represent a standard cluster.
3. HA Cluster - likely 20 nodes with HA that represents a good start on a real production cluster.
4. Streaming Cluster - Deploys 10 nodes including Storm and Kafka
5. Spark Cluster - Deploys a std. 10 node cluster correctly configured with Spark on YARN on the cluster.

## Known Issues
- HA cluster is working in progress.

# Ambari on Docker

This projects aim is to help you to get started with Ambari.

> Please note that this project is not officially supported by Hortonworks and may not be suitable for production use. It can be used to experiment with Hadoop on Docker but for a complete and supported solution please check out [Cloudbreak](https://github.com/sequenceiq/cloudbreak).

## Install Docker

Follow the description at the docker getting started page for your appropriate OS: ([Linux](http://docs.docker.com/linux/started/), [Mac](http://docs.docker.com/mac/started/), [Windows](http://docs.docker.com/windows/started/))

### OSX
Ambari containers started by ambari-function are using bridge networking. This means that you will not be able to communicate with containers directly
from host unless you specify the route to containers. You can do this with:

```
# Getting the IP of docker-machine or boot2docker
docker-machine ip <name-of-docker-vm>
# or
boot2docker ip

# Setting up the
sudo route add -net 172.17.0.0/16 <docker-machine or boot2docker>
# e.g:
sudo route add -net 172.17.0.0/16 192.168.99.100
```
**Note:**  the above mentioned route command will not survive a reboot and you need to execute again after reboot of your machine.


## Starting containers

This will start (and download if you never used it before) an image based on
Centos 7 with pre-installed Ambari 2.2.0 ready to install HDP 2.3.

This git repository also contains an ambari-functions script
which will launch all the necessary containers to create a fully functional cluster. Download the file and source it:
```
. ambari-functions or source ambari-functions
```
Now you can issue commands with `amb-`prefix like:
```
amb-settings
```
To start a 3 node cluster:
```
amb-start-cluster 3
```
It will launch containers like this (1 Ambari server 2 agents 1 consul server):
```
CONTAINER ID        IMAGE                          COMMAND                  STATUS              NAMES
52b563756d26        hortonworks/ambari-agent       "/usr/sbin/init syste"   Up 9 seconds        amb2
ddfc8f00d30a        hortonworks/ambari-agent       "/usr/sbin/init syste"   Up 10 seconds       amb1
ca87a0fb6306        hortonworks/ambari-server      "/usr/sbin/init syste"   Up 12 seconds       amb-server
7d18cc35a6b0        sequenceiq/consul:v0.5.0-v6   "/bin/start -server -"    Up 17 seconds       amb-consul
```

Now you can reach the Ambari UI on the amb-server container's 8080 port. Type the `amb-settings` for IP:
```
amb-settings
...
AMBARI_SERVER_IP=172.17.0.17
```

## Cluster deployment via blueprint

Once the container is running, you can deploy a cluster. Instead of going to
the webui, we can use ambari-shell, which can interact with ambari via cli,
or perform automated provisioning. We will use the automated way, and of
course there is a docker image, with prepared ambari-shell in it:

```
amb-shell
```

Ambari-shell uses Ambari's [Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints)
capability. It posts a cluster definition JSON to the ambari REST api,
and 1 more json for cluster creation, where you specify which hosts go
to which hostgroup.

Ambari shell will show the progress in the upper right corner.

## Multi-node Hadoop cluster

For the multi node Hadoop cluster instructions please take a look at [Cloudbreak](http://hortonworks.com/hadoop/cloudbreak/).

If you don't want to check out the project from github, then just dowload the ambari-fuctions script, source it and deploy a
an Ambari cluster:
```
curl -Lo .amb j.mp/docker-ambari && source .amb && amb-deploy-cluster
```

## Experiments

[Sudo-Docker](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user).

[Blueprints](https://cwiki.apache.org/confluence/display/AMBARI/Blueprints#Blueprints-Introduction).

[Ambari-Shell](https://cwiki.apache.org/confluence/display/AMBARI/Ambari+Shell).

[HDP-documentation](https://docs.hortonworks.com/HDPDocuments/Ambari-2.6.0.0/bk_ambari-installation/bk_ambari-installation.pdf).

[Kerberos-troubles](https://community.hortonworks.com/questions/38357/enable-kerberos-via-ambari-blueprint.html).

[How-to](https://community.hortonworks.com/articles/47170/automate-hdp-installation-using-ambari-blueprints.html).

## Debug
starting an ambari cluster with: 11 nodes
[DEBUG] docker run -d --name amb-consul -h amb-consul.service.consul sequenceiq/consul:v0.5.0-v6 -server -bootstrap
10da30039cb5b8bbebeab25c9272a5ece68c74bf5849b45896d265081fb4e2ea
[DEBUG] docker run -d --privileged --name amb-server -h amb-server.service.consul hortonworks/ambari-server:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
36af5e54351812a44b45b0387c060ec6e1c450bf8770c1c2a2ceaf6c86abb560
truetrue[DEBUG] docker run -d --privileged --name amb1 -h amb1.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
8e1683f0dc9e99cd10a09a972be9281204e2901e2729efc89bd03c7326a62f63
true[DEBUG] docker run -d --privileged --name amb2 -h amb2.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
03b5b655128a181150f0bec159160cfefb2ade0f687f2fbad166918db053ddb8
true[DEBUG] docker run -d --privileged --name amb3 -h amb3.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
22901dae4ddbfb68a7cee051d57111be10cda3f6ffa7218dea0d38e64412054b
true[DEBUG] docker run -d --privileged --name amb4 -h amb4.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
4a56e402a42c1a6823f66f1c3dadf1fc7b277faa009c6c106013711aa4ebb235
true[DEBUG] docker run -d --privileged --name amb5 -h amb5.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
c8d5136ec0732736680fc3d50e054ab99ccb47d40772468d8ffd0924f819cf5d
true[DEBUG] docker run -d --privileged --name amb6 -h amb6.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
9d900d829500c242b2b3a16132efcd3ee899e609c9fff9056789780b8d3d3f70
true[DEBUG] docker run -d --privileged --name amb7 -h amb7.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
99c31514113c81163b14404c8c6d45b9fd6070eeda0456590f2938859c6f002d
true[DEBUG] docker run -d --privileged --name amb8 -h amb8.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
854e0cb0b54d0de930e895da117a48faaeb439642ba8f1716348f92bbf274fea
true[DEBUG] docker run -d --privileged --name amb9 -h amb9.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
32103a3c83fd65b2403ddc90915d1adecce27436cfe6c7cf504a0fed7c565686
true[DEBUG] docker run -d --privileged --name amb10 -h amb10.service.consul hortonworks/ambari-agent:latest systemd.setenv=NAMESERVER_ADDR=172.17.0.2
0d06f978f76d29101680c259c0909e8d079b70e7b5634a6ff78d33df4f3c2ebc
