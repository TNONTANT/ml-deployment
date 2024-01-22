export BASE_IMAGE ?= us-central1-docker.pkg.dev/axon-aiml-sertis/pipeline-demo/fastapi-prophet:latest

.PHONY: build-base
build-base:
	docker build -t $(BASE_IMAGE) .
	
.PHONY: build-push-base
build-push-base:
	make build-base
	docker push $(BASE_IMAGE)
	docker rmi -f $(BASE_IMAGE)

.PHONY: pull-image
pull-image:
	docker pull $(BASE_IMAGE)

.PHONY: docker-run-app
docker-run-app:
	docker run --name fastapi-ml -e PORT=8008 -p 8008:8008 -d $(BASE_IMAGE)

.PHONY: buildx
buildx:
	docker buildx create --use
	docker buildx build --platform linux/amd64 -t fastapi-prophet:latest . --load
# $ docker build -t fastapi-prophet .