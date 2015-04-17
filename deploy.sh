#!/bin/bash

# Stop executing when any errors occur, or when any environment variables that have not been defined are encountered
set -o errexit -o nounset

cd target/4.5/

git init
git config user.name "${GIT_USER}"
git config user.email "${GIT_EMAIL}"

git remote add upstream "https://${GH_TOKEN}@github.com/${GH_USER}/${GH_REPO}.git"
git fetch upstream
git reset upstream/gh-pages

# Add any files needed manually
echo "bitub.de" > CNAME
touch .

# Commit and push
git add -A .
COMMIT_ID=$( git rev-parse --short HEAD )
TIME_STAMP=$( date +%Y-%m-%d:%H:%M:%S )
COMMIT_MESSAGE="p2 update site CI publish ${TIME_STAMP} ${COMMIT_ID}"
  
echo "${COMMIT_MESSAGE}"

git commit -m "${COMMIT_MESSAGE}"
git push -q upstream HEAD:gh-pages