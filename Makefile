.PHONY: run stop build

run:
	docker-compose up -d

stop:
	docker-compose down

build:
	docker-compose build