function [H, P] = myTtest(struct_a, struct_b)

%% Get the data
H = struct();
P = struct();

% T-test of Gamma element
X = struct_a.GAMMA;
Y = struct_b.GAMMA;
[h, p] = ttest(X', Y');
H.GAMMA = h;
P.GAMMA = p;
disp(['Gamma Hypothesis: ' num2str(h) ',Gamma p-value: ' num2str(p)])
% T-test of Beta element
X = struct_a.BETA;
Y = struct_b.BETA;
[h, p] = ttest(X', Y');
H.BETA = h;
P.BETA = p;
disp(['Beta Hypothesis: ' num2str(h) ',Gamma p-value: ' num2str(p)])

% T-test of Alpha element
X = struct_a.ALPHA;
Y = struct_b.ALPHA;
[h, p] = ttest(X', Y');
H.ALPHA = h;
P.ALPHA = p;
disp(['Alpha Hypothesis: ' num2str(h) ',Gamma p-value: ' num2str(p)])

% T-test of Theta element
X = struct_a.THETA;
Y = struct_b.THETA;
[h, p] = ttest(X', Y');
H.THETA = h;
P.THETA = p;
disp(['Theta Hypothesis: ' num2str(h) ',Gamma p-value: ' num2str(p)])

% T-test of Delta element
X = struct_a.DELTA;
Y = struct_b.DELTA;
[h, p] = ttest(X', Y');
H.DELTA = h;
P.DELTA = p;
disp(['Delta Hypothesis: ' num2str(h) ',Gamma p-value: ' num2str(p)])