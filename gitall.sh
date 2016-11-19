#!/bin/bash
if [ $# -eq 0 ]
then
	echo "Usage: gitall <command>"
	exit 1
fi

for i in *
do
	if [ -d $i/.git ] ; then
		pushd $i > /dev/null
		echo "Executing \"$@\" on $i"
		echo $@
		`echo $@`
		popd > /dev/null
	fi
done