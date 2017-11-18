#!/bin/bash

while true; do
    read -p "Do you wish to install programes for smart dato? If yes, please add your public key to Bitbucket first (https://bitbucket.org/account/user/YarnSeemannsgarn/ssh-keys/) !" yn
    case $yn in
        [Yy]* )
            
	    mkdir -p $SMART_DATO_DIR
            cd $SMART_DATO_DIR

            ###################
            ### Onlinestore ###
            ###################

            # Sstp
            sudo add-apt-repository -y ppa:eivnaes/network-manager-sstp
            sudo apt-get -y update
            sudo apt-get -y install sstp-client network-manager-sstp network-manager-sstp-gnome

            ################
            ### MT SPORT ###
            ################

            . $DIR/docker_inst.sh

            sudo apt-get -y install phppgadmin

            sudo apt-get -y install filezilla

            hg clone ssh://hg@bitbucket.org/smartdato/mt-sport-odoo
	        
	    break;;
	    
        [Nn]* ) exit;;
	    * ) echo "Please answer yes or no.";;
    esac
done
