run : build
	docker run --rm -d -p 80:1234 mak3r/star-history:local
	
build : 
	docker build -t mak3r/star-history:local .

test : build
	docker run -it --rm -p 80:1234 --entrypoint /bin/bash mak3r/star-history:local

TAG=latest
publish : build
	docker tag mak3r/star-history:local mak3r/star-history:$(TAG)
	docker push mak3r/star-history:$(TAG)