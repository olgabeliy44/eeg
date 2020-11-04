function PhDiff = myPhdiffBtwRRI_RESP(signalA, signalB)

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
        warning('Please input the SingalA')
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

% remove bias
x = x - mean(x);
y = y - mean(y);

% take the FFT
X=fft(x);
Y=fft(y);

% Determine the max value and max point.
[mag_x, idx_x] = max(X);
[mag_y, idx_y] = max(Y);
% determine the phase difference
% at the maximum point.
px = angle(X(idx_x));
py = angle(Y(idx_y));
phase_lag = py - px;
% determine the amplitude scaling
amplitude_ratio = mag_y/mag_x;

elements.PHDIFF = phase_lag;
elements.AMPL_RATIO = amplitude_ratio;

%% Grid
subplot(2, 1, 1)
plot(x, 'b', 'LineWidth', 1)
hold on
subplot(2, 1, 2)
plot(y, 'y', 'LineWidth', 1)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 14)
title(sprintf('%s vs %s', signalA, signalB))
text(0, 0,sprintf('Max phase lag: %.3f\n,Amplitude ratio: %.3f', ...
    phase_lag, amplitude_ratio)...
    ,'Color','red','FontSize',14)

ylabel('Amplitude');

legend('1 signal', '2 signal')

PhDiff = elements;

