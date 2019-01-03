NAME = phpda

default: clean image vendor-on-host

clean:
	-docker rm -fv $(NAME)-php72
	-docker rmi -f $(NAME)-php72
	-rm -rf ./vendor

image:
	docker build -t $(NAME)-php72 -f ./build/Dockerfile-php72 .

vendor-on-host:
	docker create --name $(NAME)-php72 $(NAME)-php72
	docker cp $(NAME)-php71:/app/vendor ./
	docker rm -fv $(NAME)-php72

test:
	docker run --rm -it -v $(shell pwd):/app $(NAME)-php72 composer test

release:
	docker run --rm -it -v $(shell pwd):/app $(NAME)-php72 composer phar
