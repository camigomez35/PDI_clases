clear all, close all, clc
a = imread('placa_3.bmp');aa=a;
%a=imresize(a,0.5);
[fil, col, cap]= size(a);
if cap>1; a=rgb2gray(a); end;

a=imclearborder(a);

[l,n] = bwlabel(a);
figure(1); imagesc(l);colormap('hot');
title(['Numero objetos = ', num2str(n)]);
impixelinfo
b=[];
for i=1:n
    c=a*0;
    c(l==i)=255;
    area = sum(c(:)/255);
    %figure(2);imshow(c);
    %title(['Area = ', num2str(area)]);
    %pause%(1);
    b=[b,area];
end
figure(2); plot(b);

ind = max(b);
ind = find(b==ind);
d=a*0; d(l==ind)=255;
figure(3); imshow(d);
[fil, col]=find(d>0);
fil_min = min(fil(:));
fil_max = max(fil(:));
col_min = min(col(:));
col_max = max(col(:));

e = aa(fil_min:fil_max,col_min:col_max, :);
figure(4); imshow(e);

