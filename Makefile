include .env
export

dc := docker compose
an := $(APP_NAME)

create: 
	make create-env && make create-up && make create-down && make clean && make up
create-env:
	echo "APP_NAME=$(app)\nDOCKER_IMAGE=node:21.6.2-slim" > .env
create-up: 
	$(dc) -f create.yml up
create-down:
	$(dc) -f create.yml down && docker rmi $(DOCKER_IMAGE)
clean:
	cp -r $(an)/. . && rm -rf $(an)
up: 
	$(dc) up
upd:
	$(dc) up -d
down:
	$(dc) down && docker rmi $(an)-$(an)
start: 
	docker start $(an)
stop:
	docker stop $(an)
teste:
	echo "teste 1 = $(an)"
teste2:
	echo "teste 2 = $(app)"
delete:
	rm -rf ../notes-ai/*