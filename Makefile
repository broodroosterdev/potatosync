.PHONY: build
build:
	mkdir bin || echo bin already exists
	@echo building artifacts
	@GO111MODULE=on GOOS=linux CGO_ENABLED=0 go build -v -a -installsuffix cgo -o ./bin/potatosync . && echo DONE

.PHONY: dep
dep:
	go mod vendor
	go mod verify

.PHONY: img-build
img-build:
	docker image build -t atechnohazard/potatosync .

img-push:
	docker push atechnohazard/potatosync:latest

.PHONY: docs
docs:
	apidoc -i controllers -o docs