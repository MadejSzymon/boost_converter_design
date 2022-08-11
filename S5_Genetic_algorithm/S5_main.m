%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WYZNACZENIE PARAMETRÓW REGULATORA PI - ALGORYTM GENETYCZNY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close
%% Zakres
stability_boundary_range = [1 175];
PM_low_range = [1 175];
PM_high_range = [1 175];
GM_low_range = [2325 2523];
GM_high_range = [2322 2525];

upper_bound = 3.198;
lower_bound = 0;
left_bound = 0;
right_bound = 0.0008132;
%% Wczytywanie parametrów
cd ../S1_Input_data
run('S1_parameters.m')
%% Wczytanie danych
cd ../S4_D_decomposition/S4_output_data
load('S4_data.mat')
cd ../../S3_Small_signal/S3_output_data
load('S3_tf1.mat')
cd ../../S5_Genetic_algorithm/S5_functions
%% Aproksymacja krzywych ogrniczających płąszczyznę d-rozbicia
run('S5_genetic_prep.m')
%% Algorytm genetyczny %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run('S5_genetic.m')
%% Analiza wyników 
run('S5_margin_step')
%% Zapis parametrów regulatora
cd ..
cd S5_output_data
save('S5_data.mat','x_ISTAE','x_ITAE','x_IAE')