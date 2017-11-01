IMAGE_NAME := waja/sslyze

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l

test: build
	@if ! [ "$$(docker run --rm -it waja/sslyze -h | head -1 | cut -d' ' -f2)" = "sslyze" ]; then exit 1; fi
