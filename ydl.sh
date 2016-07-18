#!/usr/bin/env bash

# install dependencies (manual)
install_ydl() {
  brew update
  brew install youtube-dl ffmpeg libav
}

# check if parameter is given
if [ ! $@ ]; then
  echo "Usage: ydl.sh youtube-url"
  exit 1;
fi

# download to current folder and convert to mp3
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --ignore-errors $@

# check if on osx
if [ `uname` == "Darwin" ] ; then
  # desctop notification
  osascript -e 'display notification "All Downloads finished." with title "Youtube Downloader"'

  # open current download folder
  # open .
fi
