#!/bin/bash

# Upload file to 0x0
fup() {
    curl -F"file=@$1" http://0x0.st;
}

calc(){
  julia -E "$1"
}

# get common examples
cheat(){
    curl cheat.sh/$1;
}

# forecast
weather () {
    curl https://wttr.in/"$1";
}

# Quickly copy file to clipboard
ficlip (){
    cat $1 | xclip -selection clipboard
}

# Run mpv without the terminal being needed
mm (){
    mpv "$1" &
    disown
}

ms (){
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch:"$@" &
    disown
}

notes() {
  FILE="/home/francis/Documents/Notes/notebook.md"
  CMD=':silent read !date "+\%n**\%Y-\%m-\%d**\%n**\%H:\%M**\%n"'

  vim -c '$' -c "execute '$CMD' | $ | execute 'norm $' | " -c ":Goyo" "$FILE"
}

note() {
  FILE="/home/francis/Documents/Notes/$1.md"
  CMD=':silent read !date "+\%n**\%H:\%M** "'

  vim -c '$' -c ":Goyo" "$FILE"
}

tohoek(){
  scp -r "$@" music@10.0.0.5:Music
}

msgkelder(){
  curl -X POST \
  https://kelder.zeus.ugent.be/messages/ \
  -H 'Content-Type: text/plain' \
  -H 'Host: kelder.zeus.ugent.be' \
  -H 'X-Username: fbegyn' \
  -d $1
}

wifirssi(){
  iw dev $1 scan | egrep "SSID|signal" | awk -F ":" '{print $2}' | sed 'N;s/\n/:/' | sort
}

ips ()
{
    if command -v ifconfig &>/dev/null
    then
        ifconfig | awk '/inet /{ gsub(/addr:/, ""); print $2 }'
    elif command -v ip &>/dev/null
    then
        ip addr | grep -oP 'inet \K[\d.]+'
    else
        echo "You don't have ifconfig or ip command installed!"
    fi
}

down4me ()
{
    curl -Ls "http://downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g'
}

myip ()
{
    list=("http://myip.dnsomatic.com/" "http://checkip.dyndns.com/" "http://checkip.dyndns.org/")
    for url in ${list[*]}
    do
        res=$(curl -s "${url}")
        if [ $? -eq 0 ];then
            break;
        fi
    done
    res=$(echo "$res" | grep -Eo '[0-9\.]+')
    echo -e "Your public IP is: ${echo_bold_green} $res ${echo_normal}"
}

mkcd ()
{
    mkdir -p -- "$@" && eval cd -- "\"\$$#\""
}

lsgrep ()
{
    ls | grep "$*"
}

usage ()
{
    if [ $(uname) = "Darwin" ]; then
        if [ -n "$1" ]; then
            du -hd 1 "$1"
        else
            du -hd 1
        fi

    elif [ $(uname) = "Linux" ]; then
        if [ -n "$1" ]; then
            du -h --max-depth=1 "$1"
        else
            du -h --max-depth=1
        fi
    fi
}

mkiso ()
{
    if type "mkisofs" > /dev/null; then
        [ -z ${1+x} ] && local isoname=${PWD##*/} || local isoname=$1
        [ -z ${2+x} ] && local destpath=../ || local destpath=$2
        [ -z ${3+x} ] && local srcpath=${PWD} || local srcpath=$3

        if [ ! -f "${destpath}${isoname}.iso" ]; then
            echo "writing ${isoname}.iso to ${destpath} from ${srcpath}"
            mkisofs -V ${isoname} -iso-level 3 -r -o "${destpath}${isoname}.iso" "${srcpath}"
        else
            echo "${destpath}${isoname}.iso already exists"
        fi
    else
        echo "mkisofs cmd does not exist, please install cdrtools"
    fi
}

# useful for administrators and configs
buf ()
{
    local filename=$1
    local filetime=$(date +%Y%m%d_%H%M%S)
    cp -a "${filename}" "${filename}_${filetime}"
}

del() {
    mkdir -p /tmp/.trash && mv "$@" /tmp/.trash;
}

# get a quick overview for your git repo
git_info() {
  if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
    # print informations
    echo "git repo overview"
    echo "-----------------"
    echo

    # print all remotes and thier details
    for remote in $(git remote show); do
        echo $remote:
        git remote show $remote
        echo
    done

    # print status of working repo
    echo "status:"
    if [ -n "$(git status -s 2> /dev/null)" ]; then
        git status -s
    else
        echo "working directory is clean"
    fi

    # print at least 5 last log entries
    echo
    echo "log:"
    git log -5 --oneline
    echo
  else
		echo "you're currently not in a git repository"
	fi
}

countdown(){
	date1=$((`date +%s` + $1));
	while [ "$date1" -ge `date +%s`  ]; do
		echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
		sleep 0.1
	done
}
stopwatch(){
	date1=`date +%s`;
	while true; do
		echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
		sleep 0.1
	done
}


# remove specified host from ~/Scripts/Files/hostfiles/custom
function removehost() {
    if [[ "$1" ]]
    then
        HOSTNAME=$1

        if [ -n "$(grep $HOSTNAME ~/Scripts/Files/hostfiles/custom)" ]
        then
            echo "$HOSTNAME Found in your ~/Scripts/Files/hostfiles/custom, Removing now...";
            sed -i".bak" "/$HOSTNAME/d" ~/Scripts/Files/hostfiles/custom
        else
            echo "$HOSTNAME was not found in your ~/Scripts/Files/hostfiles/custom";
        fi
    else
        echo "Error: missing required parameters."
        echo "Usage: "
        echo "  removehost domain"
    fi
}

#add new ip host pair to ~/Scripts/Files/hostfiles/custom
function addhost() {
    if [[ "$1" && "$2" ]]
    then
        IP=$1
        HOSTNAME=$2

        if [ -n "$(grep $HOSTNAME ~/Scripts/Files/hostfiles/custom)" ]
            then
                echo "$HOSTNAME already exists:";
                echo $(grep $HOSTNAME ~/Scripts/Files/hostfiles/custom);
            else
                echo "Adding $HOSTNAME to your ~/Scripts/Files/hostfiles/custom";
                printf "%s\t%s\n" "$IP" "$HOSTNAME" | tee -a ~/Scripts/Files/hostfiles/custom > /dev/null;

                if [ -n "$(grep $HOSTNAME ~/Scripts/Files/hostfiles/custom)" ]
                    then
                        echo "$HOSTNAME was added succesfully:";
                        echo $(grep $HOSTNAME ~/Scripts/Files/hostfiles/custom);
                    else
                        echo "Failed to Add $HOSTNAME, Try again!";
                fi
        fi
    else
        echo "Error: missing required parameters."
        echo "Usage: "
        echo "  addhost ip domain"
    fi
}
