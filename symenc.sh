#!/bin/bash

#openssl enc -e -a -md sha1 -aes-256-cbc -salt -P -iter 3
#enter aes-256-cbc encryption password:a
#Verifying - enter aes-256-cbc encryption password:a
#salt=5F25BAE394071DC0
#key=B301A1B5A963C6E5EEF2A6ACE43E8B175390F7757D3D23481C962339822B8634
#iv =A74F3C9AF213143BB41C8CD88F395F67

#key=A095A2EB2459A004B0C8D473817E6295E834B4AF272A111B6BE34982BB347320
#iv =CFD734DBE2C9F0253065E8CBA25CF1DA


###command removes first 54!!!! bytes from the image.raw                      

tail -c +55 sym_image.raw > sym_image_nohead.raw


openssl enc -aes-256-ecb -nopad -nosalt -e \
        -in sym_image_nohead.raw -out sym_image.enc \
        -K 'A095A2EB2459A004B0C8D473817E6295E834B4AF272A111B6BE34982BB347320'

###add header to final file: sym_enc.bmp 

head -c 54 sym_image.raw | cat - sym_image.enc > sym_enc.bmp

#removing temporary files

rm sym_image.raw sym_image_nohead.raw sym_image.enc 
