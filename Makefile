build: build-cedar-14 build-heroku-16 build-heroku-18

build-cedar-14:
	@echo "Building nginx in Docker for cedar-14..."
	@docker pull heroku/cedar:14
	@docker run -v $(shell pwd):/buildpack --rm -it -w /buildpack heroku/cedar:14 bin/build /buildpack/bin/nginx-cedar-14

build-heroku-16:
	@echo "Building nginx in Docker for heroku-16..."
	@docker pull heroku/heroku:16
	@docker run -v $(shell pwd):/buildpack --rm -it -w /buildpack heroku/heroku:16-build bin/build /buildpack/bin/nginx-heroku-16

build-heroku-18:
	@echo "Building nginx in Docker for heroku-18..."
	@docker pull heroku/heroku:18
	@docker run -v $(shell pwd):/buildpack --rm -it -w /buildpack heroku/heroku:18-build bin/build /buildpack/bin/nginx-heroku-18

shell:
	@echo "Opening heroku-18 shell..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-18" -e "PORT=5000" -w /buildpack heroku/heroku:18 bash
