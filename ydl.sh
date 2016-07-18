#!/usr/bin/env bash
#
#   /$$$$$$$$                                                /$$$$$$   /$$
#  | $$_____/                                               /$$__  $$ | $$
#  | $$     /$$$$$$  /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$ | $$  \__//$$$$$$
#  | $$$$$ /$$__  $$|____  $$ /$$__  $$ /$$_____/ /$$__  $$| $$$$   |_  $$_/
#  | $$__/| $$  \__/ /$$$$$$$| $$  \ $$|  $$$$$$ | $$  \ $$| $$_/     | $$
#  | $$   | $$      /$$__  $$| $$  | $$ \____  $$| $$  | $$| $$       | $$ /$$
#  | $$   | $$     |  $$$$$$$| $$$$$$$/ /$$$$$$$/|  $$$$$$/| $$       |  $$$$/
#  |__/   |__/      \_______/| $$____/ |_______/  \______/ |__/        \___/
#                            | $$
#                            | $$
#                            |__/
#
#   Developer     Maik Ellerbrock
#   GitHub        https://github.com/ellerbrock
#
#   Company       Frapsoft Web Agency
#
#   Twitter       https://twitter.com/frapsoft
#   Facebook      https://facebook.com/frapsoft
#   Homepage      https://frapsoft.com
#
#   Version       1.0.1
#

#!/usr/bin/env bash

# install dependencies function
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
  osascript -e 'display notification "All Downloads done." with title "Youtube Downloader"'

  # open folder with downloads
  open .
fi

exit 0
