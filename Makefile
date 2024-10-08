.PHONY: build run

build:
	docker build -t chatbot-ui-codespace -f src/Dockerfile src/.

build-fresh:
	docker build --no-cache -t chatbot-ui-codespace -f src/Dockerfile src/.

run:
	docker run --rm -it -p 3000:3000 chatbot-ui-codespace