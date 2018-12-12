%% 
clear
clc
close all
%% 第一步，设定trp文件的文件夹路径，默认'berlin_large'
fpth=fullfile(pwd,'berlin_large');
% 生成或读取pts_total.txt
Apth=fullfile(fpth,'pts_total.txt');
if ~exist(Apth,'file')
    [A,cpan]=PrepareTrips(fpth);
else
    A_ori=importdata(Apth);
    cpan=mean(A_ori(:,1:2));
end
save step1