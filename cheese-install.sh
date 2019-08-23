#!/bin/bash

# Basic cheese
cd ~
git clone https://github.com/nyangnyangpunch/cheese.git
cd cheese

npm install
nohup node app.js &

echo 'Done!'
