clc;
clear;
close all;

%% RRI VS RESP, CC
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_CC = myPhdiffBtwRRI_RESP('rri_cc', 'resp_cc');
COHERE_RRI_RESP_CC = myMSCohereBtwRRI_RESP('rri_cc', 'resp_cc');

%% RRI VS RESP, CCB
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_CCB = myPhdiffBtwRRI_RESP('rri_ccb', 'resp_ccb');
COHERE_RRI_RESP_CCB = myMSCohereBtwRRI_RESP('rri_ccb', 'resp_ccb');

%% RRI VS RESP, NSCB1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_NSCB1 = myPhdiffBtwRRI_RESP('rri_nscb1', 'resp_nscb1');
COHERE_RRI_RESP_NSCB1 = myMSCohereBtwRRI_RESP('rri_nscb1', 'resp_nscb1');

%% RRI VS RESP, NSCB2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_NSCB2 = myPhdiffBtwRRI_RESP('rri_nscb2', 'resp_nscb2');
COHERE_RRI_RESP_NSCB2 = myMSCohereBtwRRI_RESP('rri_nscb2', 'resp_nscb2');

%% RRI VS RESP, SC1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_SC1 = myPhdiffBtwRRI_RESP('rri_sc1', 'resp_sc1');
COHERE_RRI_RESP_SC1 = myMSCohereBtwRRI_RESP('rri_sc1', 'resp_sc1');

%% RRI VS RESP, SC2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_SC2 = myPhdiffBtwRRI_RESP('rri_sc2', 'resp_sc2');
COHERE_RRI_RESP_SC2 = myMSCohereBtwRRI_RESP('rri_sc2', 'resp_sc2');

%% RRI VS RESP, SCb1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_SCB1 = myPhdiffBtwRRI_RESP('rri_scb1', 'resp_scb1');
COHERE_RRI_RESP_SCB1 = myMSCohereBtwRRI_RESP('rri_scb1', 'resp_scb1');

%% RRI VS RESP, SCb2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RRI_RESP_SCB2 = myPhdiffBtwRRI_RESP('rri_scb2', 'resp_scb2');
COHERE_RRI_RESP_SCB2 = myMSCohereBtwRRI_RESP('rri_scb2', 'resp_scb2');

%% Clean the workspace except specific variables
clearvars -except MAX_PHDIFF_BTN_RRI_RESP_CC COHERE_RRI_RESP_CC MAX_PHDIFF_BTN_RRI_RESP_CCB...
    COHERE_RRI_RESP_CCB MAX_PHDIFF_BTN_RRI_RESP_NSCB1 COHERE_RRI_RESP_NSCB1 ...
    MAX_PHDIFF_BTN_RRI_RESP_NSCB2 COHERE_RRI_RESP_NSCB2 ...
    MAX_PHDIFF_BTN_RRI_RESP_SC1 COHERE_RRI_RESP_SC1...
    MAX_PHDIFF_BTN_RRI_RESP_SC2 COHERE_RRI_RESP_SC2... 
    MAX_PHDIFF_BTN_RRI_RESP_SCB1 COHERE_RRI_RESP_SCB1 ...
    MAX_PHDIFF_BTN_RRI_RESP_SCB2 COHERE_RRI_RESP_SCB2;