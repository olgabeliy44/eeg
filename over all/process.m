clc;
clear;
close all;

%% CC VS CCB
% Getting the features from Control.CC
CTRL_CC_EEG_Data = extractFeatures('control', 'cc');
% Getting the features from Control.CCB
CTRL_CCB_EEG_Data = extractFeatures('control', 'cb');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CC_CCB = myPhdiffmeasure('control.cc', 'control.cb');
COHERE_CC_CCB = myMSCohere('control.cc', 'control.cb');
disp('CC VS CCB')
% T-test, Statistical Analysis
[TTEST_CC_VS_CCB_H, TTEST_CC_VS_CCB_P] = myTtest(CTRL_CC_EEG_Data, CTRL_CCB_EEG_Data);

%% CC VS SC1, CC VS SC2
%%%%%%%% CC VS SC1 %%%%%%%%
% Getting the features from t1.sc1
T1_SC1_EEG_Data = extractFeatures('t1', 'sc1');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CC_SC1 = myPhdiffmeasure('control.cc', 't1.sc1');
COHERE_CC_SC1 = myMSCohere('control.cc', 't1.sc1');
disp('CC VS SC1')
% T-test, Statistical Analysis
[TTEST_CC_VS_SC1_H, TTEST_CC_VS_SC1_P] = myTtest(CTRL_CC_EEG_Data, T1_SC1_EEG_Data);

%%%%%%%% CC VS SC2 %%%%%%%%
% Getting the features from t2.sc2
T2_SC2_EEG_Data = extractFeatures('t2', 'sc2');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CC_SC2 = myPhdiffmeasure('control.cc', 't2.sc2');
COHERE_CC_SC2 = myMSCohere('control.cc', 't2.sc2');
disp('CC VS SC2')
% T-test, Statistical Analysis
[TTEST_CC_VS_SC2_H, TTEST_CC_VS_SC2_P] = myTtest(CTRL_CC_EEG_Data, T2_SC2_EEG_Data);

%% CCB VS SCB1, CCB VS SCB2, CCB VS NSB1, CCB VS NSCB2
% Getting the features from t1.scb1
T1_SCB1_EEG_Data = extractFeatures('t1', 'sb1');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_SCB1 = myPhdiffmeasure('control.cb', 't1.scb1');
COHERE_CC_SCB1 = myMSCohere('control.cb', 't1.scb1');
disp('CCB VS SCB1')
% T-test, Statistical Analysis
[TTEST_CCB_VS_SCB1_H, TTEST_CCB_VS_SCB1_P] = ...
    myTtest(CTRL_CCB_EEG_Data, T1_SCB1_EEG_Data);

%%%%%%%% CCB vs SCB2 %%%%%%%%%
% Getting the features from t2.scb2
T2_SCB2_EEG_Data = extractFeatures('t2', 'sb2');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_SCB2 = myPhdiffmeasure('control.cb', 't2.scb2');
COHERE_CC_SCB2 = myMSCohere('control.cb', 't2.scb2');
disp('CCB VS SCB2')
% T-test, Statistical Analysis
[TTEST_CCB_VS_SCB2_H, TTEST_CCB_VS_SCB2_P] = ...
    myTtest(CTRL_CCB_EEG_Data, T2_SCB2_EEG_Data);

%%%%%%%% CCB vs NSCB1 %%%%%%%%%
% Getting the features from t1.nscb1
T1_NSCB1_EEG_Data = extractFeatures('t1', 'nb1');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_NSCB1 = myPhdiffmeasure('control.cb', 't1.nscb1');
COHERE_CCB_NSCB1 = myMSCohere('control.cb', 't1.nscb1');
disp('CCB VS NSCB1')
% T-test, Statistical Analysis
[TTEST_CCB_VS_NSCB1_H, TTEST_CCB_VS_NSCB1_P] = ...
    myTtest(CTRL_CCB_EEG_Data, T1_NSCB1_EEG_Data);

%%%%%%%% CCB vs NSCB2 %%%%%%%%%
% Getting the features from t2.nscb2
T2_NSCB2_EEG_Data = extractFeatures('t2', 'nb2');
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_NSCB2 = myPhdiffmeasure('control.cb', 't2.nscb2');
COHERE_CCB_NSCB2 = myMSCohere('control.cb', 't2.nscb2');
disp('CCB VS NSCB2')
% T-test, Statistical Analysis
[TTEST_CCB_VS_NSCB2_H, TTEST_CCB_VS_NSCB2_P] = ...
    myTtest(CTRL_CCB_EEG_Data, T2_NSCB2_EEG_Data);

%% SC1 VS SCB1, SC1 VS NSCB1
%%%%%%%% SC1 vs SCB1 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC1_SCB1 = myPhdiffmeasure('t1.sc1', 't1.scb1');
COHERE_SC1_SCB1 = myMSCohere('t1.sc1', 't1.scb1');
disp('SC1 VS SCB1')
% T-test, Statistical Analysis
[TTEST_SC1_VS_SCB1_H, TTEST_SC1_VS_SCB1_P] = ...
    myTtest(T1_SC1_EEG_Data, T1_SCB1_EEG_Data);
