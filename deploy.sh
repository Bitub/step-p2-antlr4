#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd target

git init
git config user.name "Sebastian Riemschüssel"
git config user.email "s.riemschuessel@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/Bitub/step-p2-antlr4.git"
git fetch upstream
git reset upstream/gh-pages

echo "bitub.de" > CNAME

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages