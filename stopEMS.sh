#!/bin/bash
sudo kill `ps -ef|grep main|grep python3|awk '{printf "%d",$2}'`
