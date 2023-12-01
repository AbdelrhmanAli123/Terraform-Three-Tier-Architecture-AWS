#!/bin/bash

yum update -y
yum install -y httpd
systemctl enable --now httpd

echo "hello world" >> /var/www/html/index.html