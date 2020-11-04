function cohere = myMSCohereBtwRRI_RESP(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the RRI data on local
load('RRI_Resp.mat');

switch signalA
    case 'rri_cc' 
        signal_a = RRI_CC';
    case 'rri_ccb' 
        signal_a = RRI_CCB';
    case 'rri_nscb1' 
        signal_a = RRI_NSCB1';
    case 'rri_nscb2' 
        signal_a = RRI_NSCB2';
    case 'rri_sc1' 
        signal_a = RRI_SC1';
    case 'rri_sc2' 
        signal_a = RRI_SC2';
    case 'rri_scb1' 
        signal_a = RRI_SCB1';
    case 'rri_scb2' 
        signal_a = RRI_SCB2';
    otherwise
        warning('Please input the SingalB')
end

switch signalB
    case 'resp_cc' 
        signal_b = Resp_CC';
    case 'resp_ccb' 
        signal_b = Resp_CCB';
    case 'resp_nscb1' 
        signal_b = Resp_NSCB1';
    case 'resp_nscb2' 
        signal_b = Resp_NSCB2';
    case 'resp_sc1' 
        signal_b = Resp_SC1';
    case 'resp_sc2' 
        signal_b = Resp_SC2';
    case 'resp_scb1' 
        signal_b = Resp_SCB1';
    case 'resp_scb2' 
        signal_b = Resp_SCB2';
    otherwise
        warning('Please input the SingalB')
end

elements = struct();

figure

x = signal_a;
y = signal_b;

minV = min(length(x), length(y));
x = x(1:minV);
y = y(1:minV);

[Cxy,f] = mscohere(x,y,[],50,[],Fs);

elements.COHERE = Cxy;
%% Grid
plot(f,Cxy, '-r');
hold on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
title(sprintf('%s vs %s', signalA, signalB))
xlabel('Frequency (Hz)')
ylabel('Magnitude-squared Coherence')

cohere = elements;

