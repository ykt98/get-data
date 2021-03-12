zip_name=dir('H:\ACs Product Compasion\MGEX Product\resource data\11-12');
n=length(zip_name);
target=('H:\ACs Product Compasion\MGEX Product\resource data\11-12');
for i=1:n
    name=zip_name(i).name;
    if ~contains(name,'.gz')
        continue;
    end
    if contains(name,'.CLK')
        savename=[name(1:3) name(14:18) '.CLK' '.gz'];
    elseif contains(name,'.SP3')
        savename=[name(1:3) name(14:18) '.SP3' '.gz'];
    else
        continue;
    end
    movefile([target '\' name],[target '\' savename]) 
    gunzip([target '\' savename], target)
    delete([target '\' savename]);
end


% %%%*.*d文件转*.*o文件
% convert='crx2rnx.exe';
% path='H:\GAMP\data\obs';
% obsname=dir(path);
% n=length(obsname);
% target=(path);
% copyfile(convert,path);
% 
% for i=3:n
%     name=obsname(i).name;
%     if  contains(name,'.crx')
%         savename=[name(1:4) name(15:19) '.20d'];
%     else
%         continue;
%     end
%     movefile([target '\' name],[target '\' savename]) 
% end
% 
% cd (path)
% system('for %a in (*.*d) do crx2rnx.exe %a');
% cd ..
% delete([path '\*.*d'])
% delete([path '\*.exe'])
%     
    
    