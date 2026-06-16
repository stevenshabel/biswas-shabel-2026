base_path = 'C:\';
figname = 'licking_violin_all_learners';
in_t = BehT;
bar_int = 131:162;
exclude_raw_n = 0;
TrainingT = 4;
TrialT = [1:10];
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
op_pess_trials = 'All';
licking_filter = 0;
lick_filter_int = 163:167;
select_mice_list = {};
exclude_mice_list = {'D31'};

clear data1 data2 data3 data4 data5 data6 data1_t data2_t data3_t data4_t data5_t data6_t newT data1_m data2_m data3_m data4_m data5_m data6_m data1_bar data2_bar data3_bar data4_bar data5_bar data6_bar data1_m_bar data2_m_bar data3_m_bar data4_m_bar data5_m_bar data6_m_bar


[data1_t] = filter_BigT_121925(in_t, exclude_raw_n,  TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list);
%   opts : struct with fields:
%          - windowBins   : vector of indices (e.g., 153:162)   (REQUIRED)
%          - lickVar      : licking column name (default "Licking_10s_baseline")
%          - useTypeVar   : "TrialType" or "TrialTypeGrp" (default "TrialType")
%          - sortMouseIDs : true/false; natural sort D1,D2,...,D10 (default true)

opts.windowBins = 131:162;
opts.useTypeVar = 'TrialTypeGrp';
% opts.useTypeVar = 'TrialType';

data1_bar = nanmean(data1_t.Licking_10s_baseline(:,bar_int),2);

newT = [data1_t];
newData = [data1_bar];
newT.newData = newData;

tt3 = newT.newData(newT.TrialTypeGrp == '3',:);
tt4 = newT.newData(newT.TrialTypeGrp == '4',:);
ttnpos = newT.newData(newT.TrialTypeGrp == '5or8',:);
ttmid = newT.newData(newT.TrialTypeGrp == '6or9',:);
ttnneg = newT.newData(newT.TrialTypeGrp == '7or10',:);
ttodor = newT.newData(newT.TrialTypeGrp == '1or2',:);

tstruc = struct;
tstruc.pos = tt3;
tstruc.npos = ttnpos;
tstruc.mid = ttmid;
tstruc.nneg = ttnneg;
tstruc.neg = tt4;
tstruc.odor = ttodor;

d6_color = [0.6500    0.6500    0.6500]; % gray
d5_color = [0.8900    0.0100    0.0100]; % red
d4_color = [1.0000    0.4100    0.1600]; % orange
d3_color = [0.9300    0.6900    0.1300]; % yellow
d2_color = [0.3000    0.7500    0.9300]; % light blue
d1_color = [0         0.4500    0.7400]; % dark blue

violinw=0.4;
% binw=5;
binw=.06;
filledornot=1;
color1cell={d1_color,d2_color,d3_color,d4_color,d5_color,d6_color};
color2cell={[0 0 0]};
h1=figure;a1=axes; hold(a1,'on');

draw_violin_plot(a1,violinw,1,tstruc.pos,binw,filledornot,color1cell{1},color2cell{1},0,0);
draw_violin_plot(a1,violinw,2,tstruc.npos,binw,filledornot,color1cell{2},color2cell{1},0,0);
draw_violin_plot(a1,violinw,3,tstruc.mid,binw,filledornot,color1cell{3},color2cell{1},0,0);
draw_violin_plot(a1,violinw,4,tstruc.nneg,binw,filledornot,color1cell{4},color2cell{1},0,0);
draw_violin_plot(a1,violinw,5,tstruc.neg,binw,filledornot,color1cell{5},color2cell{1},0,0);
draw_violin_plot(a1,violinw,6,tstruc.odor,binw,filledornot,color1cell{6},color2cell{1},0,0);

ylim([0 0.9])

savefig([base_path figname]);
exportgraphics(h1,[base_path figname '.emf'])
