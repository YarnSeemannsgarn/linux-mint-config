#!/usr/bin/env python3

from os.path import expanduser
import json

home_path = expanduser('~')
chromium_config_file_path = home_path + '/.config/chromium/Default/Preferences'
download_path = home_path + '/Desktop'

with open(chromium_config_file_path, 'r') as chromium_config_file:
    data = json.load(chromium_config_file)

data['download']['default_directory'] = download_path
data['savefile']['default_directory'] = download_path

with open(chromium_config_file_path, 'w') as chromium_config_file:
    json.dump(data, chromium_config_file)
