clc;
clear;
close all;

%% RRI VS CC
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_CC = myPhdiffBtwRRI('rri_cc', 'control.cc');
COHERE_RRI_CC = myMSCohereRRI('rri_cc', 'control.cc');

%% RRI VS CCB
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_CCB = myPhdiffBtwRRI('rri_ccb', 'control.cb');
COHERE_RRI_CCB = myMSCohereRRI('rri_ccb', 'control.cb');

%% RRI VS NSCB1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_NSCB1 = myPhdiffBtwRRI('rri_nscb1', 't1.nscb1');
COHERE_RRI_NSCB1 = myMSCohereRRI('rri_nscb1', 't1.nscb1');

%% RRI VS NSCB2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_NSCB2 = myPhdiffBtwRRI('rri_nscb2', 't2.nscb2');
COHERE_RRI_NSCB2 = myMSCohereRRI('rri_nscb2', 't2.nscb2');

%% RRI VS SC1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_SC1 = myPhdiffBtwRRI('rri_sc1', 't1.sc1');
COHERE_RRI_SC1 = myMSCohereRRI('rri_sc1', 't1.sc1');

%% RRI VS SC2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_SC2 = myPhdiffBtwRRI('rri_sc2', 't2.sc2');
COHERE_RRI_SC2 = myMSCohereRRI('rri_sc2', 't2.sc2');

%% RRI VS SCb1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_SCB1 = myPhdiffBtwRRI('rri_scb1', 't1.scb1');
COHERE_RRI_SCB1 = myMSCohereRRI('rri_scb1', 't1.scb1');

%% RRI VS SCb2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_SCB2 = myPhdiffBtwRRI('rri_scb2', 't2.scb2');
COHERE_RRI_SCB2 = myMSCohereRRI('rri_scb2', 't2.scb2');

%% Clean the workspace except specific variables
clearvars -except MAX_PHDIFF_BTN_RRI_CC COHERE_RRI_CC MAX_PHDIFF_BTN_RRI_CCB...
    COHERE_RRI_CCB MAX_PHDIFF_BTN_RRI_NSCB1 COHERE_RRI_NSCB1 ...
    MAX_PHDIFF_BTN_RRI_NSCB2 COHERE_RRI_NSCB2 ...
    MAX_PHDIFF_BTN_RRI_SC1 COHERE_RRI_SC1...
    MAX_PHDIFF_BTN_RRI_SC2 COHERE_RRI_SC2... 
    MAX_PHDIFF_BTN_RRI_SCB1 COHERE_RRI_SCB1 ...
    MAX_PHDIFF_BTN_RRI_SCB2 COHERE_RRI_SCB2;