# Install elasticsearch

## Step 1: Update CentOS 7 Linux
The server you’re working on should be updated before you install ElasticSearch 7.x on CentOS 7. Just run the commands below to update it.

    sudo yum -y update
    sudo reboot

## Step 2: Install Java on CentOS 7
ElasticSearch requires Java installed for it to run. The default Java installable on CentOS 7 is Java 8. Here are the commands to use for the installation.

    sudo yum -y install java-1.8.0-openjdk  java-1.8.0-openjdk-devel

Set Java home

    cat <<EOF | sudo tee /etc/profile.d/java8.sh
    export JAVA_HOME=/usr/lib/jvm/jre-openjdk
    export PATH=\$PATH:\$JAVA_HOME/bin
    export CLASSPATH=.:\$JAVA_HOME/jre/lib:\$JAVA_HOME/lib:\$JAVA_HOME/lib/tools.jar
    EOF

Source created file to update your environment.

    source /etc/profile.d/java8.sh

## Step 3: Add ElasticSearch Yum repository
Add the repository for downloading ElasticSearch 7 packages to your CentOS 7 system.

    cat <<EOF | sudo tee /etc/yum.repos.d/elasticsearch.repo
    [elasticsearch-7.x]
    name=Elasticsearch repository for 7.x packages
    baseurl=https://artifacts.elastic.co/packages/oss-7.x/yum
    gpgcheck=1
    gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
    enabled=1
    autorefresh=1
    type=rpm-md
    EOF

If you want to install Elasticsearch 6, replace all occurrences of 7 with 6. Once the repository is added, clear and update your YUM package index.

    sudo yum clean all
    sudo yum makecache

## Step 4: Install ElasticSearch 7 on CentOS 7
Finally install ElasticSearch 7.x on your CentOS 7 machine. Note that we’ve added an open source repository. Commercial flavor is available on the other repository.

    sudo yum -y install elasticsearch-oss

Confirm ElasticSearch 7 installation on CentOS 7:
    
    rpm -qi elasticsearch-oss

## Configure Java memory Limits
You can set JVM options like memory limits by editing the file: /etc/elasticsearch/jvm.options
Example below sets initial/maximum size of total heap space

    $ sudo vi /etc/elasticsearch/jvm.options
    .....
    -Xms1g
    -Xmx1g
If your system has less memory, you can configure it to use small megabytes of ram.

    -Xms256m
    -Xmx512m
Start and enable elasticsearch service on boot:

    sudo systemctl enable --now elasticsearch

Confirm that the service is running.

    $ sudo systemctl status elasticsearch

Check if you can connect to ElasticSearch Service.

    [root@localhost ~]# curl http://127.0.0.1:9200 
    {
    "name" : "localhost.localdomain",
    "cluster_name" : "elasticsearch",
    "cluster_uuid" : "ysrAyMV0SverO2gFD7mASw",
    "version" : {
        "number" : "7.9.0",
        "build_flavor" : "oss",
        "build_type" : "rpm",
        "build_hash" : "a479a2a7fce0389512d6a9361301708b92dff667",
        "build_date" : "2020-08-11T21:36:48.204330Z",
        "build_snapshot" : false,
        "lucene_version" : "8.6.0",
        "minimum_wire_compatibility_version" : "6.8.0",
        "minimum_index_compatibility_version" : "6.0.0-beta1"
    },
    "tagline" : "You Know, for Search"
    }


## Enable remote connection
    
    vi /etc/elasticsearch/elasticsearch.yml

Add following

    network.host: 0.0.0.0

    cluster.initial_master_nodes: []

Allow in firewall

    sudo firewall-cmd --add-port=9200/tcp --permanent
    sudo firewall-cmd --reload
