

%% read data file
% make sure they are in the same folder
% do not skip any fig setting
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
col_num = 18; % read it from figure 1
row = 10; % from bottom to top (the point you want)
col = 8; % from left to right (the point you want)

% plot the figure
index = col_num*row + col;
plot(W(:,index),I(:,index),'r')
grid on
xlim([W(1,index),W(end,index)])

% save the data
%wavelength = W(:,index)';
%intensity = I(:,index)';
%save('fig2','wavelength','intensity')

%% figure 3 -- the index(x-axis) of the wavelength you may concern
figure(3)
plot(W(:,1))
grid on

%% figure 4 -- for a certain wavelength, X,Y vs I
% you need to check the index(x-axis) of the waveform you want to check
figure(4)
index = 2792;

j = 1; k = 1;
for i = 1:length(X(index,:))
    x(j,k) = X(index,i);
    y(j,k) = Y(index,i);
    inten(j,k) = I(index,i);
    j = j + 1;
    if mod(j,col_num+1) == 0
        j = 1;
        k = k + 1;
    end
end
s = surf(x,y,inten)
s.EdgeColor = 'none';
grid on
box on
% save the data
%save('fig4','x','y','intensity')
