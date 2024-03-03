dc := docker compose
de := docker exec -it nodejs
fws := frameworks
base_dir := $$(basename $$(pwd))

up:
	$(dc) up

upd:
	$(dc) up -d

down:
	$(dc) down

remove:
	make down && docker rmi $(base_dir)-nodejs && rm install.sh

create:
	make set-env && \
	make upd && \
	make cp-script && \
	$(de) sh install.sh && \
	make cp-compose && \
	make create-app-env && \
	$(dc) -f $(app)/docker-compose.yml up
	make remove

set-env:
	echo "APP_NAME=$(app)\nDOCKER_IMAGE=node:lts" > .env

cp-script:
	cp $(fws)/$(framework)/install.sh .

cp-compose:
	cp $(fws)/$(framework)/docker-compose.yml $(app)

create-app-env:
	cp .env $(app)

exec:
	$(de) /bin/bash
