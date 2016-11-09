#!/bin/bash
# Taken from https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md

EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
then
    php composer-setup.php --quiet
    RESULT=$?
    rm composer-setup.php
    sudo mv composer.phar /bin/
    sudo ln -s /bin/composer.phar /bin/composer
else
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
fi
