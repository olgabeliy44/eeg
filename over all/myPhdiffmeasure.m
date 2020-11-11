function PhDiff = myPhdiffmeasure(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the EEG data on local

elements = struct();

arrTasks = {'N1', 'N1-1', 'N3', 'N4', 'N5', 'N6', 'N7'};

for iTask = 1: 7
    %%% Reading the file
    strPath = strcat('EEG/', arrTasks{iTask}, '/');
    
    bNonExistFile = 0;
    for i = 1:2
        if i == 1
            signal = signalA;
        else
            signal = signalB;
        end
        switch signal
            case 'control.cc' 
                strFilePath = strcat(strPath, 'Control/CC/', 'syncEEG.mat');
            case 'control.cb'
                strFilePath = strcat(strPath, 'Control/CCB/', 'syncEEG.mat');
            case 't1.sc1'
                strFilePath = strcat(strPath, 's1/SC1/', 'syncEEG.mat');
            case 't1.scb1'
                strFilePath = strcat(strPath, 's1/SCB1/', 'syncEEG.mat');
            case 't1.nscb1'
                strFilePath = strcat(strPath, 's1/NSCB1/', 'syncEEG.mat');
            case 't2.sc2'
                strFilePath = strcat(strPath, 's2/SC2/', 'syncEEG.mat');
            case 't2.scb2'
                strFilePath = strcat(strPath, 's2/SCB2/', 'syncEEG.mat');
            case 't2.nscb2'
                strFilePath = strcat(strPath, 's2/NSCB2/', 'syncEEG.mat');
            otherwise
                warning('Please input two singals')
        end
        
        try
            load(strFilePath);
        catch ME
            elements(iTask).PHDIFF = 0;
            elements(iTask).AMPL_RATIO = 0;
            warning(strcat('Unable to read the EEG file', strFilePath));
            bNonExistFile = 1;
            break;
        end
        
        if i == 1
            signal_a = new_EEG;
        else
            signal_b = new_EEG;
        end
    end
    
    %%% In that care no exist
    if bNonExistFile == 1
        continue;
    end
    
    %%% Main process
    figure
    for e_k = 1:channelCnt
    
        x = signal_a(:, e_k);
        y = signal_b(:, e_k);

        x = x';
        y = y';

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

        elements(iTask).PHDIFF(e_k) = phase_lag;
        elements(iTask).AMPL_RATIO(e_k) = amplitude_ratio;

        %% Grid
        subplot(channelCnt/4, 4, e_k)
        plot(x, 'b', 'LineWidth', 1)
        hold on
        plot(y, 'y', 'LineWidth', 1)
        hold on
        text(0,0,sprintf('Max phase lag: %.3f\n Amplitude ratio: %.3f', ...
            phase_lag, amplitude_ratio)...
            ,'Color','red','FontSize',7)
        set(gca, 'FontName', 'Times New Roman', 'FontSize', 7)
        title(sprintf('Channel(%d)of %s, %s at task(%s)', e_k,...
            signalA, signalB, arrTasks{iTask}))
        ylabel('Amplitude');
        legend('2 signal', '1 signal')
    end
    
%     fileName = strcat(sprintf('%s, %s at task(%s)', ...
%             signalA, signalB, arrTasks{iTask}), '.pdf');
%     print(fileName, '-dpdf', '-r2000', '-fillpage');
end


        
PhDiff = elements;

