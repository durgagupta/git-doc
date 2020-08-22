# PHP-7.3 - PROD instance

## To fix yum-config-manager command not found error
    yum install yum-utils



## Failed to set locale, defaulting to C warning message on CentOS Linux when running yum    

To set i18n stuff CentOS/Fedora and RedHat Enterprise Linux call a special script called /etc/profile.d/lang.sh. Make sure this file exist in your system:

    ls -l /etc/profile.d/lang.sh

If file exist just call it:

    source /etc/profile.d/lang.sh

Verify that LANG and LC_* shell variable are set:

    echo "$LANG"
    echo "$LC_CTYPE

## install Nginx

#### Step One—Add Nginx Repository
To add the CentOS 7 EPEL repository, open terminal and use the following command:

    sudo yum install epel-release

## Remove php-fpm if alrady installed

    sudo systemctl stop php-fpm

    sudo yum remove php-*

## Enable Additional Software Repositories
By default, the yum package manager does not include access to the repositories that store the PHP packages. Therefore, you need to enable access to these software packages.

First, start by installing the yum-utils package by entering the following command in a terminal window:

    sudo yum install yum-utils –y

Then, enable the epel-release repository by entering the following:

    sudo yum install epel-release –y

Finally, add the following software repositories that contain the PHP packages:

    sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm


## Add repo packace for 
    yum-config-manager --enable remi-php73
    yum --enablerepo=remi,remi-php73 install php php-fpm php-common -y
    yum --enablerepo=remi,remi-php73 install -y php-opcache php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongodb php-pecl-redis php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml php-pecl-zip php-intl  ext-soap php-bcmath php-imap php-soap



## FPM Config

    vi /etc/php-fpm.d/www.conf

remove following lines

    ;user = apache
    ;group = apache
    ;listen = 127.0.0.1:9000

add following lines

    listen = /var/run/php-fpm/php-fpm.sock
    user = nginx
    group = nginx
    listen.owner = nginx
    listen.group = nginx
    listen.mode = 0660


php_flag[suhosin.session.cryptua]=off
php_flag[session.auto_start]=off
php_value[max_execution_time]=18000
php_value[memory_limit]=8096M
php_flag[engine]=off
php_value[max_input_vars] = 10000


## php.ini Config

sudo vi /etc/php.ini

memory_limit = 5120M
post_max_size = 128M
upload_max_filesize = 16M
