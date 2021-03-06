# youtube2mp3 [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

Simple Shell Script to download Youtube Videos and convert them on the fly to mp3 files.

## Install Dependencies

**via Homebrew**

`brew install youtube-dl ffmpeg libav`

or

**from Source**

-   [youtube-dl](https://github.com/rg3/youtube-dl)
-   [ffmpeg](https://github.com/FFmpeg/FFmpeg)
-   [libav](https://github.com/libav/libav)

With the dependencies installed your ready to go.

Download the Script [ydl.sh](https://raw.githubusercontent.com/ellerbrock/youtube2mp3/master/ydl.sh) and make it executable `chmod u+x ydl.sh`

> Run the Script via: `./ydl.sh url`<br>
> url can be a youtube link, playlist, channel ...

By default the mp3 files are stored in the same folder where the script was executed.

You can create an alias to run the script from everywhere: `alias ydl="/src/to/file/ydl.sh"`

Thats it happy downloading!

![unicorn love](http://i.giphy.com/l0LIYv9tJFIVHxF5u.gif)

### Source

```bash
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
```

### Contact / Social Media

*Get the latest News about Web Development, Open Source, Tooling, Server & Security*

[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)
[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)
[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)
[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)

### Development by 

Developer / Author: [Maik Ellerbrock](https://github.com/ellerbrock/)  
Company: [Frapsoft](https://github.com/frapsoft/)


### License 

Copyright (c) 2016 [Maik Ellerbrock](https://github.com/ellerbrock/)  

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit-125x28.png?v=102)](https://opensource.org/licenses/mit-license.php)  

