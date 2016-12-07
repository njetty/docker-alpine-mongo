VERSION = 3.2.10-3
IMAGE = njetty/alpine-mongo:$(VERSION)

all:

image:
	docker build -t $(IMAGE) --no-cache .

publish:
	docker push $(IMAGE)
