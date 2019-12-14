help:
	@echo 'Usage:                                                                    '
	@echo '   make github                         upload the web site via gh-pages   '


regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
	npm run serve

build:
	npm run build

commit:
	cd dist
	git init
	git add -A
	git commit -m 'Deploy'

github: build
	git push -f https://github.com/azzamsa/quiz.git master:gh-pages
	cd -


.PHONY: html help clean regenerate serve serve-global devserver stopserver publish github
