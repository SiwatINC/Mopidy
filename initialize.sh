echo Siwat INC Mopidy+SnapCast Container Initializing
echo "Starting Container Initialization Script."
if [ -z "$(ls -A /config)" ]; then
   echo "FIRSTRUN Initializing . . ."
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/nginx.conf" > /config/nginx/nginx.conf
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/fastcgi_params" > /config/nginx/fastcgi_params
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/mime.types" > /config/nginx/mime.types
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/default" > /config/nginx/site-confs/default
   curl "https://raw.githubusercontent.com/SiwatINC/nginx-pagespeed/master/index.php" > /config/www/index.php
   exit 0
else
   echo "Already Initiated, Starting Mopidy and SnapServer Daemon"
   mopidy -v --config /config/mopidy.conf & snapserver --config /config/snapcast.conf
   exit 0
fi
