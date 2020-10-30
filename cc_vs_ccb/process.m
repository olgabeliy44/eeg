clc;
clear;
close all;

%% CC VS CCB

% Getting the features from Control.CC
CTRL_CC_EEG_Data = extractFeatures('control', 'cc');

% Getting the features from Control.CCB
CTRL_CCB_EEG_Data = extractFeatures('control', 'cb');

% Calculating the phase diff between two signals
PHDIFF_BETWEEN_CC_CCB = myPhdiffmeasure('control.cc', 'control.cb');


%% Clean the workspace except specific variables
clearvars -except CTRL_CC_EEG_Data CTRL_CCB_EEG_Data PHDIFF_BETWEEN_CC_CCB;