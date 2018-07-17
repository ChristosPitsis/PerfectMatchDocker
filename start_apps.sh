#!/bin/bash

# Start the Java app
cd ~/PerfectMatch/
nohup java -jar target/PerfectMatch.jar &
rm nohup.out

# Start NodeJS service
cd ~/PerfectMatchHelper/
nohup nodejs server.js &
rm nohup.out
