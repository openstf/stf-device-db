models := $(shell jq -r '"model-" + keys[]' data/devices-latest.json static/devices-static.json)

.PHONY: clean

all: \
	dist/devices-latest.json \
	model-_default \
	$(models)

clean:
	rm -rf dist

$(models): model-%: \
	dist/icon/x24/%.jpg \
	dist/icon/x120/%.jpg \
	dist/photo/x800/%.jpg

model-_default: \
	dist/icon/x24/_default.jpg \
	dist/icon/x120/_default.jpg \
	dist/photo/x800/_default.jpg

dist: | build
	mkdir -p $@

dist/devices-latest.json: data/devices-latest.json static/devices-static.json | dist
	jq -S -s '.[0] * .[1]' $^ > $@

build:
	mkdir -p $@

build/icon:
	mkdir -p $@

build/photo:
	mkdir -p $@

build/icon/%.jpg: | build/icon
	(cp data/icon/$*.jpg $@ || cp static/icon/$*.jpg $@ || cp static/icon/_default.jpg $@) 2>/dev/null

build/photo/%.jpg: | build/photo
	(cp data/photo/$*.jpg $@ || cp static/photo/$*.jpg $@ || cp static/photo/_default.jpg $@) 2>/dev/null

dist/icon/x24: | dist
	mkdir -p $@

dist/icon/x24/%.jpg: build/icon/%.jpg | dist/icon/x24
	gm convert $< -resize 24x24 $@
	jpegoptim --strip-all $@

dist/icon/x120: | dist
	mkdir -p $@

dist/icon/x120/%.jpg: build/icon/%.jpg | dist/icon/x120
	gm convert $< -resize 120x120 $@
	jpegoptim --strip-all $@

dist/photo/x800: | dist
	mkdir -p $@

dist/photo/x800/%.jpg: build/photo/%.jpg | dist/photo/x800
	gm convert $< -resize '800x800>' $@
	jpegoptim --strip-all $@
