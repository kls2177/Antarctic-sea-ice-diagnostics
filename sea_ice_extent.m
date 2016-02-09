% SEA_ICE_EXTENT - calculates sea ice extent.

%monthly files of aice (sea ice concentration in percent) for the Southern Hemisphere (sh)
file1 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.0.allyrs.nc');
file2 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.1.allyrs.nc');
file3 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.2.allyrs.nc');
file4 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.3.allyrs.nc');
file5 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.4.allyrs.nc');
file6 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.5.allyrs.nc');
file7 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.6.allyrs.nc');
file8 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.7.allyrs.nc');
file9 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.8.allyrs.nc');
file10 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.9.allyrs.nc');
file11 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.10.allyrs.nc');
file12 = strcat('/c/ksmith/WACCM_piCtrl/aice_sh_piControl.11.allyrs.nc');

%sea ice grid information
file13 = ['/b/ksmith/CMIP5/CCSM4/CICE_grid.NH.nc'];

%read in sea ice variables
f1  = netcdf.open(char(file1), 'NC_NOWRITE');
ai_jan = squeeze(netcdf.getVar(f1,8,'float'));

f2  = netcdf.open(char(file2), 'NC_NOWRITE');
ai_feb = squeeze(netcdf.getVar(f2,8,'float'));

f3  = netcdf.open(char(file3), 'NC_NOWRITE');
ai_mar = squeeze(netcdf.getVar(f3,8,'float'));

f4  = netcdf.open(char(file4), 'NC_NOWRITE');
ai_apr = squeeze(netcdf.getVar(f4,8,'float'));

f5  = netcdf.open(char(file5), 'NC_NOWRITE');
ai_may = squeeze(netcdf.getVar(f5,8,'float'));

f6  = netcdf.open(char(file6), 'NC_NOWRITE');
ai_jun = squeeze(netcdf.getVar(f6,8,'float'));

f7  = netcdf.open(char(file7), 'NC_NOWRITE');
ai_jul = squeeze(netcdf.getVar(f7,8,'float'));

f8  = netcdf.open(char(file8), 'NC_NOWRITE');
ai_aug = squeeze(netcdf.getVar(f8,8,'float'));

f9  = netcdf.open(char(file9), 'NC_NOWRITE');
ai_sept = squeeze(netcdf.getVar(f9,8,'float'));

f10  = netcdf.open(char(file10), 'NC_NOWRITE');
ai_oct = squeeze(netcdf.getVar(f10,8,'float'));

f11  = netcdf.open(char(file11), 'NC_NOWRITE');
ai_nov = squeeze(netcdf.getVar(f11,8,'float'));

f12  = netcdf.open(char(file12), 'NC_NOWRITE');
ai_dec = squeeze(netcdf.getVar(f12,8,'float'));

f13  = netcdf.open(char(file13), 'NC_NOWRITE');
tlat = netcdf.getVar(f12,4,'float');
tlon = netcdf.getVar(f12,5,'float');
tarea = netcdf.getVar(f12,17,'float');
tarea = squeeze(tarea(:,:,1));

%initialize sea ice extent arrays
ai_jan15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_feb15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_mar15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_apr15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_may15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_jun15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_jul15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_aug15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_sept15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_oct15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_nov15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));
ai_dec15 = zeros(size(ai_jan,1),size(ai_jan,2),size(ai_jan,3));

%remove topography and retain only grid cells with >= 15% sea ice concentration
 for i = 1:size(ai_jan15,1);
    for j = 1:size(ai_jan15,2);
        for k = 1:size(ai_jan15,3);
        if (ai_jan15(i,j,k) >= 1e10)
            ai_jan15(i,j,k) = 0;
        elseif (ai_jan15(i,j,k) < 15)
            ai_jan15(i,j,k) = 0;
        else
            ai_jan15(i,j,k) = 1;
        end
      end
    end
 end

for i = 1:size(ai_feb15,1);
    for j = 1:size(ai_feb15,2);
        for k = 1:size(ai_feb15,3);
        if (ai_feb15(i,j,k) >= 1e10)
            ai_feb15(i,j,k) = 0;
        elseif (ai_feb(i,j,k) < 15)
            ai_feb15(i,j,k) = 0;
        else
            ai_feb15(i,j,k) = 1;
        end
      end
    end
end

for i = 1:size(ai_mar15,1);
    for j = 1:size(ai_mar15,2);
      for k = 1:size(ai_mar15,3);
        if (ai_mar15(i,j,k) >= 1e10)
            ai_mar15(i,j,k) = 0;
        elseif (ai_mar(i,j,k) < 15)
            ai_mar15(i,j,k) = 0;
        else
            ai_mar15(i,j,k) = 1;
        end
    end
  end
end

for i = 1:size(ai_apr15,1);
    for j = 1:size(ai_apr15,2);
        for k = 1:size(ai_apr15,3);
        if (ai_apr15(i,j,k) >= 1e10)
            ai_apr15(i,j,k) = 0;
        elseif (ai_apr15(i,j,k) < 15)
             ai_apr15(i,j,k) = 0;
        else
            ai_apr15(i,j,k) = 1;
        end
    end
  end
end

for i = 1:size(ai_may15,1);
    for j = 1:size(ai_may15,2);
        for k = 1:size(ai_may15,3);
        if (ai_may(i,j,k) >= 1e10)
            ai_may15(i,j,k) = 0;
        elseif (ai_may15(i,j,k) < 15)
            ai_may15(i,j,k) = 0;
        else
            ai_may15(i,j,k) = 1;
        end
    end
  end
