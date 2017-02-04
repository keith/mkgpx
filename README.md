# mkgpx

`mkgpx` is a small CLI for generating [gpx files][gpx] designed for use
with [location simulation in Xcode][xcode].

[gpx]: https://en.wikipedia.org/wiki/GPS_Exchange_Format
[xcode]: https://developer.apple.com/library/content/documentation/IDEs/Conceptual/iOS_Simulator_Guide/CustomizingYourExperienceThroughXcodeSchemes/CustomizingYourExperienceThroughXcodeSchemes.html

## Usage

```sh
$ mkgpx San Francisco
<?xml version="1.0"?>
<gpx version="1.1" creator="Xcode">
    <wpt lat="37.78008" lon="-122.420168">
        <name>San Francisco</name>
    </wpt>
</gpx>
```

```sh
$ mkgpx San Francisco > SF.gpx
```

## Installation

```sh
$ brew install keith/formulae/mkgpx
```

OR

```sh
$ make install
```
