# Requires imagemagick.
# This script only resizes images in the folder, it ignore video files
# Usage: resize <path-to-image-folder>

#!/bin/bash

image_dir=$1
target_ratio="1080x1080"

if [ -z "$image_dir" ]; then
	echo "Please provide image directory as first argument."
	exit 1
fi

if [ ! -d "$image_dir" ]; then
	echo "Not a valid directory"
	exit 1
fi

output_dir="$image_dir-output"
if [ -d $output_dir ]; then
	echo "output folder already exist."
	exit 1
fi

mkdir "$output_dir"

for image in "$image_dir"/*; do
	echo "Checking $image"
	filename=$(basename "$image")
	extension="${filename##*.}" 
	extension_to_lower=$(echo "$extension" | tr '[:upper:]' '[:lower:]')

	if [[ "$extension_to_lower" == "jpg" || "$extension_to_lower" == "jpeg" || "$extension_to_lower" == "png" ]]; then
		echo "converting $filename"
		# convert -bordercolor white -border 100 -gravity center -resize 1200x1200 -extent 1200x1200 $image $output_dir/$filename
		convert -background black -gravity center -resize $target_ratio -extent $target_ratio "$image" "$output_dir"/"$filename"
	fi
done
