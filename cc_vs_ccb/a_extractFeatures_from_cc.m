clc;
clear;
close all;

%% Load the EEG data on local
load('ctrl_cc_syncEEG.mat');

Fs=125;
channelCnt = 16; % Channel count

skip = 1;

%% Get the training data
CTRL_CC_EEG_Data = struct();

for e_k = 1:channelCnt
    waveletFunction = 'sym8'; % sym8, coif5, db4
    [C,L] = wavedec(new_EEG(e_k, :),5,waveletFunction);
    %%% The Coefficient Vector
    %GAMA (31~51Hz)  %BETA (13~31Hz)  %ALPHA (8~13Hz)  %THETA (4 ~ 8Hz)
    [cDGamma, cDBeta, cDAlpha, cDTheta] = detcoef(C, L, [2, 3, 4, 5]);
    cADelta = appcoef(C,L,waveletFunction, 5);   %DELTA (0 ~ 4)

    %%%%Calculation the Details Vectors
    DGamma = wrcoef('d', C, L, waveletFunction, 2);
    DBeta = wrcoef('d', C, L, waveletFunction, 3);
    DAlpha = wrcoef('d', C, L, waveletFunction, 4);
    DTheta = wrcoef('d', C, L, waveletFunction, 5);
    ADelta = wrcoef('a',C,L,waveletFunction, 5); %DELTA

    % Gamma
    L = length(DGamma);  % Length of DGamma vector
    xdft = fft(DGamma);  % FFT, two sided spectrum xdft
    xdft = abs(xdft / L); % absolute 
    xdft = xdft(1: L / 2 + 1); % single-sided spectrum
    xdft(2:end-1) = 2 * xdft(2:end-1); % In order to conserve the total power, multiply by 2
    meanV = mean(abs(xdft)); % Mean value of xdft
    CTRL_CC_EEG_Data(e_k).GAMMA = xdft; %meanV(1, 1);
    % Beta
    L = length(DBeta);
    xdft = fft(DBeta);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    CTRL_CC_EEG_Data(e_k).BETA = xdft; %meanV(1, 1);
    % Alpha
    L = length(DAlpha);
    xdft = fft(DAlpha);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    CTRL_CC_EEG_Data(e_k).ALPHA = xdft; % meanV(1, 1);
    % Theta
    L = length(DTheta);
    xdft = fft(DTheta);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    CTRL_CC_EEG_Data(e_k).THETA = xdft; % meanV(1, 1);
    % ADelta
    L = length(ADelta);
    xdft = fft(ADelta);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    CTRL_CC_EEG_Data(e_k).DELTA = xdft; % meanV(1, 1);
end

clearvars i j s e
clearvars tmpTSP minTSP maxTSP minID_EEG maxID_EEG minID_GL maxID_GL
clearvars cDGamma cDBeta cDAlpha cDTheta cADelta
clearvars DGamma DBeta DAlpha DTheta ADelta maxV