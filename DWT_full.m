function dwt_full()

clc;
clear all;
close all;

map=gray(256);

%n=1:256;
%x=sin((pi/64)*n)+0.01*(n-100);

% get db filter length 6
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters('bior5.5');

% 2D dwt 
img=imread('lion.jpg');
figure();
imshow(img);

% first dwt
[P, Q]=size(img);

% dwt in row
dwt_row_img=zeros(P, Q);
tmp=zeros(1, Q);
for j=1:P
    tmp(1, 1:Q)=img(j, 1:Q);
    tmp(1, 1:Q)=dwt(tmp, Lo_R);
    dwt_row_img(j, 1:Q)=tmp(1, 1:Q);
end

figure();
imshow(dwt_row_img, map);


% dwt in column
tmp=zeros(1, P);
dwt1_img=zeros(P, Q);
for j=1:Q
    tmp(1, 1:P)=dwt_row_img(1:P, j)';
    tmp(1, 1:P)=dwt(tmp, Lo_R);
    dwt1_img(1:P, j)=tmp(1, 1:P)';
end

figure();
imshow(dwt1_img, map);

%second dwt

img=zeros(P, Q);
img(1:P, 1:Q)=dwt1_img(1:P, 1:Q);
[P, Q]=size(img);
% dwt in row
dwt_row_img=zeros(P, Q);
tmp=zeros(1, Q);
for j=1:P
    tmp(1, 1:Q)=dwt1_img(j, 1:Q);
    tmp(1, 1:Q)=dwt(tmp, Lo_R);
    dwt_row_img(j, 1:Q)=tmp(1, 1:Q);
end

figure();
imshow(dwt_row_img,map);

% dwt in column
tmp=zeros(1, P);
dwt2_img=dwt1_img;
for j=1:Q
    tmp(1, 1:P)=dwt_row_img(1:P, j)';
    tmp(1, 1:P)=dwt(tmp, Lo_R);
    dwt2_img(1:P, j)=tmp(1, 1:P)';
end

figure();
imshow(dwt2_img,map);

end


function g = dwt(f,h)


N = length(h);  
c = f;
h0  = fliplr(h);                          % Scaling filter
h1 = h;  h1(1:2:N) = -h1(1:2:N);          % Wavelet filter

L = length(c);
c = [c(mod((-(N-1):-1),L)+1) c];          % Make periodic


d = conv(c,h1);   d = d(N:2:(N+L-2));     % Convolve & d-sample
c = conv(c,h0);   c = c(N:2:(N+L-2));     % Convolve & d-sample

g = [c,d];                                % The DWT
end
