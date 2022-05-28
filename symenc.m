i = imread("o.bmp");
save -binary sym_image.raw i




##BASH SCRIPT
###command removes first 54!!!! bytes from the image.raw
##tail -c +55 image.raw > image_nohead.raw
##
###encryption with public key
##enc -k ssl/fedora_posao/public.pem -e image_nohead.raw image_nohead.enc
##
###encrypted image payload has increased size -> reduce size to first 192k
##head -c 196608 image_nohead.enc > image_short.enc
##
###add header to image.enc
##head -c 54 image.raw | cat - image_short.enc > image.enc

system('bash ./symenc.sh')


load sym_enc.bmp i;
imwrite(i,"sym_enc.bmp")
imshow(i)