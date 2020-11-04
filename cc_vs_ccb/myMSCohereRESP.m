function cohere = myMSCohereRESP(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the RRI data on local
load('RRI_Resp.mat');

switch signalA
    case 'resp_cc' 
        signal_a = Resp_CC';
    case 'resp_ccb' 
        signal_a = Resp_CCB';
    case 'resp_nscb1' 
        signal_a = Resp_NSCB1';
    case 'resp_nscb2' 
        signal_a = Resp_NSCB2';
    case 'resp_sc1' 
        signal_a = Resp_SC1';
    case 'resp_sc2' 
        signal_a = Resp_SC2';
    case 'resp_scb1' 
        signal_a = Resp_SCB1';
    case 'resp_scb2' 
        signal_a = Resp_SCB2';
    otherwise
        warning('Please input the SingalB')
end

switch signalB
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
        warning('Please input the SingalB')
end
signal_b = new_EEG;

elements = struct();

figure
for e_k = 1:channelCnt
    
    x = signal_a;
    y = signal_b(:, e_k);
    
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
    title(sprintf('Channel (%d)of %s, RESP %s', e_k, signalB, signalA))
    xlabel('Frequency (Hz)')
    ylabel('Magnitude-squared Coherence')
end

cohere = elements;

