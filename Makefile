APP_NAME=perfect-todo-example

.PHONY: build
build:
	@swift build

.PHONY: build
build-release:
	@swift build --configuration release

.PHONY: run
run:build
	@./.build/debug/$(APP_NAME)

.PHONY: run-release
run-release:build-releae
	@./.build/release/$(APP_NAME)

.PHONY: generate-xcode
generate-xcode:
	@swift package generate-xcodeproj
