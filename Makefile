help:
	@cat Makefile

#DOCKER_FILE=Dockerfile

all: build push_ubitus

build:
	docker build -t horovod .

push_ubitus:
	docker tag horovod tpo-docker.ubitus.net/horovod:latest
	docker push tpo-docker.ubitus.net/horovod:latest