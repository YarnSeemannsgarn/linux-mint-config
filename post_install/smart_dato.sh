#!/bin/bash

while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* )
	    sudo apt-get -y install php

	    sudo apt-get -y install mysql-server

	    # sudo apt-get -y install sqlite3 

	    sudo apt-get -y install php-mbstring

	    sudo apt-get -y install php-xml

	    sudo apt-get -y install nodejs

	    sudo apt-get -y install npm

	    sudo apt-get -y install php-zip

	    sudo apt-get -y install php-mcrypt

	    sudo apt-get -y install php-mysql

	    sudo apt-get -y install nodejs

	    sudo apt-get -y install nodejs-legacy 

	    # sudo apt-get -y install sqlitebrowser

	    # sudo apt-get -y install lighttpd 

	    sudo apt-get -y install php-gd

	    # sudo apt-get -y install mysql-workbench

	    sudo apt-get -y install apache2 apache2-doc 

	    sudo apt-get -y install libapache2-mod-php

	    sudo a2dismod mpm_event
	    sudo a2enmod mpm_prefork

	    # Install newest phpMyAdmin from ppa (https://docs.phpmyadmin.net/en/latest/setup.html#ubuntu)
	    sudo add-apt-repository ppa:nijel/phpmyadmin
	    sudo apt-get update
	    sudo apt-get -y install phpmyadmin php-mbstring php-gettext
	    sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf

	    # Enable mods for apache
	    sudo phpenmod mcrypt
	    sudo php-mbstring php-gettext

	    sudo a2enconf phpmyadmin

	    sudo service apache2 restart
	    break;;
	
        [Nn]* ) exit;;
	* ) echo "Please answer yes or no.";;
    esac
done

