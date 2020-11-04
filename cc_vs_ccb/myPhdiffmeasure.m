function PhDiff = myPhdiffmeasure(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the EEG data on local

for i = 1:2
    if i == 1
        signal = signalA;
    else
        signal = signalB;
    end
    switch signal
        case 'control.cc' 
            load('ctrl_cc_syncEEG.mat');
        case 'control.cb' 
            load('ctrl_ccb_syncEEG.mat');
        case 't1.sc1'
            load('t1_sc1_syncEEG.mat');
        case 't1.scb1'
            load('t1_scb1_syncEEG.mat');
        case 't1.nscb1'
            load('t1_nscb1_syncEEG.mat');
        case 't2.sc2'
            load('t2_sc2_syncEEG.mat');
        case 't2.scb2'
            load('t2_scb2_syncEEG.mat');
        case 't2.nscb2'
            load('t2_nscb2_syncEEG.mat');
        otherwise
            warning('Please input the Singal A')
    end
    if i == 1
        signal_a = new_EEG;
    else
        signal_b = new_EEG;
    end
end


elements = struct();

figure
for e_k = 1:channelCnt
    
    x = signal_a(:, e_k);
    y = signal_b(:, e_k);
    
    x = x';
    y = y';
    
    minV = min(length(x), length(y));
    x = x(1:minV);
    y = y(1:minV);
    
    % Length of signal
    npts = length(x);

    % remove bias
    x = x - mean(x);
    y = y - mean(y);

    % take the FFT
    X=fft(x);
    Y=fft(y);
    % Calculate the number of unique points
    NumUniquePts = ceil((npts+1)/2);

    f = (0:NumUniquePts-1)*Fs/npts;
    
    % Determine the max value and max point.
    [mag_x, idx_x] = max(imag(X));
    [mag_y, idx_y] = max(imag(Y));
    % determine the phase difference
    % at the maximum point.
    px = angle(X(idx_x));
    py = angle(Y(idx_y));
    phase_lag = py - px;
    % determine the amplitude scaling
    amplitude_ratio = mag_y/mag_x;

    elements(e_k).PHDIFF = phase_lag;
    elements(e_k).AMPL_RATIO = amplitude_ratio;
    
    %% Grid
    subplot(channelCnt/4, 4, e_k)
%     plot(f,angle(X(1:NumUniquePts)));
     plot(signal_a(:, e_k), 'b', 'LineWidth', 1)
    hold on
     plot(signal_b(:, e_k), 'r', 'LineWidth', 1)
%     plot(f,angle(Y(1:NumUniquePts)));
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 7)
    title(sprintf('Company (%d)of %s , %s', e_k, signalA, signalB))
    text(1,max(y),sprintf('Max phase lag: %.3f\n,Amplitude ratio: %.3f', ...
        phase_lag, amplitude_ratio)...
        ,'Color','black','FontSize',7)
    
    ylabel('Amplitude');
    
    legend('First signal', 'Second signal')
end

PhDiff = elements;

