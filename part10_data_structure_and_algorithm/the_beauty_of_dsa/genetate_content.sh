#!/bin/bash

num=1
while read line
do
  #echo $line
  #echo $num
  # echo "# $line" > article${num}.md
  echo "- part10_data_structure_and_algorithm/the_beauty_of_dsa/chapter/article${num}.md"
  num=$(($num +1))
done < ./content_copy.md

