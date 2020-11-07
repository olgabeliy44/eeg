function cohere = myMSCohereBtwRRI_RESP(signalA, signalB)

Fs=125;          % Sampling Frequency
channelCnt = 16; % Channel count

%% Load the EEG data on local

elements = struct();

arrTasks = {'N1', 'N1_1', 'N3', 'N4', 'N5', 'N6', 'N7'};

for iTask = 1: 7
    %%% Reading the file
    strPath = strcat('Individual_RRI_resp/', arrTasks{iTask}, '_RRI_Resp');
    strFilePath = strcat(strPath, '.mat');
    
    try
        load(strFilePath);
    catch ME
        elements(iTask).PHDIFF = 0;
        elements(iTask).AMPL_RATIO = 0;
        warning(strcat('Unable to read the RRI_RESP file, ', strFilePath));
        continue;
    end
    
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
    
    %%% Main process
    figure
    x = signal_a;
    y = signal_b;

    minV = min(length(x), length(y));
    x = x(1:minV);
    y = y(1:minV);

    [Cxy,f] = mscohere(x,y,[],50,[],Fs);
        
    idx = find(Cxy >= 0.5);
    filtCxy = Cxy(idx);

    areaAll = trapz(Cxy);
    areaFilter = trapz(filtCxy);
    elements(iTask).COHERE = areaAll;
    elements(iTask).COHERE_1_2 = areaFilter;
    %% Grid
    plot(f,Cxy, '-r');
    hold on
    text(0,0.2,sprintf('Area: %.3f\n Effective Area: (%.3f)', ...
        areaAll, areaFilter)...
        ,'Color','blue','FontSize',10)
    set(gca, 'FontName', 'Times New Roman', 'FontSize', 7)
    title(sprintf('Coherence between %s and %s at Task(%s)', ...
        signalA, signalB, arrTasks{iTask}))
    xlabel('Frequency (Hz)')
    ylabel('Magnitude-squared Coherence')
end

cohere = elements;


