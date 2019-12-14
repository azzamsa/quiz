# buid
npm run build

# commit
cd dist
git init
git add -A
git commit -m 'Deploy'

# push
git push -f https://github.com/azzamsa/quiz.git master:gh-pages
cd -

