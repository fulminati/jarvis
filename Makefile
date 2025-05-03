
build:
	@mush build --release

install: build
	@mush install --path .

open-android-device:
	@mush run -- open-android-device

log-android-device:
	@mush run -- log-android-device

play-sound-android-device:
	@mush run -- play-sound-android-device

list-files-android-device:
	@mush run -- list-files-android-device

wakeup:
	@mush run -- wakeup

sleep:
	@mush run -- sleep

visit:
	@mush run -- visit $(url)

push:
	@git add .
	@git commit -am "New release!" || true
	@git push