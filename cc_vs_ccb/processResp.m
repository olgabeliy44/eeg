clc;
clear;
close all;

%% RESP VS CC
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_CC = myPhdiffBtwRESP('resp_cc', 'control.cc');
COHERE_RESP_CC = myMSCohereRESP('resp_cc', 'control.cc');

%% RESP VS CCB
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_CCB = myPhdiffBtwRESP('resp_ccb', 'control.cb');
COHERE_RESP_CCB = myMSCohereRESP('resp_ccb', 'control.cb');

%% RESP VS NSCB1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_NSCB1 = myPhdiffBtwRESP('resp_nscb1', 't1.nscb1');
COHERE_RESP_NSCB1 = myMSCohereRESP('resp_nscb1', 't1.nscb1');

%% RESP VS NSCB2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_NSCB2 = myPhdiffBtwRESP('resp_nscb2', 't2.nscb2');
COHERE_RESP_NSCB2 = myMSCohereRESP('resp_nscb2', 't2.nscb2');

%% RESP VS SC1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_SC1 = myPhdiffBtwRESP('resp_sc1', 't1.sc1');
COHERE_RESP_SC1 = myMSCohereRESP('resp_sc1', 't1.sc1');

%% RESP VS SC2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_SC2 = myPhdiffBtwRESP('resp_sc2', 't2.sc2');
COHERE_RESP_SC2 = myMSCohereRESP('resp_sc2', 't2.sc2');

%% RESP VS SCb1
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_SCB1 = myPhdiffBtwRESP('resp_scb1', 't1.scb1');
COHERE_RESP_SCB1 = myMSCohereRESP('resp_scb1', 't1.scb1');

%% RESP VS SCb2
% Calculating the phase diff between two signals
MAX_PHDIFF_BTN_RESP_SCB2 = myPhdiffBtwRESP('resp_scb2', 't2.scb2');
COHERE_RESP_SCB2 = myMSCohereRESP('resp_scb2', 't2.scb2');

%% Clean the workspace except specific variables
clearvars -except MAX_PHDIFF_BTN_RESP_CC COHERE_RESP_CC MAX_PHDIFF_BTN_RESP_CCB...
    COHERE_RESP_CCB MAX_PHDIFF_BTN_RESP_NSCB1 COHERE_RESP_NSCB1 ...
    MAX_PHDIFF_BTN_RESP_NSCB2 COHERE_RESP_NSCB2 ...
    MAX_PHDIFF_BTN_RESP_SC1 COHERE_RESP_SC1...
    MAX_PHDIFF_BTN_RESP_SC2 COHERE_RESP_SC2... 
    MAX_PHDIFF_BTN_RESP_SCB1 COHERE_RESP_SCB1 ...
    MAX_PHDIFF_BTN_RESP_SCB2 COHERE_RESP_SCB2;