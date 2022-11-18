

%% read data file (make sure they are in the same folder)
clear all;clc;
load('data.mat')

%% figure 1 -- map of points
figure(1)
plot(X(1,:), Y(1,:), 'o')
grid on
box on
x_step = X(1,2)-X(1,1);
y_step = Y(1,10)-Y(1,1);
xlim([X(1,1)-x_step,X(1,end)+x_step])
ylim([Y(1,1)-y_step,Y(1,end)+y_step])

%% figure 2 -- for a particular point, W vs I
% you need to read the following info of the point from figure 1 !!!
figure(2)
row_num = 17; % read it from figure 1
col_num = 18; % read it from figure 2
row = 10; % from bottom to top
col = 8; % from left to right

% plot the figure
index = col_num*row + col;
plot(W(:,index),I(:,index),'r')
grid on
xlim([W(1,index),W(end,index)])

% save the data
wavelength = W(:,index);
intensity = I(:,index);
save('fig2','wavelength','intensity')

%% figure 3 -- the index(x-axis) of the wavelength you may concern
figure(3)
plot(W(:,1))
grid on

%% figure 4 -- for a certain wavelength, X,Y vs I
% you need to check the index(x-axis) of the waveform you want to check
figure(4)
index = 500;
plot3(X(index,:),Y(index,:),I(index,:),'o')
grid on
box on
% save the data
x = X(index,:);
y = Y(index,:);
intensity = I(index,:);
save('fig4','x','y','intensity')