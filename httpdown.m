function httpdown(week,ext,j)

sta='ESA0MGNFIN_';
% week=2124;
% ydoy=2020264;
% ext='0000_01D_01D_ERP.ERP.gz';

local='D:\gamp\精密产品下载并解压\观测文件\';
	
for i=22+7*(j-1):22+7*j
    ydoy=sprintf('20202%d',i);
	file=sprintf('%s%s%s',sta,ydoy,ext);
	path=sprintf('%s%d/','http://navigation-office.esa.int/products/gnss-products/',week);
	
    
    localfile=[local,file];
    URL{1}=sprintf('%s%s',path,file);
     urlwrite(URL{1},localfile);
end