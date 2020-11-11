function [H, P] = myTtest(struct_a, struct_b, type)

arrTasks = {'N1', 'N1-1', 'N3', 'N4', 'N5', 'N6', 'N7'};

if type == 1
    %% Get the data
    H = struct();
    P = struct();

    N = min(size(struct_a, 2), size(struct_b, 2));
    
    for i = 1:N
        % T-test of phase diff
        X = struct_a(i).COHERE_1_2;
        Y = struct_b(i).COHERE_1_2;
        
        [h, p] = ttest(X', Y');
        
        H(i).COHERE = h;
        P(i).COHERE = p;
        disp([arrTasks{i} ': Hypothesis: ' num2str(h) ...
            ', p-value: ' num2str(p) ', Per Subject'])
    end
else
    clearvars X Y N
    %% Get the data
    H = struct();
    P = struct();

    N = min(size(struct_a, 2), size(struct_b, 2));
    
    X(N) = 0;
    Y(N) = 0;
    for i = 1:N
        X(i) = mean(struct_a(i).COHERE_1_2);
        Y(i) = mean(struct_b(i).COHERE_1_2);
    end
    
    
    
    [h, p] = ttest(X', Y');
    H.COHERE = h;
    P.COHERE = p;
    disp([arrTasks{1} ' vs ' arrTasks{2} ': Coherence Hypothesis: ' num2str(h) ...
        ', p-value: ' num2str(p) ', Over all'])
    
end

clearvars h p X Y i N


