function [H, P] = myTtest(struct_a, struct_b, type)

arrTasks = {'N1', 'N1-1', 'N3', 'N4', 'N5', 'N6', 'N7'};

if type == 1
    %% Get the data
    H = struct();
    P = struct();

    N = min(size(struct_a, 2), size(struct_b, 2));
    
    for i = 1:N
        % T-test of phase diff
        X = struct_a(i).PHDIFF;
        Y = struct_b(i).PHDIFF;
        
        [h, p] = ttest(X', Y');
        
        H(i).PHDIFF = h;
        P(i).PHDIFF = p;
        disp([arrTasks{i} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
    end
else
    %% Get the data
    H = struct();
    P = struct();

    N = min(size(struct_a, 2), size(struct_b, 2));
    
    if N > 6
        % T-test of phase diff (N1, N1-1)
        X = struct_a(1).PHDIFF;
        Y = struct_a(2).PHDIFF;
        
        if size(X, 2) == 1 || size(Y, 2) == 1
            return;
        end
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{1} ' vs ' arrTasks{2} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
        
        % T-test of phase diff (N1, N3)
        X = struct_a(1).PHDIFF;
        Y = struct_a(3).PHDIFF;
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{1} 'vs' arrTasks{3} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
        
        % T-test of phase diff (N1, N4)
        X = struct_a(1).PHDIFF;
        Y = struct_a(4).PHDIFF;
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{1} 'vs' arrTasks{4} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
        
        % T-test of phase diff (N1, N5)
        X = struct_a(1).PHDIFF;
        Y = struct_a(5).PHDIFF;
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{1} 'vs' arrTasks{5} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
        
        % T-test of phase diff (N1, N6)
        X = struct_a(1).PHDIFF;
        Y = struct_a(6).PHDIFF;
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{1} 'vs' arrTasks{6} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
        
        % T-test of phase diff (N1, N7)
        X = struct_a(1).PHDIFF;
        Y = struct_a(7).PHDIFF;
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{1} 'vs' arrTasks{7} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
        
        % T-test of phase diff (N6, N7)
        X = struct_a(6).PHDIFF;
        Y = struct_a(7).PHDIFF;
        [h, p] = ttest(X', Y');
        H.PHDIFF = h;
        P.PHDIFF = p;
        disp([arrTasks{6} 'vs' arrTasks{7} ': Phase Diff Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p)])
    end
end

clearvars h p X Y i N


