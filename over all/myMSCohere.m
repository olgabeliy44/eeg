function cohere = myMSCohere(signalA, signalB)

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
            elements(iTask).COHERE = 0;
            elements(iTask).COHERE_1_2 = 0;
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
        break;
    end

    %%% Main Process
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
        
        idx = find(Cxy >= 0.5);
        filtCxy = Cxy(idx);

        areaAll = trapz(Cxy);
        areaFilter = trapz(filtCxy);
        elements(iTask).COHERE(e_k) = areaAll;
        elements(iTask).COHERE_1_2(e_k) = areaFilter;
        %% Grid
        subplot(channelCnt/4, 4, e_k)
        plot(f,Cxy, '-r');
        hold on
        text(0,0,sprintf('Area: %.3f\n(%.3f)', ...
            areaAll, areaFilter)...
            ,'Color','black','FontSize',7)
        set(gca, 'FontName', 'Times New Roman', 'FontSize', 7)
        title(sprintf('Coherence between Ch(%d) of %s, %s at Task(%s)', e_k,...
            signalA, signalB, arrTasks{iTask}))
        xlabel('Frequency (Hz)')
        ylabel('Magnitude-squared Coherence')
    end
    
    fileName = strcat(sprintf('Coherence between %s, %s at Task(%s)',...
            signalA, signalB, arrTasks{iTask}), '.pdf');
    print(fileName, '-dpdf', '-r2000', '-fillpage');

end

cohere = elements;

