# pb

Versions of `pbpaste` and `pbcopy` that can handle image representations

## Usage

The examples use [imagemagick][] to create images. Install using `brew install imagemagick`.

```sh
# Create a red 100x100 image and copy it
convert -size 100x100 xc:#990000 png: | pbcp

# Paste it into image.png
pbps > image.png
```

[imagemagick]: https://imagemagick.org/script/index.php
