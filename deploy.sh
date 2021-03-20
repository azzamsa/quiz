#!/usr/bin/env bash

# buid
yarn run build

# commit
cd dist
git init
git add -A
git commit -m 'Deploy'

# push
git push -f git@github.com:azzamsa/quiz-vue.git master:gh-pages
cd -

