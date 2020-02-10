FROM siwatinc/python3baseimage
RUN apt-get update
RUN apt install -y python3-gst-1.0 gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools dbus && apt-get clean
RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list
RUN apt update && apt-get -y install mopidy
RUN wget https://github.com/badaix/snapcast/releases/download/v0.18.1/snapclient_0.18.1-1_amd64.deb && wget https://github.com/badaix/snapcast/releases/download/v0.18.1/snapserver_0.18.1-1_amd64.deb && dpkg -i snapclient_0.18.1-1_amd64.deb || : && dpkg -i snapserver_0.18.1-1_amd64.deb || : && apt-get -yf install && dpkg -i snapclient_0.18.1-1_amd64.deb && dpkg -i snapserver_0.18.1-1_amd64.deb
RUN git clone https://github.com/aawsome/mopidy-snapcast.git && cd mopidy-snapcast && pip install .
CMD rm ./initialize.sh | : && wget https://raw.githubusercontent.com/SiwatINC/Mopidy/master/initialize.sh && chmod +x ./initialize.sh && ./initialize.sh
