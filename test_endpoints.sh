#!/bin/bash

# use this when flask is already running
printf "IMPORTANT: as written right now, this will nuke existing SQL database in the process of testing it. change this before it goes into production.\n\n"

url=$1

printf "\n ~~ creating flask db ~~ \n"
flask init-db
printf "\n ~~ curling login POST (should be error, no users yet) ~~ \n"
curl -X POST -d "username=JonSmith&password=pw123" "${url}/mlh/login"
printf "\n ~~ curling register POST (should be successful) ~~ \n"
curl -X POST -d "username=JonSmith&password=pw123" "${url}/mlh/register"
printf "\n ~~ curling login POST (should now be successful) ~~ \n"
curl -X POST -d "username=JonSmith&password=pw123" "${url}/mlh/login"
