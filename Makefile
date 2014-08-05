BIN = ./node_modules/.bin

release-patch:
	@$(call release,patch)

release-minor:
	@$(call release,minor)

release-major:
	@$(call release,major)

build:
	@$(BIN)/cjsx -cb -o dist src/index.cjsx
	@$(BIN)/browserify examples/index.js -o examples/bundle.js

publish:
	git push --tags origin HEAD:master
	npm publish

define release
	@$(BIN)/cjsx -cb -o dist src/index.cjsx
	npm version $(1)
endef
