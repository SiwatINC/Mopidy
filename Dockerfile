FROM siwatinc/python3baseimage
RUN apt-get update
RUN apt install -y python3-gst-1.0 gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools dbus && apt-get clean
CMD pip install --upgrade mopidy || : && pip install --upgrade $plugins || : && mopidy -v
© 2020 GitHub, Inc.
