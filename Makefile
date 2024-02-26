include .env
export

dc := docker compose
pn := $(PROJECT_NAME)

create: 
	make create-env && make create-up && make create-down && make clean && make up
create-env:
	echo "PROJECT_NAME=notes-ai\nDOCKER_IMAGE=node:21.6.2-slim" > .env
create-up: 
	$(dc) -f create.yml up
create-down:
	$(dc) -f create.yml down && docker rmi $(DOCKER_IMAGE)
clean:
	cp -r $(pn)/. . && rm -rf $(pn)
up: 
	$(dc) up
upd:
	$(dc) up -d
down:
	$(dc) down && docker rmi $(pn)-$(pn)
start: 
	docker start $(pn)
stop:
	docker stop $(pn)
teste:
	echo "$(pn)"
delete:
	rm -rf ../notes-ai/*