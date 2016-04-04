clear all;
close all;

x = imread('Terra.jpg');
load spine
[M,N]=size(x);
whos;

axis auto

x(x==64)=1;
colormap('jet')
imagesc(x)

colormap1=zero(64,3)
