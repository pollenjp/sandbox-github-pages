ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
PAGES_PATH := docs
REPO_DIRPATH_CONTAINER := /srv/jekyll/repo
JEKYLL_DOCKER_IMAGE := "jekyll/jekyll"

.PHONY: build
build:
	docker build \
		--tag ${JEKYLL_DOCKER_IMAGE} \
		--file docker/jekyll/Dockerfile \
		.


.PHONY: run
run:
	docker run \
		--rm \
		--volume "${ROOT}:${REPO_DIRPATH_CONTAINER}" \
		--interactive \
		--tty \
		--publish 4000:4000 \
		${JEKYLL_DOCKER_IMAGE} \
		bash -c '\
			cd ${REPO_DIRPATH_CONTAINER} && \
			bundle install && \
			bundle exec jekyll serve \
				--force_polling \
				--host $$(hostname -i) \
				--trace \
				--config ${REPO_DIRPATH_CONTAINER}/${PAGES_PATH}/_config.yml \
				--source ${REPO_DIRPATH_CONTAINER}/${PAGES_PATH} \
				--layouts ${REPO_DIRPATH_CONTAINER}/${PAGES_PATH}/_layouts \
				--destination ${REPO_DIRPATH_CONTAINER}/${PAGES_PATH}/_site \
		'

.PHONY: help
help:
	docker run --rm -it ${JEKYLL_DOCKER_IMAGE} jekyll build --help
