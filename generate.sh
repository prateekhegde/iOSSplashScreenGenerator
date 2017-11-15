#This script generates all the portrait splash screen images required for all iOS devices. It uses ImageMagick to fill the top and
#bottom with black borders. 
#The first argument needs to be an image of dimensions 2048 x 2048.

#TODO: Add support for landscape orientation.
#TODO: Detect dominant color to fill blank space. 

#!/usr/local/bin/bash

generate_images() {

	if [ $# != 1 ]
		then
		echo "ERROR: Run this script with an argument being an image of dimensions 2048 x 2048. Exiting.";
		return;
	fi;

	image=$1;
	
	if [ ! -f "$image" ]
		then
		echo "ERROR: File $image not found. Exiting.";
		return;
	fi;

	echo "$1 is the image being used to generate splash screens.";

	echo "Generating splash screens..";
	mkdir LaunchScreenAssets

	# iPad Pro 12.9" portrait dimensions 2048px × 2732px
	convert $image -bordercolor black -border 0x342 LaunchScreenAssets/LaunchImage@2048x2732.png 
	# iPad Pro 10.5" portrait dimensions 1668px x 2224px
	convert $image -resize 1668x1668 -bordercolor black -border 0x278 LaunchScreenAssets/LaunchImage@1668x2224.png
	# iPad 9.7" portrait dimensions 1536px x 2048px, iPad Portrait iOS 7-9@2x: 1536x2048
	convert $image -resize 1536x1536 -bordercolor black -border 0x256 LaunchScreenAssets/LaunchImage@1536x2048.png
	# iPad Portrait iOS 5,6@2x 
	convert $image -resize 1536x1536 -bordercolor black -border 0x256 LaunchScreenAssets/LaunchImage@1536x2048-1.png
	#iPad Portrait 5,6@1x
	convert $image -resize 768x768 -bordercolor black -border 0x128 LaunchScreenAssets/LaunchImage@768x1024.png	
	# iPad Portrait 7,9@1x
	convert $image -resize 768x768 -bordercolor black -border 0x128 LaunchScreenAssets/LaunchImage@768x1024-1.png
	# iPhone X portrait dimensions 1125px x 2436px
	convert $image -resize 1125x1125 -bordercolor black -border 0x655.5 LaunchScreenAssets/LaunchImage@@1125x2436.png
 	# iPhone (6/7/8)+ portrait dimensions 1242px x 2208px
 	convert $image -resize 1242x1242 -bordercolor black -border 0x483 LaunchScreenAssets/LaunchImage@1242x2208.png
	# iPhone 6/7/8 portrait dimensions 750px x 1334px 
	convert $image -resize 750x750 -bordercolor black -border 0x292 LaunchScreenAssets/LaunchImage@750x1334.png
	# iPhone SE/5S portrait dimensions 640px x 1136px (Retina 4)
	convert $image -resize 640x640 -bordercolor black -border 0x248 LaunchScreenAssets/LaunchImage@640x1136.png
	# iPhone SE/5S portrait dimensions 640px x 1136px (2x)
	convert $image -resize 640x640 -bordercolor black -border 0x248 LaunchScreenAssets/LaunchImage@640x1136-1.png
	# Deprecated - iPhone Portrait iOS 5,6 - 1x
	convert $image -resize 320x320 -bordercolor black -border 0x80 LaunchScreenAssets/LaunchImage@320x480.png
	# Deprecated - iPhone Portrait iOS 5,6 - 2x
	convert $image -resize 640x640 -bordercolor black -border 0x160 LaunchScreenAssets/LaunchImage@640x960.png
	# Deprecated - iPhone Portrait iOS 5,6 - Retina 4 
	convert $image -resize 640x640 -bordercolor black -border 0x160 LaunchScreenAssets/LaunchImage@640x960-1.png

	echo "Done!";
}

generate_images $1;



