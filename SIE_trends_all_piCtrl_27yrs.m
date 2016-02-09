clear all

%load SIE pictrl data
load CCSM4_piControl_pp_27yrs.mat

lengthyear_ccsm = length(sie_ann_ccsm);
for i = 1:lengthyear_ccsm, year_ccsm(i) = i;end

%load CCSM4 ensemble members (repeat for other models)
load hist_r1i1p1_pp.mat
load hist_r4i1p1_pp.mat
load hist_r6i1p1_pp.mat

lengthyear_ccsm_hist_001 = length(sie_ann_ccsm_hist_001);
for i = 1:lengthyear_ccsm_hist_001, year_ccsm_hist_001(i) = i;end

sie_month_ccsm_hist = (sie_month_ccsm_hist_r1 + sie_month_ccsm_hist_r4 + sie_month_ccsm_hist_r6)/3;

for i = 1:12,
    month(i) = i;
end

%load HadISST SIE data
load HadISST_19792005

%load NASA Team SIE data
load NASA_19792005

%load Bootstrap SIE data
load Bootstrap_19792005

for i = 1:size(NASA,1),year_obs(i) = i; end

for i = 1:12,
    NASA_MEAN(i) = mean(NASA(1:27,i));
    Bootstrap_mean(i) = mean(Bootstrap(:,i));
end

%plot pictrl and hist SIE model output along with satellite observations
figure (1)
subplot(1,2,1)
plot(month, sie_month_ccsm, 'b-','LineWidth',2);
hold on
plot(month,Bootstrap_mean/10^6,'k--','LineWidth',2)
hold on
plot(month,NASA_MEAN,'k-','LineWidth',2)
hold on
plot(month,HadISST/10^12,'k-.','LineWidth',2)
hold on
set(gca,'TickDir', 'out', ...
        'XLim', [1 12], ...
        'XTick', [1:1:12],...
        'XTickLabel', {'J'; 'F'; 'M';'A';'M';'J'; 'J'; 'A'; 'S'; 'O'; 'N'; 'D';}, ...
        'FontSize', 14, 'FontWeight', 'bold', 'LineWidth', 1);
    xlabel('Month','FontSize', 14, 'FontWeight','bold');
    ylabel('SIE (10^6 km^2)','FontSize', 14, 'FontWeight','bold');
    title('(a) Pre-Industrial Monthly Mean Antarctic SIE', 'FontSize', 14, 'FontWeight','bold');

subplot(1,2,2)
plot(month, sie_month_ccsm_hist, 'b-','LineWidth',2);
hold on
plot(month,Bootstrap_mean/10^6,'k--','LineWidth',2)
hold on
plot(month,NASA_MEAN,'k-','LineWidth',2)
hold on
plot(month,HadISST/10^12,'k-.','LineWidth',2)
hold on
set(gca,'TickDir', 'out', ...
        'XLim', [1 12], ...
        'XTick', [1:1:12],...
        'XTickLabel', {'J'; 'F'; 'M';'A';'M';'J'; 'J'; 'A'; 'S'; 'O'; 'N'; 'D';}, ...
        'FontSize', 14, 'FontWeight', 'bold', 'LineWidth', 1);
    xlabel('Month','FontSize', 14, 'FontWeight','bold');
    ylabel('SIE (10^6 km^2)','FontSize', 14, 'FontWeight','bold');
    title('(b) 1979-2005 Monthly Mean Antarctic SIE', 'FontSize', 14, 'FontWeight','bold');


%calculate linear fits to model pictrl SIE time series segments 
%with trends that are multiples of the observational trend
[p1_ann,S1_ann] = polyfit(year_ccsm(25:51),sie_ann_anom_ccsm(25:51)/10^12,1);
[y1_ann_ccsm1,del1_ann] = polyval(p1_ann,year_ccsm(25:51),S1_ann);
[p1_ann,S1_ann] = polyfit(year_ccsm(353:379),sie_ann_anom_ccsm(353:379)/10^12,1);
[y1_ann_ccsm2,del1_ann] = polyval(p1_ann,year_ccsm(353:379),S1_ann);
[p1_ann,S1_ann] = polyfit(year_ccsm(194:220),sie_ann_anom_ccsm(194:220)/10^12,1);
[y1_ann_ccsm3,del1_ann] = polyval(p1_ann,year_ccsm(194:220),S1_ann);
[p1_ann,S1_ann] = polyfit(year_ccsm(298:324),sie_ann_anom_ccsm(298:324)/10^12,1);
[y1_ann_ccsm4,del1_ann] = polyval(p1_ann,year_ccsm(298:324),S1_ann);

