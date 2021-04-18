clear all
clc
close all
load exampledata
Input1.Lambda=0.05;
Input1.Labels=LTra1;
Input1.Data=DTra1;
Output1=MLOP(Input1,'offlinelearning');

Input2.Labels=LTra2;
Input2.Data=DTra2;
Input2.ParamG=Output1.ParamG;
Input2.Param=Output1.Param;
Output2=MLOP(Input2,'onlinelearning');


Input3.Param=Output2.Param;
Input3.Labels=LTes1;
Input3.Data=DTes1;
Output3=MLOP(Input3,'testing');
Output3.Acc
