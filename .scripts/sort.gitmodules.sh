#!/usr/bin/env bash

awk 'BEGIN { I=0 ; J=0 ; K="" } ; /^\[submodule/{ N+=1 ; J=1 ; K=$2 ; gsub(/("vendor\/|["\]])/, "", K) } ; { print K, N, J, $0 } ; { J+=1 }' .gitmodules |
  sort |
  awk '{ $1="" ; $2="" ; $3="" ; print }' |
  sed 's/^ *//g' |
  awk '/^\[/{ print ; next } { print "\t" $0 }' >.gitmodules.tmp
mv .gitmodules.tmp .gitmodules
