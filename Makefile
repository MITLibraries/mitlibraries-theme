.PHONY: help fetch update cleanup dist publish
SHELL=/bin/bash
GEMSPEC=$(shell ls *.gemspec | head -1)
VERSION=$(shell ruby -e 'puts Gem::Specification::load("$(GEMSPEC)").version')
PROJECT=$(shell ruby -e 'puts Gem::Specification.load("$(GEMSPEC)").name')
GEM=$(PROJECT)-$(VERSION).gem

help: ## Print this message
	@awk 'BEGIN { FS = ":.*##"; print "Usage:  make <target>\n\nTargets:" } \
		/^[-_[:alpha:]]+:.?*##/ { printf "  %-15s%s\n", $$1, $$2 }' $(MAKEFILE_LIST)

fetch: clean ## Grab latest from theme repo (auto runs clean first)
	mkdir -p tmp
	curl -o tmp/assets.zip https://codeload.github.com/MITLibraries/mitlib-style/zip/master
	unzip -o -d tmp tmp/assets.zip

update: fetch ## Synchronize latest (auto runs clean and fetch first)
	# cleanup targets first in case assets were removed
	rm -rf vendor/assets/images/
	rm -rf vendor/assets/stylesheets/

	mkdir vendor/assets/images/
	mkdir vendor/assets/stylesheets/

	cp -R tmp/mitlib-style-master/_assets/i/* vendor/assets/images
	cp -R tmp/mitlib-style-master/_assets/sass/* vendor/assets/stylesheets

	rm -rf vendor/assets/stylesheets/apps/
	rm -f vendor/assets/stylesheets/ebooks-main.scss
	rm -f vendor/assets/stylesheets/guide-helper.scss
	rm -f vendor/assets/stylesheets/quicksubmit.sass

	# We need to double $ so make doesn't think it's a variable and escape the $ for bash. Hence \$$.
	sed -i '' "s+url('#{\$$image-path}/vi-shape7-tp.svg')+image-url('vi-shape7-tp.svg')+g" vendor/assets/stylesheets/elements/*.scss

	@tput setaf 2
	@tput bold
	@echo "Assets updated. Make sure to update version in:"
	@echo "  lib/mitlibraries/theme/version.rb"
	@echo "before building with 'make dist'"
	@tput sgr0

clean: ## Delete downloaded zip and extracted files
	rm -f tmp/assets.zip
	rm -rf tmp/mitlib-style-master

dist: ## Build the gem from the current gemspec
	gem build mitlibraries-theme.gemspec
	@tput setaf 2
	@tput bold
	@echo "Finished building gem. To test locally add to your project Gemfile:"
	@echo "  gem 'mitlibraries-theme', path: '$(shell pwd)'"
	@tput sgr0

publish: ## Publish the gem version defined in the gemspec
	gem push "$(GEM)"