%plot annual mean (ann) pictrl SIE anomaly time series with highlighted segments
figure(2)
h6 = plot(year_ccsm,sie_ann_anom_ccsm/10^12,'-','Color',[0.4 0.4 0.4],'LineWidth',2)
set(get(get(h6,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','off');
hold on
plot(year_ccsm(25:51),sie_ann_anom_ccsm(25:51)/10^12,'b-','LineWidth',2)
hold on
h1 = plot(year_ccsm(25:51),y1_ann_ccsm1,'b-','LineWidth',2);
set(get(get(h1,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','off');
hold on
plot(year_ccsm(353:379),sie_ann_anom_ccsm(353:379)/10^12,'r-','LineWidth',2)
hold on
h2 = plot(year_ccsm(353:379),y1_ann_ccsm2,'r-','LineWidth',2);
set(get(get(h2,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','off');
hold on
plot(year_ccsm(194:220),sie_ann_anom_ccsm(194:220)/10^12,'g-','LineWidth',2)
hold on
h3 = plot(year_ccsm(194:220),y1_ann_ccsm3,'g-','LineWidth',2);
set(get(get(h3,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','off');
hold on
plot(year_ccsm(298:324),sie_ann_anom_ccsm(298:324)/10^12,'y-','LineWidth',2)
hold on
h4 = plot(year_ccsm(298:324),y1_ann_ccsm4,'y-','LineWidth',2);
set(get(get(h4,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','off');
hleg1 = legend('+1 x Obs. Trend', '-1 x Obs. Trend', '+3 x Obs. Trend', '-3 x Obs. Trend')
     set(hleg1, 'FontSize',12,'FontWeight','bold','Box','off','Location','North','Orientation','Horizontal')
set(gca,'XLim',[1 500],'YLim',[-3 3],'FontSize', 14, 'FontWeight','bold');
xlabel('Year','FontSize', 14, 'FontWeight','bold');
ylabel('SIE (10^6 km^2)','FontSize', 14, 'FontWeight','bold');
title('(a) CCSM4','FontSize', 14, 'FontWeight','bold');

for i = 1:27,year_obs(i) = i; end

%Probability Density Function (kernel density estimation) of 27-year trends from pictrl integrations
%(example here is for austral autumn (March-April-May - MAM)
[f1,x1] = ksdensity(trend_mam_ccsm(1:474));

%calculate 1979-2005 trends in Historical ensemble members
[trend_mam_ccsm_7905_001,S1_mam] = polyfit(year_ccsm_hist_001(130:156),sie_mam_ccsm_hist_001(130:156)/10^12,1);
[trend_mam_ccsm_7905_002,S1_mam] = polyfit(year_ccsm_hist_001(130:156),sie_mam_ccsm_hist_002(130:156)/10^12,1);
[trend_mam_ccsm_7905_003,S1_mam] = polyfit(year_ccsm_hist_001(130:156),sie_mam_ccsm_hist_003(130:156)/10^12,1);

trend_mam_allmodels_19792005 = cat(1,trend_mam_ccsm_7905_001(1)*10,trend_mam_ccsm_7905_002(1)*10,trend_mam_ccsm_7905_003(1)*10,...
    trend_mam_waccm_7905_001(1)*10,trend_mam_waccm_7905_002(1)*10,trend_mam_waccm_7905_003(1)*10,trend_mam_waccm_7905_007(1)*10,trend_mam_gfdlg_7905(1)*10,...
    trend_mam_gfdlm_7905(1)*10);

%mean of HadISST/NASA/Bootstrap
mean_obs_trend = (HadISST + NASA_MEAN + Boostrap_mean)/3;

xmax2 = max(trend_mam_allmodels_19792005)
xmin2 = min(trend_mam_allmodels_19792005)

j = 1;
for i = 0:0.001:xmax2-xmin2,
    x3(j) = xmin2 + i;
    j = j + 1;
end

y4 = zeros(length(x3));
y5 = 2.5*ones(length(x3));

mean_model_trend = mean(trend_mam_allmodels_19792005);

%plot PDF along with historical and satellite observation trends
figure(3)
h= jbfill(x3,y4,y5,[0.7 0.7 0.7],[0.7 0.7 0.7],1,0.3);
not_in_legend(h)
hold on
plot(x1,f1,'b-','LineWidth',2);
hold on
plot(mean_obs_trend*ones(1,length(f1)),linspace(0,2.5,length(f1)),'k-','LineWidth',2)
hold on
plot(mean_model_trend*ones(1,length(f1)),linspace(0,2.5,length(f1)),'k--','LineWidth',2)
set(gca,'FontSize',14,'FontWeight','bold','Layer','top');
ylabel('Probability Density','FontSize',14,'FontWeight','bold');
xlabel('27-year Trends (10^6 km^2 dec^-^1)','FontSize',14,'FontWeight','bold');
title('(b) MAM','FontSize',14,'FontWeight','bold');
