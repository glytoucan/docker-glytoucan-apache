build:
	sudo docker.io build -t aoki/glytoucan-apache .

run:
	sudo docker.io run -d -h local.glytoucan-apache --link docker-virtuoso_bluetree:test.ts.glytoucan.org --name="glytoucan-apache" aoki/glytoucan-apache

bash:
	sudo docker.io run -d -h local.glytoucan-apache --link docker-virtuoso_bluetree:test.ts.glytoucan.org --name="glytoucan-apache" aoki/glytoucan-apache /bin/bash

ps:
	sudo docker.io ps

stop:
	sudo docker.io stop glytoucan-apache

rm:
	sudo docker.io rm glytoucan-apache

logs:
	sudo docker.io logs glytoucan-apache

ip:
	sudo docker.io inspect -f "{{ .NetworkSettings.IPAddress }}" glytoucan-apache

restart:
	sudo docker.io restart glytoucan-apache

inspect:
	sudo docker.io inspect aoki/glytoucan-apache

rerun: stop rm rund

clean: build stop rm rund

# not tested
dump:
	sudo docker.io export glytoucan-apache > glytoucan-apache.glycoinfo.tar

# not tested
load:
	cat glytoucan-apache.glycoinfo.tar | docker import - aoki/docker-glytoucan-apache:glytoucan-apache
	
.PHONY: build run test clean
