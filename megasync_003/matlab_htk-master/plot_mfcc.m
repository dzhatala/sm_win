%plot in 3d mfcc
clear ;
clc;
mfcc_file='F:\RESEARCHS\small_vocabulary_\datas\confusable_x240_audacity_v8\bd.mfc';
[ DATA, HTKCode ] = htkread(mfcc_file);
max_frame=max(size(DATA));   %
dt=DATA(1:max_frame,:)';
[x,y]=meshgrid(1:max_frame,1:39);
C=x.*y;
surf(x,y,dt,C);
%bar3(dt);
colorbar;
%surf(x,y,dt);
