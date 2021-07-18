clc;
clear all;
io=imread('Cameraman.tif');
%io=rgb2gray(io);
Noise_Image=imnoise(io,'salt & pepper',0.1);
%imwrite(Noise_Image,'78019_09.bmp');
% Noise_Image=imread('peppers2_09.bmp');
Denoised_Image_ANN_bF=ANN_bF(Noise_Image);


psnr_ANN_bF=psnr(Denoised_Image_ANN_bF,io);
ssim_ANN_bF=ssim(Denoised_Image_ANN_bF,io);
IEF_ANN_bF=(sum(sum((double(Noise_Image-io)).^2)))/(sum(sum((double(Denoised_Image_ANN_bF-io)).^2)));

montage({io,Noise_Image,Denoised_Image_ANN_bF}, 'Size', [1 3]);
