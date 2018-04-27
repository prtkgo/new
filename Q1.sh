#!/bin/bash

z=`find $1 -type f -name "*.c"`
cat $z | awk -f check.awk 
