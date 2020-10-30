function PhDiff = myPhdiffmeasure(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the EEG data on local

switch signalA
    case 'control.cc' 
        load('ctrl_cc_syncEEG.mat');
        signal_a = new_EEG;
    case 't1'
        
    case 't2'
        
    otherwise
        warning('Please input the Singal A')
end

switch signalB
    case 'control.cb' 
        load('ctrl_ccb_syncEEG.mat');
        signal_b = new_EEG;
    case 't1'
        
    case 't2'
        
    otherwise
        warning('Please input the Singal B')
end

elements = struct();

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
    title(sprintf('Channel (%d)', e_k))
    legend('First signal', 'Second signal')
end

