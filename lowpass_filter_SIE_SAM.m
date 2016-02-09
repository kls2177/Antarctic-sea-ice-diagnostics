%This code lowpass filters the time dimension of the data according to user specifications

%load data (SAM and SIE seasonal time series for a GCM (e.g. ccsm))

Cut_off_time1 = i;
F1 = 1/Cut_off_time1;

Cut_off_time2 = i;
F2 = 1/Cut_off_time2;

[SAM_lowpass_ccsm,coef,window,Cx,Ff] = lanczos_filter(SAM_mam_ccsm,[],F1,[],'low');

[SIE_lowpass_ccsm,coef,window,Cx,Ff] = lanczos_filter(SIE_mam_ccsm,[],F2,[],'low');

[c1,p1] = corrcoef(SIE_lowpass_ccsm,SAM_lowpass_ccsm);
c(j) = c1(1,2);
p(j) = p1(1,2);
series(j) = j;
j = j + 1;


for i = 1:length(series)
    for k = 1:12,
      if (p(i) >= 0.05)
          cc(i) = NaN;
      else
          cc(i) = c(i);
      end
    end
end


figure (1)
h = plot(series,c,'m--','LineWidth',2)
not_in_legend(h)
hold on
plot(series,cc,'m-','LineWidth',2)
hold off
