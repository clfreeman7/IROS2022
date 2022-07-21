% 
% Script: demo_GaitTest.m
%  
% Dependencies:
%   +demos/data/visualtracking/Gait A_corrected.mat
%   +demos/data/visualtracking/Gait B_corrected.mat
%   +demos/data/visualtracking/Gait B_corrected.mat
%   +demos/data/visualtracking/Gait D_corrected.mat
%   +demos/data/visualtracking/Gait E_corrected.mat
%
%   +offlineanalysis/GaitTest
%
% Description: 
%   Demonstrate how to process the raw experimental data from the visual
%   tracking of gaits.


% [0] == Script setup
clear; clc
% Add dependencies to classpath
addpath('../');

gait_sequences = {[3,7,2]; 
         [16,7,5,11,14];
         [8,9,16]; 
         [4,14];
         [9,16,1]};

n_gaits = length(gait_sequences);

% Configure figure tex interpreters
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultTextInterpreter','latex');

% [1] == Extract and define parameters for GaitTest() objects.

% Define experimental parameters after investigating video. 
frame_start_list = [607, 103, 176, 226, 368];      % for orange robot

% Extract data.
for i = 1:n_gaits
    % Define robot.
    gait_exp_2(i).params.robot_name = 'orange';
    gait_exp_2(i).params.substrate = 'black mat';
    
    % Extract and store first frame information.
    gait_exp_2(i).params.frame_1 = frame_start_list(i);
    
    % Extract and store raw data from each trial.
    filename = ['data/visualtracking/Gait', ' ', num2str(char('A' + i -1)), '_corrected.mat'];
    gait_exp_2(i).raw_data = load(filename).all_pt;  
end


% [2] == Instantiate GaitTest() objects for each experimental trial.
% This analyzes the data from each trial to find motion primitive twist
% information.

% Set up figure for plotting
figure(1)
t = tiledlayout(2, 3);

% Instantiate objects for each gait tested. 
for i = 1:n_gaits
    all_gaits(i) = offlineanalysis.GaitTest(gait_exp_2(i).raw_data, ...
                                                 gait_sequences{i}(1,:), ...
                                                 gait_exp_2(i).params);
    nexttile;
    all_gaits(i).plot;        

end

% Add legend.
lgd = legend('Continuous robot position', 'Actual keyframe positions', ...
                  'Keyframe positions reconstructed from motion primitives','robot orientation');
lgd.Layout.Tile = 'north';
lgd.Orientation = 'horizontal';

% Add colorbar.
a = colorbar;
a.Label.String = 'Number of gaits executed';
a.Layout.Tile = 'east';

title(t, 'Experimental results  of synthesized gaits for orange robot on black mat','FontSize',24)