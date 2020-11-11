%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%  T-Test for Single Task  %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% CC_CCB VS CC_SC1
disp('-CC_CCB VS CC_SC1-')
[TTEST_CC_CCB_VS_CC_SC1_H, TTEST_CC_CCB_VS_CC_SC1_P] =...
    myTtest(COHERE_CC_CCB, COHERE_CC_SC1, 1);

%% CC_CCB VS CC_SC2
disp('-CC_CCB VS CC_SC2-')
[TTEST_CC_CCB_VS_CC_SC2_H, TTEST_CC_CCB_VS_CC_SC2_P] =...
    myTtest(COHERE_CC_CCB, COHERE_CC_SC2, 1);

%% CCB_NSCB1 VS CCB_NSC2
disp('-CCB_NSCB1 VS CCB_NSC2-')
[TTEST_CCB_NSCB1_VS_CCB_NSC2_H, TTEST_CCB_NSCB1_VS_CCB_NSC2_P] =...
    myTtest(COHERE_CCB_NSCB1, COHERE_CCB_NSCB2, 1);

%% SC1_NSCB1 VS SC2_NSCB2
disp('-SC1_NSCB1 VS SC2_NSCB2-')
[TTEST_SC1_NSCB1_VS_SC2_NSC2_H, TTEST_SC1_NSCB1_VS_SC2_NSCB2_P] =...
    myTtest(COHERE_SC1_NSCB1, COHERE_SC2_NSCB2, 1);

%% SC1_SCB1 VS SC2_SCB2
disp('-SC1_SCB1 VS SC2_SCB2-')
[TTEST_SC1_SCB1_VS_SC2_SC2_H, TTEST_SC1_SCB1_VS_SC2_SCB2_P] =...
    myTtest(COHERE_SC1_SCB1, COHERE_SC2_SCB2, 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%  T-Test for Over all  %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CC_CCB VS CC_SC1
disp('-CC_CCB VS CC_SC1-')
[TTEST_CC_CCB_VS_CC_SC1_G_H, TTEST_CC_CCB_VS_CC_SC1_G_P] =...
    myTtest(COHERE_CC_CCB, COHERE_CC_SC1, 2);

%% CC_CCB VS CC_SC2
disp('-CC_CCB VS CC_SC2-')
[TTEST_CC_CCB_VS_CC_SC2_G_H, TTEST_CC_CCB_VS_CC_SC2_G_P] =...
    myTtest(COHERE_CC_CCB, COHERE_CC_SC2, 2);

%% CCB_NSCB1 VS CCB_NSC2
disp('-CCB_NSCB1 VS CCB_NSC2-')
[TTEST_CCB_NSCB1_VS_CCB_NSC2_G_H, TTEST_CCB_NSCB1_VS_CCB_NSC2_G_P] =...
    myTtest(COHERE_CCB_NSCB1, COHERE_CCB_NSCB2, 2);

%% SC1_NSCB1 VS SC2_NSCB2
disp('-SC1_NSCB1 VS SC2_NSCB2-')
[TTEST_SC1_NSCB1_VS_SC2_NSC2_G_H, TTEST_SC1_NSCB1_VS_SC2_NSCB2_G_P] =...
    myTtest(COHERE_SC1_NSCB1, COHERE_SC2_NSCB2, 2);

%% SC1_SCB1 VS SC2_SCB2
disp('-SC1_SCB1 VS SC2_SCB2-')
[TTEST_SC1_SCB1_VS_SC2_SC2_G_H, TTEST_SC1_SCB1_VS_SC2_SCB2_G_P] =...
    myTtest(COHERE_SC1_SCB1, COHERE_SC2_SCB2, 2);
