%operaciones b�sicas
clear all, close all, clc
%Detector de movimiento

%Habilitar camara
a=videoinput('winvideo',2,'MJPG_1280x720');
b=1; h = [];
while b>0
    %Captura de imagenes
    c=getsnapshot(a); c = imresize(c,0.6);
    d=getsnapshot(a); d = imresize(d,0.6);
    %Diferencia entre las im�genes (movimiento)
    e = d-c; 
    %Total de la diferencia
    f=sum(e(:)); h = [h,f];
    figure(1); imshow(e); title(['diferencia ', num2str(f)]);
    pause(0.0001);
end