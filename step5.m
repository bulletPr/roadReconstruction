%% 
clear
clc
close all
%%
load step3
ass=importdata('density_figure.fits_c0.006.up.NDskl.S000.a.segs');
cmpts=min(denpts(:,2:3));
cm=cmpts+cpan;
assp=ass(:,1:4);
asp=assp*10+repmat(cm,size(assp,1),2);
save asp.txt -ascii asp
for i=1:size(asp,1)
    PL{i}.ptnum=2;
    pt1=asp(i,1:2);
    pt2=asp(i,3:4);
    PL{i}.pts0=[pt1;pt2];
end
write_txt_poly_feat(PL,'./result.txt','Polyline',[0,0],1,2);
save step5