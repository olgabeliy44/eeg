function cohere = myMSCohere(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the EEG data on local

elements = struct();

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

figure
for e_k = 1:channelCnt
    
    x = signal_a(:, e_k);
    y = signal_b(:, e_k);
    
    x = x';
    y = y';
    
    minV = min(length(x), length(y));
    x = x(1:minV);
    y = y(1:minV);
    
    [Cxy,f] = mscohere(x,y,[],50,[],Fs);
    
    elements(e_k).COHERE = Cxy;
    %% Grid
    subplot(channelCnt/4, 4, e_k)
    plot(f,Cxy, '-r');
    hold on
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 7)
    title(sprintf('Channel (%d)of %s , %s', e_k, signalA, signalB))
    xlabel('Frequency (Hz)')
    ylabel('Magnitude-squared Coherence')
end

cohere = elements;

