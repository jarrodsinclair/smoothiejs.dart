# Smoothie Charts wrapper for Dart

## Updating

This Dart library is automatically generated from the TypeScript type definition
file provided by the [Smoothie Charts library](https://github.com/joewalnes/smoothie).
To update the Dart code to a newer version of Smoothie Charts, run the
```autogen.sh``` shell script, which uses the
[js_facade_gen](https://github.com/dart-lang/js_facade_gen) tool. The script may
need to be updated also.

## Setup

Download and place ```smoothie.js``` into the ```./example``` directory. Version
1.34.0 is recommended.

```sh
wget -qO example/smoothie.js https://raw.githubusercontent.com/joewalnes/smoothie/327c79402c4250211f11ed5136576a7fb8a44344/smoothie.js
uglifyjs --compress --mangle -- example/smoothie.js > example/smoothie-min.js
```

## Run using Dart 2

First ensure you are running the latest version of Dart 2. Then activate webdev,
get all dependencies, and start the develoment web-server:

```sh
pub global activate webdev
pub get
webdev serve
```
