base_path = 'C:\';
figname = 'Licking_sucrose_op_pess_trials_learners';
in_t  = BehT;
rm = 1;
data_int = 153:212;
bar_int = 163:212;
x_ticks = 10:10:70;
x_tick_labels = {'0','1','2','3','4','5'};
legend_names = {'Op','Pess'};
x_label =  'Time (s)';
y_label = '\Delta Z';
num_data = 5;
font_size = 28;

% **** need to get actual SE from LME and replace these values *******
errors = [1 1]; % 1 row vector of errors from LME
% ******************************************************************

d2_color = [0.8900    0.0100    0.0100]; % red
% d4_color = [1.0000    0.4100    0.1600]; % orange
% d3_color = [0.9300    0.6900    0.1300]; % yellow
% d2_color = [0.3000    0.7500    0.9300]; % light blue
d1_color = [0         0.4500    0.7400]; % dark blue
% d3_color = [0.6500    0.6500    0.6500]; % gray
% d4_color = [0.6500    0.6500    0.6500]; % gray

d_colormap = [d1_color;d2_color];
linewidth = 6;
linestyle = '-';

% filter settings - Data 1
exclude_raw_n = 0;
TrainingT = 4;
TrialT = [3 5:7];
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

op_pess_mice =  'All';
skew_thresh = 0;
op_pess_trials = 'op';
licking_filter = 1;
lick_filter_int = 163:167;
select_mice_list = {};
exclude_mice_list = {'D31'};  % has no optimistic trial 6 so need to exclude for per mouse but not per line

clear data1 data2 data3 data4 data5 data6 data1_t data2_t data3_t data4_t data5_t data6_t newT data1_m data2_m data3_m data4_m data5_m data6_m data1_bar data2_bar data3_bar data4_bar data5_bar data6_bar data1_m_bar data2_m_bar data3_m_bar data4_m_bar data5_m_bar data6_m_bar


