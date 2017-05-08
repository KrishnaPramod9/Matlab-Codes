function gb_full()

clc;
clear all; 
close all;



img=imread('lion.jpg');
img=rgb2gray(img);
img=imresize(img,[256 256],'bilinear');
%[N N]=size(img)
imshow(img)
img=im2double(img);

display('To perform the Gabor Transform of the given image, please enter the following:');
sigma=input('Enter the value of sigma  ');
psi=input('Enter the value of psi   ');
gamma=input('Enter the value of gamma   ');
l1=input('Enter the number of lambda you want to take   ');
lambda=input('Enter the different values of lambda  ');
t1=input('Enter the number of theta you want to take  ');
theta=input('Enter the different values of theta');

for i=1:l1
    l=lambda(i);
    figure
    for j=1:t1
        t=theta(j);
        g1=gabor_fn(sigma,t,l,psi,gamma);
        display('value of lambda');
		display(l);
        display('value of theta ');
		display(t);
        display('output of gabor filter will be');display(g1);
%         figure
        subplot(1,t1,j);
        GT=conv2(img,double(g1),'same');
        imshow(GT);
    end
end 

end

function gb=gabor_fn(s,t,l,psi,g)
 
s_x = s;
s_y = s/g;
 
% Bounding box
nstds = 3;
xmax = max(abs(nstds*s_x*cos(t)),abs(nstds*s_y*sin(t)));
xmax = ceil(max(1,xmax));
ymax = max(abs(nstds*s_x*sin(t)),abs(nstds*s_y*cos(t)));
ymax = ceil(max(1,ymax));
xmin = -xmax; ymin = -ymax;
[x,y] = meshgrid(xmin:xmax,ymin:ymax);
 
% Rotation 
x_t=x.*cos(t)+y.*sin(t);
y_t=-x.*sin(t)+y.*cos(t);
 
gb= ((1/(2*pi*s_x *s_y)) * exp(-.5*(x_t.^2/s_x^2    +y_t.^2/s_y^2)).*cos(2*pi/l*x_t+psi));
end
