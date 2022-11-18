

%% read .txt file --> replace 'fmq' with your file's name
% make sure this script is in the same foler of the data
clear all;clc;
fileID = fopen('fmq.txt','r');
formatSpec = '%f';
data = fscanf(fileID,formatSpec);

%% setting - you can modify it everytime when you have new setting in measurement
total_num_of_meas_point = 306; % total number of point you scan
samples_per_point = 4795; % in each point, how many points(wavelength) are scanned
len_of_file = length(data);

%% separate the data (no need to modify)
% the data are X, Y, W, and I
% the row number --> num of scanned wavelength
% the col number --> num of scanned points
k = 1;
j = 1;
for i=1:4:len_of_file
    X(j,k) = data(i);
    Y(j,k) = data(i+1);
    W(j,k) = data(i+2);
    I(j,k) = data(i+3);
    j = j + 1;
    if mod(j,samples_per_point+1) == 0
        j = 1;
        k = k + 1;
    end
end

%% save the data and plot figures in another script
save('data','X','Y','W','I')