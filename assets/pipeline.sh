#!/usr/bin/env bash

echo Running pipeline script:

# Build the application
npm install
npm run build

# If the build was unsuccessful, halt
if [ $? == 0 ] 
then
	echo Application built successfully using NPM
else
	echo Application build unsuccessful
	exit 2
fi

# Perform some test:

# Return to main directory
cd ../

# Run git commands (add to repo, commit, push)
# Commit using supplied commit message ($1)
git add .
read -p "Provide commit message: " message
git commit -m "$message"
git push origin master

# Check status of git repo
git status
