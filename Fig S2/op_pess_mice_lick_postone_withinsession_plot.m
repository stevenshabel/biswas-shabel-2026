base_path = 'C:\';
figname = 'op_pess_lick_withinsession_plot';

in_t  = BehT;
rm = 1;
data_int = 96:200;
bar_int = 131:162;
x_ticks = 5:20:105;
x_tick_labels = {'0','2','4','6','8','10'};
legend_names = {'O','P','O','P','O','P','O','P'};
x_label =  'Time (s)';
y_label = '\Delta Z';
num_data = 8;
font_size = 28;

% **** need to get actual SE from LME and replace these values *******
errors = [1 1 1 1 1 1 1 1]; % 1 row vector of errors from LME
% ******************************************************************

d2_color = [0.8900    0.0100    0.0100]; % red
d4_color = [1.0000    0.4100    0.1600]; % orange
d5_color = [0.9300    0.6900    0.1300]; % yellow
d3_color = [0.3000    0.7500    0.9300]; % light blue
d1_color = [0         0.4500    0.7400]; % dark blue
d6_color = [0.6500    0.6500    0.6500]; % gray
% d2_color = [0.6500    0.6500    0.6500]; % gray

% d4_color = [0.6500    0.6500    0.6500]; % gray

d_colormap = [d1_color;d2_color;d1_color;d2_color;d1_color;d2_color;d1_color;d2_color];
linewidth = 6;
linestyle1 = '-';
linestyle2 = '- -';

% filter settings - Data 1
exclude_raw_n = 0;
TrainingT = 4;
TrialT = [3];
lick_discrim_thresh = .01;
lick_discrim_cat = 'posneg_p';
neural_discrim_thresh = 1;
neural_discrim_cat = 'posneg_neural_p';

lick_discrim_thresh_posodor = 1;
lick_discrim_cat_posodor = 'posodor_p';
neural_discrim_thresh_posodor = 1;
neural_discrim_cat_posodor = 'posodor_neural_p';

lick_discrim_thresh_negodor = 1;
lick_discrim_cat_negodor = 'negodor_p';
neural_discrim_thresh_negodor = 1;
neural_discrim_cat_negodor = 'negodor_neural_p';

op_pess_mice =  'op';
skew_thresh = 0;
op_pess_trials = 'All';
licking_filter = 0;
lick_filter_int = 163:167;
select_mice_list = {};
exclude_mice_list = {'D31'};

clear data1 data2 data3 data4 data5 data6 data1_t data2_t data3_t data4_t data5_t data6_t newT data1_m data2_m data3_m data4_m data5_m data6_m data1_bar data2_bar data3_bar data4_bar data5_bar data6_bar data1_m_bar data2_m_bar data3_m_bar data4_m_bar data5_m_bar data6_m_bar

