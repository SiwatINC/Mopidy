FROM siwatinc/python3baseimage
RUN apt-get update
RUN apt install -y python3-gst-1.0 gir1.2-gstreamer-1.0 gir1.2-gst-plugins-base-1.0 gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-tools && apt-get clean
RUN python3 -m pip install --upgrade mopidy
CMD python3 -m pip install --upgrade mopidy || : && python 3 -m pip install --upgrade $plugins
CMD mopidy -v