%%%%%%%% SC1 vs NSCB1 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC1_NSCB1 = myPhdiffmeasure('t1.sc1', 't1.nscb1');
COHERE_SC1_NSCB1 = myMSCohere('t1.sc1', 't1.nscb1');
disp('SC1 VS NSCB1')
% T-test, Statistical Analysis
[TTEST_SC1_VS_NSCB1_H, TTEST_SC1_VS_NSCB1_P] = ...
    myTtest(T1_SC1_EEG_Data, T1_NSCB1_EEG_Data);

%% SC2 VS SCB2, SC2 VS NSCB2
%%%%%%%% SC2 vs SCB2 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC2_SCB2 = myPhdiffmeasure('t2.sc2', 't2.scb2');
COHERE_SC2_SCB2 = myMSCohere('t2.sc2', 't2.scb2');
disp('SC2 VS SCB2')
% T-test, Statistical Analysis
[TTEST_SC2_VS_SCB2_H, TTEST_SC2_VS_SCB2_P] = ...
    myTtest(T2_SC2_EEG_Data, T2_SCB2_EEG_Data);
%%%%%%%% SC2 vs NSCB2 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC2_NSCB2 = myPhdiffmeasure('t2.sc2', 't2.nscb2');
COHERE_SC2_NSCB2 = myMSCohere('t2.sc2', 't2.nscb2');
disp('SC2 VS NSCB2')
% T-test, Statistical Analysis
[TTEST_SC2_VS_NSCB2_H, TTEST_SC2_VS_NSCB2_P] = ...
    myTtest(T2_SC2_EEG_Data, T2_NSCB2_EEG_Data);

%% SCB1 VS NSCB1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SCB1_NSCB1 = myPhdiffmeasure('t1.scb1', 't1.nscb1');
COHERE_SCB1_NSCB1 = myMSCohere('t1.scb1', 't1.nscb1');
disp('SCB1 VS NSCB1')
% T-test, Statistical Analysis
[TTEST_SCB1_VS_NSCB1_H, TTEST_SCB1_VS_NSCB1_P] = ...
    myTtest(T1_SCB1_EEG_Data, T1_NSCB1_EEG_Data);

%% SCB2 VS NSCB2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SCB2_NSCB2 = myPhdiffmeasure('t2.scb2', 't2.nscb2');
COHERE_SCB2_NSCB2 = myMSCohere('t2.scb2', 't2.nscb2');
disp('SCB2 VS NSCB2')
% T-test, Statistical Analysis
[TTEST_SCB2_VS_NSCB2_H, TTEST_SCB2_VS_NSCB2_P] = ...
    myTtest(T2_SCB2_EEG_Data, T2_NSCB2_EEG_Data);
%% Clean the workspace except specific variables
clearvars -except CTRL_CC_EEG_Data CTRL_CCB_EEG_Data MAX_PHDIFF_BTN_CC_CCB... % CC vs CCB
    TTEST_CC_VS_CCB_H TTEST_CC_VS_CCB_P...                                    
    T1_SC1_EEG_Data MAX_PHDIFF_BTN_CC_SC1 TTEST_CC_VS_SC1_H TTEST_CC_VS_SC1_P... % CC vs SC1
    T2_SC2_EEG_Data MAX_PHDIFF_BTN_CC_SC2 TTEST_CC_VS_SC2_H TTEST_CC_VS_SC2_P... % CC vs SC2
    T1_SCB1_EEG_Data MAX_PHDIFF_BTN_CCB_SCB1 TTEST_CCB_VS_SCB1_H TTEST_CCB_VS_SCB1_P... % CCB vs SCB1
    T2_SCB2_EEG_Data MAX_PHDIFF_BTN_CCB_SCB2 TTEST_CCB_VS_SCB2_H TTEST_CCB_VS_SCB2_P... % CCB vs SCB2
    T1_NSCB1_EEG_Data MAX_PHDIFF_BTN_CCB_NSCB1 TTEST_CCB_VS_NSCB1_H TTEST_CCB_VS_NSCB1_P... % CCB vs NSCB1
    T2_NSCB2_EEG_Data MAX_PHDIFF_BTN_CCB_NSCB2 TTEST_CCB_VS_NSCB2_H TTEST_CCB_VS_NSCB2_P... % CCB vs NSCB1
    MAX_PHDIFF_BTN_SC1_SCB1 TTEST_SC1_VS_SCB1_H TTEST_SC1_VS_SCB1_P...        % SC1 vs SCB1
    MAX_PHDIFF_BTN_SC1_NSCB1 TTEST_SC1_VS_NSCB1_H TTEST_SC1_VS_NSCB1_P...        % SC1 vs SCB1
    MAX_PHDIFF_BTN_SC2_SCB2 TTEST_SC2_VS_SCB2_H TTEST_SC2_VS_SCB2_P...        % SC2 vs SCB2
    MAX_PHDIFF_BTN_SC2_NSCB2 TTEST_SC2_VS_NSCB2_H TTEST_SC2_VS_NSCB2_P...        % SC2 vs SCB2
    MAX_PHDIFF_BTN_SCB1_NSCB1 TTEST_SCB1_VS_NSCB1_H TTEST_SCB1_VS_NSCB1_P...  % SCB1 vs NSCB1
    MAX_PHDIFF_BTN_SCB2_NSCB2 TTEST_SCB2_VS_NSCB2_H TTEST_SCB2_VS_NSCB2_P...  % SCB1 vs NSCB1
    COHERE_CC_CCB COHERE_CC_SC1 COHERE_CC_SC2 COHERE_CC_SCB1 COHERE_CC_SCB2;