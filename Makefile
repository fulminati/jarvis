
build:
	@mush build --release

install: build
	@mush install --path .

open-android-device:
	@mush run -- open-android-device

wakeup:
	@mush run -- wakeup

sleep:
	@mush run -- sleep

visit:
	@mush run -- visit $(url)
