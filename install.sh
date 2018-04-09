#!/bin/bash

THISPATH=$(cd ${0%/*} && echo $PWD/${0##*/})
THISHOME=`dirname $THISPATH`

echo "Install binaries:"
if [ ! -d ~/bin ]; then
  mkdir ~/bin
fi
cp $THISHOME/bin/* ~/bin/

echo "Install dotfiles:"
for i in `find $THISHOME/dotfiles/`; do
  if [ -f $i ]; then
    fname=`basename $i`
    if [ -e ~/$fname ]; then
      # diff ~/$fname $i | less
      mv ~/$fname ~/$fname.bk
    fi
    echo "Copying" $fname
    cp $i ~
  fi
done

echo "DONE!"
