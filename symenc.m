i = imread("o.bmp");
save -binary sym_image.raw i




##BASH SCRIPT

###key=A095A2EB2459A004B0C8D473817E6295E834B4AF272A111B6BE34982BB347320
###iv =CFD734DBE2C9F0253065E8CBA25CF1DA
##
##
#####command removes first 54!!!! bytes from the image.raw                      
##
##tail -c +55 sym_image.raw > sym_image_nohead.raw
##
##
##openssl enc -aes-256-ecb -nopad -nosalt -e \
##        -in sym_image_nohead.raw -out sym_image.enc \
##        -K 'A095A2EB2459A004B0C8D473817E6295E834B4AF272A111B6BE34982BB347320'
##
#####add header to final file: sym_enc.bmp 
##
##head -c 54 sym_image.raw | cat - sym_image.enc > sym_enc.bmp
##
###removing temporary files
##
##rm sym_image.raw sym_image_nohead.raw sym_image.enc 


system('bash ./symenc.sh')


load sym_enc.bmp i;
imwrite(i,"sym_enc.bmp")
imshow(i)