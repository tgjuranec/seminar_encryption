
img = imread("o.bmp");
img32 = uint32(img);
imgenc = uint8(mod(img32+30,256));

imwrite(imgenc,"caesar.bmp")

imshow(imgenc)
