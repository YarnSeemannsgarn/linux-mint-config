#!/bin/bash

cd
file_name=master-pdf-editor-${MASTER_PDF_EDITOR_VERSION}_qt5.amd64.deb
wget https://code-industry.net/public/${file_name}
sudo dpkg -i ${file_name}
rm ${file_name}
