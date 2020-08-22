# Install mariadb for magento2

### Step 1 — Installing MariaDB
We’ll use Yum to install the MariaDB package, pressing y when prompted to confirm that we wish to proceed:

    sudo yum install mariadb-server

Once the installation is complete, we’ll start the daemon with the following command:

    sudo systemctl start mariadb

systemctl doesn’t display the outcome of all service management commands, so to be sure we succeeded, we’ll use the following command:

    sudo systemctl status mariadb

Next, let’s take a moment to ensure that MariaDB starts at boot, using the systemctl enable command, which will create the necessary symlinks.

    sudo systemctl enable mariadb

### Step 2 — Securing the MariaDB Server

MariaDB includes a security script to change some of the less secure default options for things like remote root logins and sample users. Use this command to run the security script:

    sudo mysql_secure_installation


# Granting User Connections From Remote Hosts
    CREATE USER 'magento'@'%' IDENTIFIED BY 'magento';
    GRANT ALL PRIVILEGES ON *.* TO 'magento'@'%';
    FLUSH PRIVILEGES;


Port 3306 is Configured in Firewall
One more point to consider whether the firwall is configured to allow incoming request from remote clients:

On RHEL and CentOS 7, it may be necessary to configure the firewall to allow TCP access to MySQL from remote hosts. To do so, execute both of these commands:

    firewall-cmd --add-port=3306/tcp 
    firewall-cmd --permanent --add-port=3306/tcp
    firewall-cmd --reload


# To Improve MariaDB Performance

## Avoid Swappiness in MySQL
By default the option is enabled:

    # sysctl vm.swappiness 

    vm.swappiness = 60
To disable swappiness, run the following command:

    # sysctl -w vm.swappiness=0

### innodb_buffer_pool_size

Generally, set to 60% – 70% of your total RAM as a starting point.
It does not need to be set any larger than the total database size.

     innodb_buffer_pool_size = 1G

### innodb_log_file_size

This is generally set between 128M – 2G.
It does not need to be any larger than the buffer pool.

### innodb_flush_log_at_trx_commit

Setting to “1” (default in 5.7) gives the most durability.
Setting to “0” or “2” will give more performance, but less durability.

### innodb_flush_method

Setting this to O_DIRECT will avoid the performance penalty from double buffering.


### innodb_file_per_table

Setting this to “ON” will generate an independent InnoDB table space for every table in the database.
    
    innodb_file_per_table=1

### innodb_stats_on_metadata

Setting this to “OFF” avoids unnecessary updating of InnoDB statistics and can greatly improve read speeds.

### innodb_buffer_pool_instances

A best practice is to set this to “8” unless the buffer pool size is < 1G, in which case set to “1”.
### query_cache_type & query_cache_size

Setting both of these to “0” will entirely disable the query cache.


# Sample for mysql performance
    
    skip-name-resolve = 1
    query_cache_size = 128M
    query_cache_type = 0
    query_cache_limit = 1M
    thread_cache_size = 4
    performance_schema = ON
    innodb_buffer_pool_size = 2G
    innodb_log_file_size = 1G
    innodb_buffer_pool_instances = 8  
    innodb_log_buffer_size = 16M
    max_connections = 300     
    join_buffer_size = 512M
    log-warnings=2
    table_open_cache = 36960
    open_files_limit = 73920
    tmp_table_size = 64M
    max_heap_table_size = 64M
    max_allowed_packet = 512M

## To enable log file
    [mariadb]
    log_error=/var/log/mysql/mariadb.err
    general_log
    general_log_file=/var/log/mysql/mariadb.log
    slow_query_log
    slow_query_log_file=/var/log/mysql/mariadb-slow.log
    long_query_time=5

    