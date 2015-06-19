# stf-device-db

**stf-device-db** is a JSON-based database of smartphones, tablets and wearables. The database includes thumbnails for each device and some basic information about the default model at the time of release. It is not complete; currently it mainly covers devices sold in the Japanese market. Data is added as required.

This database is currently being used in [STF](https://github.com/openstf/stf).

## Features

For each device, the following information is provided:

* Model code (e.g. "SCV31")
* Product name (e.g. "Galaxy S6 edge")
* Thumbnail
* Larger image
* Carrier (most devices in the Japanese market are carrier-specific models)
* Manufacturer
* OS
* CPU
* Memory
* Disk space (if multiple sizes, lowest)
* Release date (on the Japanese market)
* Display size

The model code can usually be retrieved from a device quite easily, which then allows fairly straightforward mapping to the device data. Note that some carriers may sometimes prefix models numbers with their own code, which you must strip first.

## Sources

The data in this repository is updated regularly from various sources.

* [ULTRAZONE's Japanese smartphone database](http://smartphone.ultra-zone.net/) is currently our main provider for phone data. While their data is not open source, we have asked and obtained a permission to use it. The database is unfortunately limited to phones and does not currently offer useful data for tablets or other devices.
* Official press releases. We try to keep model-specific sources in [CREDITS.md](CREDITS.md).
* Manual investigation especially for tablets.

## Requirements

* [Node.js](https://nodejs.org/) >= 0.10
* [jq](http://stedolan.github.io/jq/)
* [jpegoptim](https://github.com/tjko/jpegoptim)
* [GraphicsMagick](http://www.graphicsmagick.org/)

On OS X, you can install the last three with:

```bash
brew install jq jpegoptim graphicsmagick
```

## Building

Simply run `make` at the top of the repo after making sure you have the requirements installed. You will then have a complete list of resized icons and photos in the `dist` folder.

## Usage

Install via NPM:

```bash
npm install --save stf-device-db
```

_The module is prebuilt before publishing, so you don't need the build requirements if you just want to use the library._

Then you must find your device's model number and possibly the internal product name. On Android, this can be done with:

```bash
adb shell getprop ro.product.model
adb shell getprop ro.product.name
```

The internal product name is not required, but helps make a more specific match for some devices (mainly Nexus devices which reuse the model code for newer models of the same size).

For example, for a Nexus 5 these values would be:

```json
{
  "model": "Nexus 5",
  "name": "hammerhead"
}
```

You can then require the database and use it to find matching data based on the above values:

```javascript
var db = require('stf-device-db')

var data = db.find({
  model: 'Nexus 5',
  name: 'hammerhead'
})
```

`data` would then be:

```javascript
{ carrier: { code: 'e', name: 'イー・モバイル' },
  cpu: { cores: 4, freq: 2.26, name: 'Qualcomm Snapdragon 800 MSM8974' },
  date: '2013-11-14T15:00:00.000Z',
  display: { h: 1920, s: 5, w: 1080 },
  maker: { code: 'l', name: 'LG' },
  memory: { ram: 2048, rom: 32768 },
  name: { id: 'Nexus 5', long: 'EM01L' },
  os: { type: 'android', ver: '5.1' },
  image: 'Nexus_5.jpg' }
```

If no match is found, `find()` returns `null`.

Device thumbnails and photos are provided in the `dist` folder. It can be served as a static folder.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

See [LICENSE](LICENSE).

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
