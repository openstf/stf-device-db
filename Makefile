modelsSmall := $(addprefix model-,$(basename $(notdir $(wildcard data/small/*.jpg))))
modelsBig := $(addprefix model-,$(basename $(notdir $(wildcard data/big/*.jpg))))

.PHONY: clean

all: \
	dist/devices-latest.json \
	$(modelsSmall) \
	$(modelsBig)

clean:
	rm -rf dist

$(modelsSmall): model-%: \
	dist/icon/x24/%.jpg \
	dist/icon/x120/%.jpg

$(modelsBig): model-%: \
	dist/photo/x800/%.jpg

dist:
	mkdir -p $@

dist/devices-latest.json: data/devices-latest.json | dist
	cp $< $@

dist/icon/x24: | dist
	mkdir -p $@

dist/icon/x24/%.jpg: data/small/%.jpg | dist/icon/x24
	gm convert $< -resize 24x24 $@
	jpegoptim --strip-all $@

dist/icon/x120: | dist
	mkdir -p $@

dist/icon/x120/%.jpg: data/small/%.jpg | dist/icon/x120
	gm convert $< -resize 120x120 $@
	jpegoptim --strip-all $@

dist/photo/x800: | dist
	mkdir -p $@

dist/photo/x800/%.jpg: data/big/%.jpg | dist/photo/x800
	gm convert $< -resize '800x800>' $@
	jpegoptim --strip-all $@
