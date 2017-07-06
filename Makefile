# Build Container
build:
	docker build -t aoki/jenkins .
.PHONY: build

# Run Container
run:
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/jenkins:/var/jenkins_home -p 8080:8080 -p 50000:50000 --name jenkins -d -u root aoki/jenkins
.PHONY: run

# Login container
login:
	docker exec -it jenkins /bin/bash
.PHONY: login

# Display log
log:
	docker log -f jenkins
.PHONY: log