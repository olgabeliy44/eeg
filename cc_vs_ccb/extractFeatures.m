function elements = extractFeatures(study, subtask)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the EEG data on local

switch study
    case 'control' 
        if subtask == 'cc'
            load('ctrl_cc_syncEEG.mat');
        else
            load('ctrl_ccb_syncEEG.mat');
        end
    case 't1'
        if subtask == 'sc1'
            load('t1_sc1_syncEEG.mat');
        elseif subtask == 'sb1'
            load('t1_scb1_syncEEG.mat');
        else
            load('t1_nscb1_syncEEG.mat');
        end
    case 't2'
        if subtask == 'sc2'
            load('t2_sc2_syncEEG.mat');
        elseif subtask == 'sb2'
            load('t2_scb2_syncEEG.mat');
        else
            load('t2_nscb2_syncEEG.mat');
        end
    otherwise
        warning('Please input the study')
end

%% Get the data
elements = struct();

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
    elements(e_k).GAMMA = xdft; %meanV(1, 1);
    % Beta
    L = length(DBeta);
    xdft = fft(DBeta);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    elements(e_k).BETA = xdft; %meanV(1, 1);
    % Alpha
    L = length(DAlpha);
    xdft = fft(DAlpha);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    elements(e_k).ALPHA = xdft; % meanV(1, 1);
    % Theta
    L = length(DTheta);
    xdft = fft(DTheta);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    elements(e_k).THETA = xdft; % meanV(1, 1);
    % ADelta
    L = length(ADelta);
    xdft = fft(ADelta);
    xdft = abs(xdft / L);
    xdft = xdft(1: L / 2 + 1);
    xdft(2:end-1) = 2 * xdft(2:end-1);
    meanV = mean(abs(xdft));
    elements(e_k).DELTA = xdft; % meanV(1, 1);
end