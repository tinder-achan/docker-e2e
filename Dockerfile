FROM circleci/node:6-browsers

# make sure apt is up to date
RUN sudo apt-get update

# ffmpeg is not available by default on Ubuntu 14.04
RUN sudo sh -c 'echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list'
RUN sudo apt update
RUN sudo apt install -y ffmpeg

# Make sure Chrome is up to date (and we need only one package source)
RUN sudo google-chrome --version && \
  sudo bash -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
  sudo bash -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
  sudo apt-get update && \
  sudo apt-get install google-chrome-stable && \
  google-chrome --version
