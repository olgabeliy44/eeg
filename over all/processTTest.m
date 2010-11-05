%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%  T-Test for Single Task  %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;

%% CC_CCB VS CC_SC1
disp('-CC_CCB VS CC_SC1-')
[TTEST_CC_CCB_VS_CC_SC1_H, TTEST_CC_CCB_VS_CC_SC1_P] =...
    myTtest(MAX_PHDIFF_BTN_CC_CCB, MAX_PHDIFF_BTN_CC_SC1, 1);

%% CC_CCB VS CC_SC2
disp('-CC_CCB VS CC_SC2-')
[TTEST_CC_CCB_VS_CC_SC2_H, TTEST_CC_CCB_VS_CC_SC2_P] =...
    myTtest(MAX_PHDIFF_BTN_CC_CCB, MAX_PHDIFF_BTN_CC_SC2, 1);

%% CCB_NSCB1 VS CCB_NSC2
disp('-CCB_NSCB1 VS CCB_NSC2-')
[TTEST_CCB_NSCB1_VS_CCB_NSC2_H, TTEST_CCB_NSCB1_VS_CCB_NSC2_P] =...
    myTtest(MAX_PHDIFF_BTN_CCB_NSCB1, MAX_PHDIFF_BTN_CCB_NSCB2, 1);

%% CCB_SCB1 VS CCB_SC2
disp('-CCB_SCB1 VS CCB_SC2-')
[TTEST_CCB_SCB1_VS_CCB_SC2_H, TTEST_CCB_SCB1_VS_CCB_SC2_P] =...
    myTtest(MAX_PHDIFF_BTN_CCB_SCB1, MAX_PHDIFF_BTN_CCB_SCB2, 1);

%% SC1_NSCB1 VS SC2_NSCB2
disp('-SC1_NSCB1 VS SC2_NSCB2-')
[TTEST_SC1_NSCB1_VS_SC2_NSC2_H, TTEST_SC1_NSCB1_VS_SC2_NSCB2_P] =...
    myTtest(MAX_PHDIFF_BTN_SC1_NSCB1, MAX_PHDIFF_BTN_SC2_NSCB2, 1);

%% SC1_SCB1 VS SC2_SCB2
disp('-SC1_SCB1 VS SC2_SCB2-')
[TTEST_SC1_SCB1_VS_SC2_SC2_H, TTEST_SC1_SCB1_VS_SC2_SCB2_P] =...
    myTtest(MAX_PHDIFF_BTN_SC1_SCB1, MAX_PHDIFF_BTN_SC2_SCB2, 1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%  T-Test for Over all  %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% CC_CCB
disp('-CC_CCB-')
[TTEST_CC_CCB_H, TTEST_CC_CCB_P] =...
    myTtest(MAX_PHDIFF_BTN_CC_CCB, MAX_PHDIFF_BTN_CC_CCB, 2);

%% CC_SC1
disp('-CC_SC1-')
[TTEST_CC_SC1_H, TTEST_CC_SC1_P] =...
    myTtest(MAX_PHDIFF_BTN_CC_SC1, MAX_PHDIFF_BTN_CC_SC1, 2);

%% CC_SC2
disp('-CC_SC2-')
[TTEST_CC_SC2_H, TTEST_CC_SC2_P] =...
    myTtest(MAX_PHDIFF_BTN_CC_SC2, MAX_PHDIFF_BTN_CC_SC2, 2);