[data1_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data1_t.LMEcat = categorical(repmat(1,[size(data1_t,1) 1]));
data1 = nanmean(data1_t.Licking_10s_baseline(:,data_int),1);
data1_bar = nanmean(data1_t.Licking_10s_baseline(:,bar_int),2);
[data1_m_temp, mouseIDs] = average_signal_per_mouse(data1_t, 'Licking_10s_baseline');
data1_m = data1_m_temp(:,data_int);
data1_m_bar = nanmean(data1_m_temp(:,bar_int),2);

% filter settings - Data 2
op_pess_trials = 'pess';
[data2_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
data2_t.LMEcat = categorical(repmat(2,[size(data2_t,1) 1]));
data2 = nanmean(data2_t.Licking_10s_baseline(:,data_int),1);
data2_bar = nanmean(data2_t.Licking_10s_baseline(:,bar_int),2);
[data2_m_temp, mouseIDs] = average_signal_per_mouse(data2_t, 'Licking_10s_baseline');
data2_m = data2_m_temp(:,data_int);
data2_m_bar = nanmean(data2_m_temp(:,bar_int),2);

% % filter settings - Data 3
% TrialT = [1 2];
% op_pess_trials = 'All';
% [data3_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
% % data3_t = data3_t(data3_t.TrialTypeGrp == '1or2',:);
% data3_t.LMEcat = categorical(repmat(3,[size(data3_t,1) 1]));
% data3 = nanmean(data3_t.Licking_10s_baseline(:,data_int),1);
% data3_bar = nanmean(data3_t.Licking_10s_baseline(:,bar_int),2);
% [data3_m_temp, mouseIDs] = average_signal_per_mouse(data3_t, 'Licking_10s_baseline');
% data3_m = data3_m_temp(:,data_int);
% data3_m_bar = nanmean(data3_m_temp(:,bar_int),2);

% % filter settings - Data 4
% TrialT = [2];
% [data4_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
% % data4_t = data4_t(data4_t.TrialTypeGrp == '7or10',:);
% data4_t.LMEcat = categorical(repmat(3,[size(data4_t,1) 1]));
% data4 = nanmean(data4_t.Licking_10s_baseline(:,data_int),1);
% data4_bar = nanmean(data4_t.Licking_10s_baseline(:,bar_int),2);
% [data4_m_temp, mouseIDs] = average_signal_per_mouse(data4_t, 'Licking_10s_baseline');
% data4_m = data4_m_temp(:,data_int);
% data4_m_bar = nanmean(data4_m_temp(:,bar_int),2);

% % filter settings - Data 5
% TrialT = 4;
% [data5_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
% data5 = nanmean(data5_t.Licking_10s_baseline(:,data_int),1);
% data5_bar = nanmean(data5_t.Licking_10s_baseline(:,bar_int),2);
% [data5_m_temp, mouseIDs] = average_signal_per_mouse(data5_t, 'Licking_10s_baseline');
% data5_m = data5_m_temp(:,data_int);
% data5_m_bar = nanmean(data5_m_temp(:,bar_int),2);
% 
% % filter settings - Data 6
% TrialT = [1 2];
% [data6_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
% data6_t = data6_t(data6_t.TrialTypeGrp == '1or2',:);
% data6 = nanmean(data6_t.Licking_10s_baseline(:,data_int),1);
% data6_bar = nanmean(data6_t.Licking_10s_baseline(:,bar_int),2);
% [data6_m_temp, mouseIDs] = average_signal_per_mouse(data6_t, 'Licking_10s_baseline');
% data6_m = data6_m_temp(:,data_int);
% data6_m_bar = nanmean(data6_m_temp(:,bar_int),2);

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
                end
          end
    end

    newT.newData = newData;
    % newT.TrialType = categorical(newT.TrialType);
    formula = 'newData ~ LMEcat + TrialType + (1|MouseID)' ;
    % newT.New_Bias_2perside = categorical(newT.New_Bias_2perside);
    mdl = fitlme(newT,formula,'DummyVarCoding','reference')
    anova(mdl)
    
    coefTest(mdl,[0 1 zeros([1 (num_data - 2)])])
    if exist("data3_t") == 1
        coefTest(mdl,[0 1 -1 zeros(1,(num_data - 3))])
        if exist("data4_t") == 1
            coefTest(mdl,[0 0 1 -1 zeros(1,(num_data - 4))])
            if exist("data5_t") == 1
                coefTest(mdl,[0 0 0 1 -1 zeros(1,(num_data - 5))])
                if exist("data6_t") == 1
                    coefTest(mdl,[0 0 0 0 1 -1])
                end
            end
        end
    end
end

% get estimate and SE for all levels (except last one which is missing)

mdl2 = fitlme(newT,formula,'DummyVarCoding','effects');

% now get estimate and SE for last level

C  = mdl2.Coefficients;
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
out = hidden_level_effects(mdl2, 'LMEcat');
estimates = [C.Estimate(end);out.estimate] % first is intercept
SE_all = [C.SE(end);out.se] % first is intercept
estimates = estimates;
SE_all = SE_all;

% make line plots

fh = figure;
plot(data1,'Color',d1_color,'LineWidth',linewidth,'LineStyle',linestyle)
hold on
if exist('data2') == 1
    plot(data2,'Color',d2_color,'LineWidth',linewidth,'LineStyle',linestyle)
    if  exist('data3') == 1
      plot(data3,'Color',d3_color,'LineWidth',linewidth,'LineStyle',linestyle)
        if exist('data4') == 1
            plot(data4,'Color',d4_color,'LineWidth',linewidth,'LineStyle',linestyle)
           if exist('data5') == 1
              plot(data5,'Color',d5_color,'LineWidth',linewidth,'LineStyle',linestyle)
               if exist('data6') == 1
                  plot(data6,'Color',d6_color,'LineWidth',linewidth,'LineStyle',linestyle)
               end
           end
        end
    end
end
ax = gca;
ax.FontSize = font_size;
legend(legend_names)
box off
legend('Box','off')
xlabel(x_label)
ylabel(y_label, 'Interpreter', 'tex')
xticks(x_ticks);
xticklabels(x_tick_labels);
stop = 1;
savefig([base_path figname '_pertrial_line']);
exportgraphics(fh,[base_path figname '_pertrial_line' '.emf'])



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



% make LME estimate and SE bar plots

fh = figure;
bw_ylabel = 'Estimate (\beta)';
handles = barweb(estimates((length(estimates) - 1):end), SE_all((length(SE_all) - 1):end), width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type,leg_font_size);
box('off')
xlim([.57 1.43])
ax = gca;
ax.FontSize = font_size;

savefig([base_path figname 'LME_bar']);
exportgraphics(fh,[base_path figname 'LME_bar' '.emf'])


