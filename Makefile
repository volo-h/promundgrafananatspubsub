.PHONY: help
help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

# DOCKER TASKS
.PHONY: docker-up
docker-up:			## Runs the containers
	docker-compose -f docker-compose.yaml up --build

.PHONY: docker-down
docker-down:		## Stops and removes all containers
	docker-compose -f docker-compose.yaml down
	docker system prune --volumes --force

#.PHONY: generate-metrics
#generate-metrics:	## Generating metrics
#	@echo "--> start generate metrics"
#	./build/dev/script/ping.sh
#	@echo "--> end generate metrics"
