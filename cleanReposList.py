#!/usr/bin/python
import sys

file_to_read = open("[working_directory]/getRepos.txt",'r')
for i in file_to_read:
    if i.lstrip().startswith("\"full_name"):
        print(i.lstrip()[14:-3])
