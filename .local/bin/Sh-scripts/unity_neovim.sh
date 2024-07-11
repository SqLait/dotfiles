#!/bin/bash

if [ $# -eq 2 ]; then
  kitty -- nvim +"$2" "$1"
else
  kitty -- nvim "$1"
fi

