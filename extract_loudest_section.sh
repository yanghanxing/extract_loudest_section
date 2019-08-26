#!/bin/sh

desired_length=$1
input_dir=$2
output_dir=$3

usage(){
	echo "**You must supply desired length ms and paths to input dir and**"
	echo "**     output dir(where to save wav files) as arguments       **"
	echo "**     ./extract_loudest_section.sh 2000(ms) in_dir out_dir   **"
}

if [ ! -n "$1" ] ;then
	usage
fi

echo "**Cut audio file $desired_length(ms) from $input_dir dir to $output_dir dir**"

for i in $input_dir/*
do
	./tools/x86/extract_loudest_section $desired_length $i $output_dir
done

echo "**All save to the $output_dir dir**"
