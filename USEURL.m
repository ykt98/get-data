clear all 
close all
clc


%%ftp����

%for i=5:7
    path=aus_down([],2131,'WUM');  %δ���أ�
    path=[pwd '\' num2str(2131)];  %������

%end

%%%http����
% extsp3='0000_01D_05M_ORB.SP3.gz';
% extclk='0000_01D_30S_CLK.CLK.gz';
% for i=1:4
   %httpdown(2131+1,extsp3,1);
   %httpdown(2131+1,extclk,1);  
% end