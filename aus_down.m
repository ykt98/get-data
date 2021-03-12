function target = aus_down(RecID,GPSweek,center)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

if ~isstr(GPSweek), GPSweek=num2str(GPSweek);end
if ~isstr(center),  center=num2str(center,'%03d');end
gw=sprintf('%s',GPSweek);
mkdir(sprintf('./%s',gw))%创建文件夹，如2117
target=[pwd '\' GPSweek];
%%%ftp://ftp.gfz-potsdam.de/pub/GNSS/products/mgex
%%%ftp://igs.ign.fr/pub/igs/products/mgex
%%%ftp://cddis.gsfc.nasa.gov/pub/gps/products/mgex/
root=sprintf('ftp://igs.ign.fr/');
path='pub/igs/products/mgex/';
URL{1}=root;

ftpobj=ftp('igs.ign.fr');
ftppath=sprintf('/pub/igs/products/mgex/%s/',GPSweek);
sta_name=dir(ftpobj,ftppath);n=length(sta_name);

for i=1:n
    name=sta_name(i).name;
    if ~contains(name,'.CLK')&&~contains(name,'15M_ORB.SP3')
        continue;
    end
    if ~contains(name,center),continue; end
    URL{1}=sprintf('%s%s/%s/%s',root,path,GPSweek,name);
    [f,status]=urlwrite(URL{1},[target '\' name]);
    if status==0, continue;end
    if contains(name,'.CLK')
        savename=[center name(14:18) '.CLK' '.gz'];
       
    elseif contains(name,'15M_ORB.SP3')
        savename=[center name(14:18) '.SP3' '.gz'];
        
    else
        continue;
    end
    movefile([target '\' name],[target '\' savename]) 
    gunzip([target '\' savename], target)
    delete([target '\' savename]);
end

    
end

