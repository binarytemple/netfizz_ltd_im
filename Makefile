.PHONY: deps bootstrap github docker-build

deps:
	bundle install --path vendor/bundle

bootstrap: deps
	bundle add jekyll || true

serve: bootstrap
	bundle exec jekyll serve

github:
	git add --all ; git commit -m 'change' ; git push

build-docker:
	docker build .
