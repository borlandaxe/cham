#!/bin/bash

rsync -ur --exclude '.git/**' ~/develop/cham/ ~/develop/github/cham && \
	cd ~/develop/github/cham && \
	git add * && git commit -a -m "mod" && git push

alias hp="http_proxy=http://127.0.0.1:8123"
alias hsp="https_proxy=http://127.0.0.1:8123"

sync_flags="-u"
dirs="repos cham"

for dir in $dirs
do
	hp rclone sync $sync_flags --exclude '.git/**' ~/develop/$dir/ gdrive:/$dir
done

:<<C
C
