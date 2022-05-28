#!/bin/bash


##BASH SCRIPT

###command removes first 54!!!! bytes from the image.raw

tail -c +55 image.raw > image_nohead.raw

##

###encryption with public key

./enc -k public.pem -e image_nohead.raw image_nohead.enc

##

###encrypted image payload has increased size -> reduce size to first 192k

head -c 196608 image_nohead.enc > image_short.enc

##

###add header to final file: enc.bmp 

head -c 54 image.raw | cat - image_short.enc > enc.bmp

#removing temporary files
rm image.raw image_nohead* image_short.enc 
