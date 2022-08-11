%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BOOST - DOBÓR PARAMETRÓW IDEALNEGO UKŁADU %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
clc
%% Ładowanie specyfikacji %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../S1_Input_data
run('S1_specification.m')
fprintf("Specyfikacja załadowana\n");
%% Ładowanie współczynników obliczeniowych %%%%%%%%%%%%%%%%%
run('S1_coefficients.m')
fprintf("Współczynniki załadowane\n");
cd ../S2_Power_stage
%% Wywołanie skryptu do obliczenia parametrów przetwornicy  
cd S2_functions
ideal = S2_calculate_ideal(V_in...
    ,V_out,delta_V_out,delta_I_L,I_out...
    ,n,f_s,alfa_R,alfa_C,...
    beta_ESRCout,beta_VCout,gamma_DS,gamma_D);
fprintf("Wstępne obliczenia wykonane\n");
%% Uporządkowanie zmiennych do struktur %%%%%%%%%%%%%%%%%%%%
run('S2_structures_ideal.m')
cd ..
%% Uruchomienie symulacji  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd S2_models
fprintf("Rozpoczynam symulację...\n");
out = sim("S2_Boost_model_ideal");
clc
fprintf("Symulacja wykonana\n");
cd ../S2_functions
%% Wywołanie skryptu do sprawdzenia sygnałów z symulacji  %%
[ideal.general.sim,ideal.L.sim,ideal.Diode.sim,ideal.MOSFET.sim,...
    ideal.Cout.sim] = S2_simulation_ideal(out);
fprintf("Wyniki symulacji przetworzone na wartości do porównania z wynikami obliczeń\n");
%% Wywołanie skryptu do wygenerowania raportu  %%%%%%%%%%%%%
S2_write_ideal(spec,ideal.general,ideal.L,ideal.Diode,ideal.Cout,ideal.MOSFET);
fprintf("Raport wygenerowany\n");
cd ..