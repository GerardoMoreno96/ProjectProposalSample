#!/bin/bash
#get repositories list starting from page N
curl https://api.github.com/repositories?since=364 > getRepos.txt

#execute python filtering process
python cleanReposList.py > cleanList.txt

#delete empty lines from previous file and remove previous file
awk '!/^$/' cleanList.txt  > fullNames.txt 
rm cleanList.txt

#get languages
while read full_name; do
  curl https://api.github.com/repos/$full_name/languages >> languages.txt
done <fullNames.txt
