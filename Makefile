.PHONY: build

build:
	@printf "\nStarting \033[1mDevelopment\033[0m Build...\n"
	nim c src/main.nim
	@printf "\n\033[1;32mDone.\033[0m\n\n"
