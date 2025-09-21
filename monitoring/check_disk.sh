#!/bin/bash 

#Description: Check disk space utilization

df -h | grep -v tmpfs 