in_t = BehT(BehT.TrialNum <= 30,:);
[data1_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data1_t.LMEcat = categorical(repmat(1,[size(data1_t,1) 1]));
data1 = nanmean(data1_t.Licking_10s_baseline(:,data_int),1);
data1_bar = nanmean(data1_t.Licking_10s_baseline(:,bar_int),2);
[data1_m_temp, mouseIDs] = average_signal_per_mouse(data1_t, 'Licking_10s_baseline');
data1_m = data1_m_temp(:,data_int);
data1_m_bar = nanmean(data1_m_temp(:,bar_int),2);

% filter settings - Data 2
op_pess_mice =  'pess';

[data2_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data2_t.LMEcat = categorical(repmat(2,[size(data2_t,1) 1]));
data2 = nanmean(data2_t.Licking_10s_baseline(:,data_int),1);
data2_bar = nanmean(data2_t.Licking_10s_baseline(:,bar_int),2);
[data2_m_temp, mouseIDs] = average_signal_per_mouse(data2_t, 'Licking_10s_baseline');
data2_m = data2_m_temp(:,data_int);
data2_m_bar = nanmean(data2_m_temp(:,bar_int),2);

% % filter settings - Data 3
op_pess_mice =  'op';

in_t = BehT(BehT.TrialNum <= 60 & BehT.TrialNum > 30,:);
[data3_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);

data3_t.LMEcat = categorical(repmat(3,[size(data3_t,1) 1]));
data3 = nanmean(data3_t.Licking_10s_baseline(:,data_int),1);
data3_bar = nanmean(data3_t.Licking_10s_baseline(:,bar_int),2);
[data3_m_temp, mouseIDs] = average_signal_per_mouse(data3_t, 'Licking_10s_baseline');
data3_m = data3_m_temp(:,data_int);
data3_m_bar = nanmean(data3_m_temp(:,bar_int),2);

% filter settings - Data 4
op_pess_mice =  'pess';

[data4_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data4_t.LMEcat = categorical(repmat(4,[size(data4_t,1) 1]));
data4 = nanmean(data4_t.Licking_10s_baseline(:,data_int),1);
data4_bar = nanmean(data4_t.Licking_10s_baseline(:,bar_int),2);
[data4_m_temp, mouseIDs] = average_signal_per_mouse(data4_t, 'Licking_10s_baseline');
data4_m = data4_m_temp(:,data_int);
data4_m_bar = nanmean(data4_m_temp(:,bar_int),2);

% % filter settings - Data 5
op_pess_mice =  'op';

in_t = BehT(BehT.TrialNum <= 90 & BehT.TrialNum > 60,:);
[data5_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data5_t.LMEcat = categorical(repmat(5,[size(data5_t,1) 1]));
data5 = nanmean(data5_t.Licking_10s_baseline(:,data_int),1);
data5_bar = nanmean(data5_t.Licking_10s_baseline(:,bar_int),2);
[data5_m_temp, mouseIDs] = average_signal_per_mouse(data5_t, 'Licking_10s_baseline');
data5_m = data5_m_temp(:,data_int);
data5_m_bar = nanmean(data5_m_temp(:,bar_int),2);

% filter settings - Data 6
op_pess_mice =  'pess';

[data6_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data6_t.LMEcat = categorical(repmat(6,[size(data6_t,1) 1]));
data6 = nanmean(data6_t.Licking_10s_baseline(:,data_int),1);
data6_bar = nanmean(data6_t.Licking_10s_baseline(:,bar_int),2);
[data6_m_temp, mouseIDs] = average_signal_per_mouse(data6_t, 'Licking_10s_baseline');
data6_m = data6_m_temp(:,data_int);
data6_m_bar = nanmean(data6_m_temp(:,bar_int),2);



% % filter settings - Data 7
op_pess_mice =  'op';

in_t = BehT(BehT.TrialNum <= 120 & BehT.TrialNum > 90,:);
[data7_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data7_t.LMEcat = categorical(repmat(7,[size(data7_t,1) 1]));
data7 = nanmean(data7_t.Licking_10s_baseline(:,data_int),1);
data7_bar = nanmean(data7_t.Licking_10s_baseline(:,bar_int),2);
[data7_m_temp, mouseIDs] = average_signal_per_mouse(data7_t, 'Licking_10s_baseline');
data7_m = data7_m_temp(:,data_int);
data7_m_bar = nanmean(data7_m_temp(:,bar_int),2);

% filter settings - Data 8
op_pess_mice =  'pess';

[data8_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data8_t.LMEcat = categorical(repmat(8,[size(data8_t,1) 1]));
data8 = nanmean(data8_t.Licking_10s_baseline(:,data_int),1);
data8_bar = nanmean(data8_t.Licking_10s_baseline(:,bar_int),2);
[data8_m_temp, mouseIDs] = average_signal_per_mouse(data8_t, 'Licking_10s_baseline');
data8_m = data8_m_temp(:,data_int);
data8_m_bar = nanmean(data8_m_temp(:,bar_int),2);

% do LME
if exist("data2_t") == 1
    newT = [data1_t];
    newData = [data1_bar];
    newT = [newT;data2_t];
    newData = [newData;data2_bar];
    if exist("data3_t") == 1
      newT = [newT;data3_t];
      newData = [newData;data3_bar];
          if exist("data4_t") == 1
             newT = [newT;data4_t];
             newData = [newData;data4_bar];
                if exist("data5_t") == 1
                  newT = [newT;data5_t];
                  newData = [newData;data5_bar];
                   if exist("data6_t") == 1
                    newT = [newT;data6_t];
                    newData = [newData;data6_bar];
                   end
                       if exist("data7_t") == 1
                        newT = [newT;data7_t];
                        newData = [newData;data7_bar];
                       end
                           if exist("data8_t") == 1
                            newT = [newT;data8_t];
                            newData = [newData;data8_bar];
                           end
                end
          end
    end

    newT.newData = newData;
    formula = 'newData ~ LMEcat + (1|MouseID)' ;
    % newT.New_Bias_2perside = categorical(newT.New_Bias_2perside);
    mdl = fitlme(newT,formula,'DummyVarCoding','effects')
     anova(mdl)
    
    % coefTest(mdl,[0 1 zeros([1 (num_data - 2)])])
    % if exist("data3_t") == 1
    %     coefTest(mdl,[0 1 -1 zeros(1,(num_data - 3))])
    %     if exist("data4_t") == 1
    %         coefTest(mdl,[0 0 1 -1 zeros(1,(num_data - 4))])
    %         if exist("data5_t") == 1
    %             coefTest(mdl,[0 0 0 1 -1 zeros(1,(num_data - 5))])
    %             if exist("data6_t") == 1
    %                 coefTest(mdl,[0 0 0 0 1 -1])
    %             end
    %         end
    %     end
    % end
end

% get estimate and SE for all levels (except last one which is missing)
out = hidden_level_effects(mdl, 'LMEcat');
estimates = [mdl.Coefficients.Estimate(2:end); out.estimate];
se = [mdl.Coefficients.SE(2:end); out.se];
% mdl2 = fitlme(newT,formula,'DummyVarCoding','effects')
% 
% % now get estimate and SE for last level
% 
% C  = mdl2.Coefficients;
% V  = mdl2.CoefficientCovariance;
% nm = string(C.Name);
% 
% idx = [2:(num_data)]';   % 
% b   = C.Estimate(idx);
% Vsub = V(idx,idx);
% 
% last_est = -sum(b);
% w = -ones(numel(idx),1);
% last_se = sqrt(w.' * Vsub * w);
% 
% estimates = [C.Estimate;last_est] % first is intercept
% SE_all = [C.SE;last_se] % first is intercept
% estimates = estimates(2:end);
% SE_all = SE_all(2:end);



% make bar plots

fh = figure;

barvalues = [];
barvalues(1,1) = nanmean(data1_bar,1);
barvalues_m = [];
barvalues_m(1,1) = nanmean(data1_m_bar,1);
barvalues_m_err = [];
barvalues_m_err(1,1) = std(data1_m_bar,0,1)/sqrt(size(data1_m_bar,1) - 1);

if exist('data2_bar') == 1
    barvalues(1,2) = nanmean(data2_bar,1);
    barvalues_m(1,2) = nanmean(data2_m_bar,1);
    barvalues_m_err(1,2) = std(data2_m_bar,0,1)/sqrt(size(data2_m_bar,1) - 1);

    if exist('data3_bar') == 1
      barvalues(1,3) = nanmean(data3_bar,1);
      barvalues_m(1,3) = nanmean(data3_m_bar,1);
      barvalues_m_err(1,3) = std(data3_m_bar,0,1)/sqrt(size(data3_m_bar,1) - 1);

        if exist('data4_bar') == 1
            barvalues(1,4) = nanmean(data4_bar,1);
            barvalues_m(1,4) = nanmean(data4_m_bar,1);
            barvalues_m_err(1,4) = std(data4_m_bar,0,1)/sqrt(size(data4_m_bar,1) - 1);

            if exist('data5_bar') == 1
              barvalues(1,5) = nanmean(data5_bar,1);
              barvalues_m(1,5) = nanmean(data5_m_bar,1);
              barvalues_m_err(1,5) = std(data5_m_bar,0,1)/sqrt(size(data5_m_bar,1) - 1);

                if exist('data6_bar') == 1
                  barvalues(1,6) = nanmean(data6_bar,1);
                  barvalues_m(1,6) = nanmean(data6_m_bar,1);
                  barvalues_m_err(1,6) = std(data6_m_bar,0,1)/sqrt(size(data6_m_bar,1) - 1);

                end
                    if exist('data7_bar') == 1
                      barvalues(1,7) = nanmean(data7_bar,1);
                      barvalues_m(1,7) = nanmean(data7_m_bar,1);
                      barvalues_m_err(1,7) = std(data7_m_bar,0,1)/sqrt(size(data7_m_bar,1) - 1);
    
                    end
                        if exist('data8_bar') == 1
                          barvalues(1,8) = nanmean(data8_bar,1);
                          barvalues_m(1,8) = nanmean(data8_m_bar,1);
                          barvalues_m_err(1,8) = std(data8_m_bar,0,1)/sqrt(size(data8_m_bar,1) - 1);
        
                        end



            end
        end
    end
end

width = 0.8;
groupnames = [];
bw_title = [];
bw_xlabel = [];
bw_ylabel =y_label;
bw_colormap = d_colormap;
gridstatus = 'none';
bw_legend = legend_names;
error_sides = 2;
legend_type = 'plot';
leg_font_size = font_size;

handles = barweb_noerror(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type,leg_font_size);

box('off')
xlim([.57 1.43])
ax = gca;
ax.FontSize = font_size;
savefig([base_path figname '_pertrial_bar']);
exportgraphics(fh,[base_path figname '_pertrial_bar' '.emf'])

% make per mouse bar plots
fh = figure;
handles = barweb(barvalues_m, barvalues_m_err, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type,leg_font_size);

box('off')
xlim([.57 1.43])
ax = gca;
ax.FontSize = font_size;
savefig([base_path figname '_permouse_bar']);
exportgraphics(fh,[base_path figname '_permouse_bar' '.emf'])

% make LME estimate and SE bar plots

fh = figure;
bw_ylabel = 'Estimate (\beta)';
handles = barweb(estimates, se, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type,leg_font_size);

box('off')
xlim([.57 1.43])
ax = gca;
ax.FontSize = font_size;
savefig([base_path figname 'LME_bar']);
exportgraphics(fh,[base_path figname 'LME_bar' '.emf'])


