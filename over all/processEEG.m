clc;
clear;
close all;

%% CC VS CCB
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CC_CCB = myPhdiffmeasure('control.cc', 'control.cb');
COHERE_CC_CCB = myMSCohere('control.cc', 'control.cb');
disp('CC VS CCB')

%% CC VS SC1, CC VS SC2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CC_SC1 = myPhdiffmeasure('control.cc', 't1.sc1');
COHERE_CC_SC1 = myMSCohere('control.cc', 't1.sc1');
disp('CC VS SC1')

%%%%%%%% CC VS SC2 %%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CC_SC2 = myPhdiffmeasure('control.cc', 't2.sc2');
COHERE_CC_SC2 = myMSCohere('control.cc', 't2.sc2');
disp('CC VS SC2')

%% CCB VS SCB1, CCB VS SCB2, CCB VS NSB1, CCB VS NSCB2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_SCB1 = myPhdiffmeasure('control.cb', 't1.scb1');
COHERE_CC_SCB1 = myMSCohere('control.cb', 't1.scb1');
disp('CCB VS SCB1')

%%%%%%%% CCB vs SCB2 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_SCB2 = myPhdiffmeasure('control.cb', 't2.scb2');
COHERE_CC_SCB2 = myMSCohere('control.cb', 't2.scb2');
disp('CCB VS SCB2')

%%%%%%%% CCB vs NSCB1 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_NSCB1 = myPhdiffmeasure('control.cb', 't1.nscb1');
COHERE_CCB_NSCB1 = myMSCohere('control.cb', 't1.nscb1');
disp('CCB VS NSCB1')

%%%%%%%% CCB vs NSCB2 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_CCB_NSCB2 = myPhdiffmeasure('control.cb', 't2.nscb2');
COHERE_CCB_NSCB2 = myMSCohere('control.cb', 't2.nscb2');
disp('CCB VS NSCB2')

%% SC1 VS SCB1, SC1 VS NSCB1
%%%%%%%% SC1 vs SCB1 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC1_SCB1 = myPhdiffmeasure('t1.sc1', 't1.scb1');
COHERE_SC1_SCB1 = myMSCohere('t1.sc1', 't1.scb1');
disp('SC1 VS SCB1')

%%%%%%%% SC1 vs NSCB1 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC1_NSCB1 = myPhdiffmeasure('t1.sc1', 't1.nscb1');
COHERE_SC1_NSCB1 = myMSCohere('t1.sc1', 't1.nscb1');
disp('SC1 VS NSCB1')

%% SC2 VS SCB2, SC2 VS NSCB2
%%%%%%%% SC2 vs SCB2 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC2_SCB2 = myPhdiffmeasure('t2.sc2', 't2.scb2');
COHERE_SC2_SCB2 = myMSCohere('t2.sc2', 't2.scb2');
disp('SC2 VS SCB2')

%%%%%%%% SC2 vs NSCB2 %%%%%%%%%
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SC2_NSCB2 = myPhdiffmeasure('t2.sc2', 't2.nscb2');
COHERE_SC2_NSCB2 = myMSCohere('t2.sc2', 't2.nscb2');
disp('SC2 VS NSCB2')

%% SCB1 VS NSCB1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SCB1_NSCB1 = myPhdiffmeasure('t1.scb1', 't1.nscb1');
COHERE_SCB1_NSCB1 = myMSCohere('t1.scb1', 't1.nscb1');
disp('SCB1 VS NSCB1')

%% SCB2 VS NSCB2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_SCB2_NSCB2 = myPhdiffmeasure('t2.scb2', 't2.nscb2');
COHERE_SCB2_NSCB2 = myMSCohere('t2.scb2', 't2.nscb2');
disp('SCB2 VS NSCB2')

%% Clean the workspace except specific variables
clearvars -except  MAX_PHDIFF_BTN_CC_CCB COHERE_CC_CCB ... % CC vs CCB                    
    MAX_PHDIFF_BTN_CC_SC1 COHERE_CC_SC1 ... % CC vs SC1
    MAX_PHDIFF_BTN_CC_SC2 COHERE_CC_SC2 ... % CC vs SC2
    MAX_PHDIFF_BTN_CCB_SCB1 COHERE_CCB_SCB1 ... % CCB vs SCB1
    MAX_PHDIFF_BTN_CCB_SCB2 COHERE_CCB_SCB2 ... % CCB vs SCB2
    MAX_PHDIFF_BTN_CCB_NSCB1 COHERE_CCB_NSCB1 ... % CCB vs NSCB1
    MAX_PHDIFF_BTN_CCB_NSCB2 COHERE_CCB_NSCB2 ... % CCB vs NSCB1
    MAX_PHDIFF_BTN_SC1_SCB1 COHERE_SC1_SCB1 ...        % SC1 vs SCB1
    MAX_PHDIFF_BTN_SC1_NSCB1 COHERE_SC1_NSCB1 ...        % SC1 vs SCB1
    MAX_PHDIFF_BTN_SC2_SCB2 COHERE_SC2_SCB2 ...        % SC2 vs SCB2
    MAX_PHDIFF_BTN_SC2_NSCB2 COHERE_SC2_NSCB2 ...        % SC2 vs SCB2
    MAX_PHDIFF_BTN_SCB1_NSCB1 COHERE_SCB1_NSCB1 ...  % SCB1 vs NSCB1
    MAX_PHDIFF_BTN_SCB2_NSCB2 COHERE_SCB2_NSCB2 ...  % SCB1 vs NSCB1