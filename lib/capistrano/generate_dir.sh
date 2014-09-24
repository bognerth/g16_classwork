#!/bin/bash
ssh tb@g16-hh.de 'mkdir /var/www/g16/classwork'
ssh tb@g16-hh.de 'mkdir /var/www/g16/classwork/shared'
ssh tb@g16-hh.de 'mkdir /var/www/g16/classwork/shared/config'
ssh tb@g16-hh.de 'mkdir /var/www/g16/classwork/releases'
scp ~/Dropbox/Rails/G16/g16_classwork/config/database.yml tb@g16-hh.de:/var/www/g16/classwork/shared/config/
scp ~/Dropbox/Rails/G16/g16_classwork/config/application.yml tb@g16-hh.de:/var/www/g16/classwork/shared/config/
