%% 
clear
clc
close all
%% ��һ�����趨trp�ļ����ļ���·����Ĭ��'berlin_large'
fpth=fullfile(pwd,'berlin_large');
% ���ɻ��ȡpts_total.txt
Apth=fullfile(fpth,'pts_total.txt');
if ~exist(Apth,'file')
    [A,cpan]=PrepareTrips(fpth);
else
    A_ori=importdata(Apth);
    cpan=mean(A_ori(:,1:2));
end
save step1