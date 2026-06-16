function [out_t] = filter_BigT_121925(in_t, exclude_raw_n, TrainingT,TrialT,lick_discrim_thresh,lick_discrim_cat,neural_discrim_thresh,neural_discrim_cat,lick_discrim_thresh_posodor,lick_discrim_cat_posodor,neural_discrim_thresh_posodor,neural_discrim_cat_posodor,lick_discrim_thresh_negodor,lick_discrim_cat_negodor,neural_discrim_thresh_negodor,neural_discrim_cat_negodor,op_pess_mice,skew_thresh,op_pess_trials,licking_filter,lick_filter_int,select_mice_list,exclude_mice_list)
% 

% filters:  discrim, good data, training session, op or pess
% mouse, op or pess trials, trial types, licking filter, select
% mice, exclude mice

BigT = in_t;

if length(select_mice_list) < 1
    select_mice = 0;
else
    select_mice = 1;
end

if length(exclude_mice_list) < 1
    exclude_mice = 0;
else
    exclude_mice = 1;
end

BigT_f = BigT(BigT.TrainingType == TrainingT,:);

idx = ismember(BigT_f.TrialType, TrialT);
BigT_f = BigT_f(idx, :);
BigT_f.TrialType = categorical(BigT_f.TrialType);

% making TrialTypeGrp to group together same ambiguous tones with different
% outcomes

BigT_f.TrialTypeGrp = categorical(BigT_f.TrialType);   % start from original

% Merge 5 and 8 into one category (label it '5or8' or whatever you like)
BigT_f.TrialTypeGrp = mergecats(BigT_f.TrialTypeGrp, {'5','8'}, '5or8');

% Merge 6 and 9
BigT_f.TrialTypeGrp = mergecats(BigT_f.TrialTypeGrp, {'6','9'}, '6or9');

% Merge 7 and 10
BigT_f.TrialTypeGrp = mergecats(BigT_f.TrialTypeGrp, {'7','10'}, '7or10');

% Merge 1 and 2
BigT_f.TrialTypeGrp = mergecats(BigT_f.TrialTypeGrp, {'1','2'}, '1or2');



% Merge 7 and 10
BigT_f.TrialTypeGrp = mergecats(BigT_f.TrialTypeGrp, {'7','10'}, '7or10');

BigT_f.TrialTypeGrp2 = categorical(BigT_f.TrialType);   % start from original
BigT_f.TrialTypeGrp2 = mergecats(BigT_f.TrialTypeGrp2, {'2','4','8','9','10'}, 'all_suc_om'); % added 2 on 1/24/26
BigT_f.TrialTypeGrp2 = mergecats(BigT_f.TrialTypeGrp2, {'1','3','5','6','7'}, 'all_suc');  % added 1 on 1/24/26

BigT_f.TrialTypeGrp3 = categorical(BigT_f.TrialType);   % start from original
BigT_f.TrialTypeGrp3 = mergecats(BigT_f.TrialTypeGrp3, {'8','9','10'}, 'ambig_suc_om');
BigT_f.TrialTypeGrp3 = mergecats(BigT_f.TrialTypeGrp3, {'5','6','7'}, 'ambig_suc');

BigT_f.TrialTypeGrp4 = categorical(BigT_f.TrialType);   % start from original  % added 1/24/26
BigT_f.TrialTypeGrp4 = mergecats(BigT_f.TrialTypeGrp4, {'5','6','7','8','9','10'}, 'ambig_tones');% added 1/24/256
BigT_f.TrialTypeGrp4 = mergecats(BigT_f.TrialTypeGrp4, {'1','2'}, 'odor_alone');% added 1/24/26

% *********** END OF FILTER SPECS *********************************


if lick_discrim_thresh < 1
if strcmp(lick_discrim_cat,'posneg_p') == 1
    idx = BigT_f.posneg_p < lick_discrim_thresh;
    BigT_f = BigT_f(idx, :);
end
end

if neural_discrim_thresh < 1
if strcmp(neural_discrim_cat,'posneg_neural_p') == 1
    idx = BigT_f.posneg_neural_p < neural_discrim_thresh;
    BigT_f = BigT_f(idx, :);
end
end

if lick_discrim_thresh_posodor < 1
if strcmp(lick_discrim_cat_posodor,'posodor_p') == 1
    idx = BigT_f.posodor_p < lick_discrim_thresh_posodor;
    BigT_f = BigT_f(idx, :);
end
end

if neural_discrim_thresh_posodor < 1
if strcmp(neural_discrim_cat_posodor,'posodor_neural_p') == 1
    idx = BigT_f.posodor_neural_p < neural_discrim_thresh_posodor;
    BigT_f = BigT_f(idx, :);
end
end

if lick_discrim_thresh_negodor < 1
if strcmp(lick_discrim_cat_negodor,'negodor_p') == 1
    idx = BigT_f.negodor_p < lick_discrim_thresh_negodor;
    BigT_f = BigT_f(idx, :);
end
end

if neural_discrim_thresh_negodor < 1
if strcmp(neural_discrim_cat_negodor,'negodor_neural_p') == 1
    idx = BigT_f.negodor_neural_p < neural_discrim_thresh_negodor;
    BigT_f = BigT_f(idx, :);
end
end

if exclude_raw_n == 1
    idx = strcmp(BigT_f.Raw_decision,'n') ~= 1;
    BigT_f = BigT_f(idx, :);
end

if strcmp(op_pess_mice,'All') == 1
    BigT_f = BigT_f;
elseif strcmp(op_pess_mice,'op') == 1
    idx = BigT_f.skew > skew_thresh;
    BigT_f = BigT_f(idx, :);
elseif strcmp(op_pess_mice,'pess') == 1
    idx = BigT_f.skew < skew_thresh;
    BigT_f = BigT_f(idx, :);
end

if strcmp(op_pess_trials,'All') == 1
    BigT_f = BigT_f;
elseif strcmp(op_pess_trials,'op') == 1
    idx = BigT_f.New_Bias_2perside == 1;
    BigT_f = BigT_f(idx, :);
elseif strcmp(op_pess_trials,'pess') == 1
    idx = BigT_f.New_Bias_2perside == 2;
    BigT_f = BigT_f(idx, :);
end

if licking_filter == 1
    idx = nanmean(BigT_f.Licking_10s_baseline(:,lick_filter_int),2) > 0;
    BigT_f = BigT_f(idx, :);
end



if select_mice == 1
    idx = ismember(BigT_f.MouseID,select_mice_list) == 1;
    BigT_f = BigT_f(idx, :);
end

if exclude_mice == 1
    idx = ismember(BigT_f.MouseID,exclude_mice_list) == 0;
    BigT_f = BigT_f(idx, :);
end

% ****** END OF APPLYING FILTERS ******************************************

out_t = BigT_f;
clear BigT_f in_t

