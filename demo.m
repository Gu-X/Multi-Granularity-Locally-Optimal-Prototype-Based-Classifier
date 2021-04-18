clear all
clc
close all
load exampledata % load data

%% MLOP has two learning modes, "offlinelearning" and "onlinelearning", and a testing mode, 'testing'.
%% "offlinelearning" is to train the classifier from scratch.
%% "onlinelearning" is to update the classifier if new data is available.
%% "onlinelearning" has to be performed after the classifier is initialized by "offlinelearning".
%% "testing" is to determine the class labels of testing data with the trained classifier.


Input1.Lambda=0.05; % lambda
Input1.Labels=LTra1; % first part of training data
Input1.Data=DTra1; % first part of labels
Output1=MLOP(Input1,'offlinelearning');  % learning a classifier

Input2.Labels=LTra2; % second part of training data
Input2.Data=DTra2; % second part of training data
Input2.ParamG=Output1.ParamG; % load the global parmaters (not needed for classification)
Input2.Param=Output1.Param; % load the local parameters
Output2=MLOP(Input2,'onlinelearning'); % updating the classifier


Input3.Param=Output2.Param; % load the local parameters
Input3.Labels=LTes1; % load the ground truth (for calculating the accuracy only)
Input3.Data=DTes1; % load the testing data
Output3=MLOP(Input3,'testing');
Output3.EstLabel % estimated class labels of testing data
Output3.Acc % classification accuracy
Output3.ConfMat % confusion matrix

