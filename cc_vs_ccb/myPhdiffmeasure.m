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
    
    x = signal_a(e_k, :);
    y = signal_b(e_k, :);
    % represent the signals as column-vectors
%     x = x(:);
%     y = y(:);

    % remove the DC component of the signals
    x = x - mean(x);
    y = y - mean(y);

    % signals length calculation
    xlen = length(x);
    ylen = length(y);

    % windows generation
    xwin = hanning(xlen, 'periodic');
    ywin = hanning(ylen, 'periodic');

    % perform fft on the signals
    X = fft(x.*xwin); 
    Y = fft(y.*ywin);

    % fundamental frequency detection
    [~, indx] = max(abs(X));
    [~, indy] = max(abs(Y));

    % phase difference estimation
    PhDiff = angle(Y(indy)) - angle(X(indx)); 
    
    elements(e_k).PHDIFF = PhDiff;
    
    %% Grid
    subplot(channelCnt/4, 4, e_k)
    plot(signal_a(e_k, :), 'b', 'LineWidth', 1.5)
    grid on
    hold on
    plot(signal_b(e_k, :), 'r', 'LineWidth', 1.5)
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 7)
    title(sprintf('Channel (%d)of %s , %s', e_k, signalA, signalB))
    legend('First signal', 'Second signal')
end

