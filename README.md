### Description

A shell script that this resizes all images in a folder to a certain aspect ratio, adding a black border/padding to images to that isn't the correct espect ratio. Useful for things like uploading multiple images to Instagram without the photos getting cropped.

### Pre-requisites

Install ImageMagick. This enables the "convert" command to work.
https://imagemagick.org/index.php

### Usage

1. Navigate to the folder the script.
2. Set the correct permission with:

```bash
sudo chmod +x convert.sh
```

3. Run:

```bash
./convert.sh <path-to-image-folder>
```

It will output a another folder with all the converted images.

The current setting converts all images to 1080x1080. To change it, simply go into the script and change the value of the target-ratio. For example, changing the value to "1280x720" instead.
