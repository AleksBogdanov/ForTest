install:
	#install commands
	pip install --upgrade pip &&\
		pip install -r requirements.txt

build:
	#build container
	docker build -t deploy-fastapi .
run:
	docker run -p 8080:8080 abd80e77acfa
deploy:
	#deploy
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 969238612305.dkr.ecr.us-east-1.amazonaws.com
	docker build -t wiki .
	docker tag wiki:latest 969238612305.dkr.ecr.us-east-1.amazonaws.com/wiki:latest
	docker push 969238612305.dkr.ecr.us-east-1.amazonaws.com/wiki:latest

all: install deploy

git:
	git add *
	git commit -m $m
	git push