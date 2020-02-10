echo Siwat INC Mopidy+SnapCast Container Initializing
echo "Starting Container Initialization Script."
if [ -z "$(ls -A /config)" ]; then
   echo "FIRSTRUN Initializing . . ."
   curl "https://raw.githubusercontent.com/SiwatINC/Mopidy/master/config/mopidy.conf" > /config/mopidy.conf
   curl "https://raw.githubusercontent.com/SiwatINC/Mopidy/master/config/snapcast.conf" > /config/snapcast.conf
   exit 0
else
   echo "Already Initiated, Starting Mopidy and SnapServer Daemon"
   apt-get install -y $apt-packages || :
   pip install $python-packages || :
   mopidy -v --config /config/mopidy.conf & snapserver --config /config/snapcast.conf
   exit 0
fi
