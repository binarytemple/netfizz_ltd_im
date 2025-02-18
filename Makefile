.PHONY: deps bootstrap github docker-build

deps:
	bundle install --path vendor/bundle

serve: deps
	bundle exec jekyll serve

github:
	git add --all ; git commit -m 'change' ; git push

build-docker:
	docker build .
