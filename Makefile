BIN = ./node_modules/.bin

release-patch:
	@$(call release,patch)

release-minor:
	@$(call release,minor)

release-major:
	@$(call release,major)

build:
	@$(BIN)/cjsx -cb -o dist src/index.cjsx
	@$(BIN)/browserify -t babelify examples/index.js -o examples/bundle.js

publish:
	git push --tags origin HEAD:master
	npm publish

publish-gh-pages:
	git checkout gh-pages
	git merge master
	@$(BIN)/cjsx -cb -o dist src/index.cjsx
	@$(BIN)/browserify -t babelify examples/index.js -o examples/bundle.js
	cp examples/* .
	git add .
	git commit -m "Update website"
	git push
	git checkout master

define release
	@$(BIN)/cjsx -cb -o dist src/index.cjsx
	npm version $(1)
endef
