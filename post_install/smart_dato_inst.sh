#!/bin/bash

while true; do
    read -p "Do you wish to install programes for smart dato? If yes, please add your public key to Bitbucket first (https://bitbucket.org/account/user/YarnSeemannsgarn/ssh-keys/) !" yn
    case $yn in
        [Yy]* )
            
	        mkdir -p $SMART_DATO_DIR

	        #############
	        ### Omest ###
	        #############
	        
	        cd $SMART_DATO_DIR

	        git clone git@bitbucket.org:smartdato/omest.git
	        
	        sudo apt-get -y install php

	        sudo apt-get -y install mysql-server

	        # sudo apt-get -y install sqlite3

	        # sudo apt-get -y install sqlitebrowser

	        # sudo apt-get -y install lighttpd 

	        sudo apt-get -y install php-mbstring

	        sudo apt-get -y install php-xml

	        sudo apt-get -y install nodejs

	        sudo apt-get -y install npm

	        sudo apt-get -y install php-zip

	        sudo apt-get -y install php-mcrypt

	        sudo apt-get -y install php-mysql

	        sudo apt-get -y install nodejs

	        sudo apt-get -y install nodejs-legacy 

	        sudo apt-get -y install php-gd

	        sudo apt-get -y install php-gettext

	        sudo apt-get -y install php-soap

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
	        sudo phpenmod php-mbstring 

	        sudo a2enconf phpmyadmin

	        sudo service apache2 restart

            # Composer and npm
	        . $DIR/composer_inst.sh

	        cd $SMART_DATO_DIR/omest/www

	        composer install

            npm install

            # SOAP UI

            . $DIR/soap_ui_inst.sh

            sudo apt-get -y install filezilla 

	        ##########################
	        ### Onlinestore - Odoo ###
	        ##########################

	        sudo apt-get -y install postgresql

	        # Odoo
	        wget -O - https://nightly.odoo.com/odoo.key | sudo apt-key add -
	        sudo sh -c 'echo "deb http://nightly.odoo.com/9.0/nightly/deb/ ./" >> /etc/apt/sources.list'
	        sudo apt-get update
	        sudo apt-get -y install odoo

	        # Clone repository and configure
	        cd $SMART_DATO_DIR
	        git clone git@bitbucket.org:smartdato/onlinestore-odoo.git
	        cp odoo-server.conf.example odoo-server.conf

            read -p "Chrome must be installed manually =/ Press any key to continue... " -n1 -s
            read -p "Wkhtmltopdf must be installed manually to work for odoo =/ Follow the instructions on https://www.odoo.com/documentation/10.0/setup/install.html#deb. Press any key to continue... " -n1 -s
	        
	        break;;
	    
        [Nn]* ) exit;;
	    * ) echo "Please answer yes or no.";;
    esac
done

