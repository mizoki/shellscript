#!/bin/sh

for app in `brew list`; do
  result=`brew uses $app --installed`
  if [ -z "$result" ]; then
    echo $app
  fi
done
