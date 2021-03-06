%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Node: estimation 
%
% Purpose:  
% The purpose of the estimation node is to compute an estimate of the
% quadcopters state from noisy sensor data. This may include fusing data
% from different sources (e.g., barometer and lidar for altittude),
% filtering noisy signals (e.g., low-pass filters), implementing
% state estimators (e.g., kalman filters) and navigation algorithms.
%
% Input:
%   - ROS topics: several sensor data topics
%           /mavros/imu/data
%
%   - ROS topic: /features (generated by vision)
%   
% Output:
%   - ROS topic: /stateEstimate (used by control, autonomy, vision, planning)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% prepare workspace
clear; close all; clc; format compact;
run('loadParams.m');
fprintf('Estimation Node Launching...\n');

% intialize ros node
rosinit;
estimationNode = robotics.ros.Node('/estimation');
imuDataSubscriber = robotics.ros.Publisher(estimationNode,'imuData','/mavros/imu/data');
stateEstimatePublisher = robotics.ros.Publisher(estimationNode,'stateEstimate','terpcopter/stateEstimate');

% Note: estimation may be implemented in the form of a call-back when each
% new sensor measurement is received

