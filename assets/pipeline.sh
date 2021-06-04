#!/usr/bin/env bash

echo Running pipeline script:

# Run python script to check name and id present
python3 StaticVerification.py
if [ $? = 1 ]; then
	echo 'Config not present!'
	exit -1
fi

echo 'Config check success! Static test passed'

# Build the application
npm install
npm run build

# If the build was unsuccessful, halt
if [ $? == 0 ]; then
	echo Application built successfully using NPM
else
	echo Application build unsuccessful
	exit -1
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
