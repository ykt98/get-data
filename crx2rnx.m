clc
clear
path='H:\ACs Product Compasion\ppp_rms\obs\';  %ряобть
cd (path)
dos('ren *.crx *.20d')

system('for %a in (*.*d) do crx2rnx.exe %a');
cd ..
delete([path '\*.*d'])
delete([path '\*.exe'])
    
obsname=dir(strcat(path,'*20o'));
n=length(obsname);
target=(path);

for i=1:n
    name=obsname(i).name;
    savename=[name(1:4) name(17:20) '.20o'];
    movefile([target '\' name],[target '\' savename]);
end

