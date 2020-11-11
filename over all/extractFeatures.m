function Features = extractFeatures(study, subtask)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Get the data
elements = struct();

arrTasks = {'N1', 'N1-1', 'N3', 'N4', 'N5', 'N6', 'N7'};
%% Load the EEG data on local

for iTask = 1: 7
    
    %%% Reading the file
    strPath = strcat('EEG/', arrTasks{iTask}, '/');
    bNonExistFile = 0;
    switch study
        case 'control' 
            if subtask == 'cc'
                strFilePath = strcat(strPath, 'Control/CC/', 'syncEEG.mat');
            else
                strFilePath = strcat(strPath, 'Control/CCB/', 'syncEEG.mat');
            end
        case 't1'
            if subtask == 'sc1'
                strFilePath = strcat(strPath, 's1/SC1/', 'syncEEG.mat');
            elseif subtask == 'sb1'
                strFilePath = strcat(strPath, 's1/SCB1/', 'syncEEG.mat');
            else
                strFilePath = strcat(strPath, 's1/NSCB1/', 'syncEEG.mat');
            end
        case 't2'
            if subtask == 'sc2'
                strFilePath = strcat(strPath, 's2/SC2/', 'syncEEG.mat');
            elseif subtask == 'sb2'
                strFilePath = strcat(strPath, 's2/SCB2/', 'syncEEG.mat');
            else
                strFilePath = strcat(strPath, 's2/NSCB2/', 'syncEEG.mat');
            end
        otherwise
            warning('Please input the study')
    end

    try
        load(strFilePath);
    catch ME
        elements(iTask).COHERE(1:channelCnt) = 0;
        elements(iTask).COHERE_1_2(1:channelCnt) = 0;
        warning(strcat('Unable to read the EEG file', strFilePath));
        bNonExistFile = 1;
        break;
    end
    
    if bNonExistFile == 1
        break;
    end
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
        elements(iTask).GAMMA(e_k) = meanV(1, 1);
        % Beta
        L = length(DBeta);
        xdft = fft(DBeta);
        xdft = abs(xdft / L);
        xdft = xdft(1: L / 2 + 1);
        xdft(2:end-1) = 2 * xdft(2:end-1);
        meanV = mean(abs(xdft));
        elements(iTask).BETA(e_k) = meanV(1, 1);
        % Alpha
        L = length(DAlpha);
        xdft = fft(DAlpha);
        xdft = abs(xdft / L);
        xdft = xdft(1: L / 2 + 1);
        xdft(2:end-1) = 2 * xdft(2:end-1);
        meanV = mean(abs(xdft));
        elements(iTask).ALPHA(e_k) = meanV(1, 1);
        % Theta
        L = length(DTheta);
        xdft = fft(DTheta);
        xdft = abs(xdft / L);
        xdft = xdft(1: L / 2 + 1);
        xdft(2:end-1) = 2 * xdft(2:end-1);
        meanV = mean(abs(xdft));
        elements(iTask).THETA(e_k) = meanV(1, 1);
        % ADelta
        L = length(ADelta);
        xdft = fft(ADelta);
        xdft = abs(xdft / L);
        xdft = xdft(1: L / 2 + 1);
        xdft(2:end-1) = 2 * xdft(2:end-1);
        meanV = mean(abs(xdft));
        elements(iTask).DELTA(e_k) = meanV(1, 1);
    end
end

Features = elements;