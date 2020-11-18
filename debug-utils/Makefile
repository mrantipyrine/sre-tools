BUILD_ARGS				?=
DOCKER_BUILDKIT ?= 1
IMAGE					?= debug-utils:latest
REPO					?= 

.PHONY: build
build:
		@docker build -t ${IMAGE} ${BUILD_ARGS} .

.PHONY: lint
lint:
		@docker run --rm -i hadolint/hadolint < Dockerfile

.PHONY: dive
dive:
		@docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e CI=true \
				wagoodman/dive:latest ${IMAGE}

.PHONY: push
push:
		@docker tag ${IMAGE} ${REPO}/${IMAGE}
		@docker push ${REPO}/${IMAGE}