end

for i = 1:size(ai_jun15,1);
    for j = 1:size(ai_jun15,2);
        for k = 1:size(ai_jun15,3);
        if (ai_jun15(i,j,k) >= 1e10)
            ai_jun15(i,j,k) = 0;
        elseif  (ai_jun15(i,j,k) < 15)
           ai_jun15(i,j,k) = 0;
        else
            ai_jun15(i,j,k) = 1;
        end
     end
  end
end

for i = 1:size(ai_jul15,1);
    for j = 1:size(ai_jul15,2);
        for k = 1:size(ai_jul15,3);
        if (ai_jul15(i,j,k) >= 1e10)
            ai_jul15(i,j,k) = 0;
        elseif (ai_jul15(i,j,k) < 15)
            ai_jul15(i,j,k) = 0;
        else
            ai_jul15(i,j,k) = 1;
        end
      end
    end
end

for i = 1:size(ai_aug15,1);
    for j = 1:size(ai_aug15,2);
        for k = 1:size(ai_aug15,3);
        if (ai_aug15(i,j,k) >= 1e10)
            ai_aug15(i,j,k) = 0;
        elseif (ai_aug15(i,j,k) < 15)
            ai_aug15(i,j,k) = 0;
        else
            ai_aug15(i,j,k) = 1;
        end
      end
    end
end

for i = 1:size(ai_sept15,1);
    for j = 1:size(ai_sept15,2);
        for k = 1:size(ai_sept15,3);
        if (ai_sept15(i,j,k) >= 1e10)
            ai_sept15(i,j,k) = 0;
        elseif (ai_sept15(i,j,k) < 15)
            ai_sept15(i,j,k) = 0;
        else
            ai_sept15(i,j,k) = 1;
        end
      end
    end
end

for i = 1:size(ai_oct15,1);
    for j = 1:size(ai_oct15,2);
        for k = 1:size(ai_oct15,3);
        if (ai_oct15(i,j,k) >= 1e10)
            ai_oct15(i,j,k) = 0;
        elseif (ai_oct15(i,j,k) < 15)
            ai_oct15(i,j,k) = 0;
        else
            ai_oct15(i,j,k) = 1;
        end
      end
    end
end

  for i = 1:size(ai_nov15,1);
    for j = 1:size(ai_nov15,2);
        for k = 1:size(ai_nov15,3);
        if (ai_nov15(i,j,k) >= 1e10)
            ai_nov15(i,j,k) = 0;
        elseif (ai_nov15(i,j,k) < 15)
            ai_nov15(i,j,k) = 0;
        else
            ai_nov15(i,j,k) = 1;
        end
      end
    end
  end

for i = 1:size(ai_dec15,1);
    for j = 1:size(ai_dec15,2);
        for k = 1:size(ai_dec15,3);
        if (ai_dec15(i,j,k) >= 1e10)
            ai_dec15(i,j,k) = 0;
        elseif (ai_dec15(i,j,k) < 15)
            ai_dec15(i,j,k) = 0;
        else
            ai_dec15(i,j,k) = 1;
        end
      end
    end
end

%create seasonal means
ai_djf15 = (ai_jan15(:,:,2:200) + ai_feb15(:,:,2:200) + ai_dec15(:,:,1:199))/3;
ai_jja15 = (ai_jun15 + ai_aug15 + ai_jul15)/3;
ai_mam15 = (ai_apr15 + ai_may15 + ai_mar15)/3;
ai_son15 = (ai_oct15 + ai_nov15 + ai_sept15)/3;

%compute sea ice extent (sea ice concentration multiplied by the 
%area of each cell and then summed over all grid cells)
fr = 0; fr_ki = 0;
for j = 1:size(ai_djf15,3),
   for i = 1:size(ai_djf15,2)
        for k = 1:size(ai_djf15,1)
            fr_djf_ki(k,i,j) = ai_djf15(k,i,j)*tarea(k,i);
            fr = fr + fr_djf_ki(k,i,j);
        end
   end
   fr_djf(j) = fr;
   fr = 0;
end

fr = 0; fr_ki = 0;
for j = 1:size(ai_mam15,3),
   for i = 1:size(ai_mam15,2)
        for k = 1:size(ai_mam15,1)
            fr_mam_ki(k,i,j) = ai_mam15(k,i,j)*tarea(k,i);
            fr = fr + fr_mam_ki(k,i,j);
        end
   end
   fr_mam(j) = fr;
   fr = 0;
end

fr = 0; fr_ki = 0;
for j = 1:size(ai_jja15,3),
   for i = 1:size(ai_jja15,2)
        for k = 1:size(ai_jja15,1)
            fr_jja_ki(k,i,j) = ai_jja15(k,i,j)*tarea(k,i);
            fr = fr + fr_jas_ki(k,i,j);
        end
   end
   fr_jja(j) = fr;
   fr = 0;
end

fr = 0; fr_ki = 0;
for j = 1:size(ai_son15,3),
   for i = 1:size(ai_son15,2)
        for k = 1:size(ai_son15,1)
            fr_son_ki(k,i,j) = ai_son15(k,i,j)*tarea(k,i);
            fr = fr + fr_son_ki(k,i,j);
        end
   end
   fr_son(j) = fr;
   fr = 0;
end

for i = 1:size(ai_jan15,3)
    year(i) = i;
end

filename = strcat('WACCM_SIE_piControl_SH.mat')
save(char(filename))
