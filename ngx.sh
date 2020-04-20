#!/bin/bash
yum update -y
yum install nginx stress -y
service nginx start
chkconfig nginx on
sed -i "85iline <img src="http://assets1.ignimgs.com/2015/04/24/dragbrunnamedjpg-e9dea5_1280w.jpg">"  /usr/share/nginx/html/index.html
