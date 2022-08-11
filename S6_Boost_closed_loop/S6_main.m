%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BOOST - SYMULACJA UKŁADU W PĘTLI ZAMKNIĘTEJ %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close
%% Wczytywanie danych
cd ../S1_Input_data
run('S1_specification.m')
run('S1_parameters.m')
cd ../S3_Small_signal/S3_output_data
load('S3_tf1.mat')
cd ../../S2_Power_stage/S2_output_data
load('S2_data_real.mat')
cd ../..
cd S5_Genetic_algorithm/S5_output_data
load('S5_data.mat')
cd ../../S6_Boost_closed_loop/S6_models
fprintf("Dane załadowane\n");
%% Wybór nastaw regulatora PI
K_p_0 = x_IAE(1);
K_i_0 = x_IAE(2);
%% Uruchomienie symulacji
fprintf("Uruchamiam symulację...\n");
Boost_closed_data = sim("Boost_model_closed");
cd ../S6_output_data
save('S6_data.mat','Boost_closed_data')
cd ..
clc
%% Eksport danych
fprintf("Dane wyeksportowane\n");