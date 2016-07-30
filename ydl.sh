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
#   Twitter       https://twitter.com/frapsoft
#   Facebook      https://facebook.com/frapsoft
#
#   Version       1.1.0
#
#   Dependencies: brew install youtube-dl ffmpeg libav
#

# CONFIGURATION
BASEDIR="/Volumes/Media/Music"
MP3DIR="$BASEDIR/youtube/"
LOGFILE="$BASEDIR/youtube.log"
DATE=`date +%Y-%m-%d`

if [ ! "$1" ]; then
  echo "usage: ydl.sh youtube-url"
  exit 1
fi

cd $MP3DIR
echo -e "$DATE \t $1" >> $LOGFILE
youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --ignore-errors $@

if [ `uname` == "Darwin" ] ; then
  osascript -e 'display notification "All Downloads done." with title "Youtube Downloader"'
  open .
fi
