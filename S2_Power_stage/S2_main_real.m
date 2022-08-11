%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% BOOST - DOBÓR PARAMETRÓW DLA NIEIDELANEGO UKŁADU %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
clc
%% Ładowanie specyfikacji %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd ../S1_Input_data
run('S1_specification.m')
fprintf("Specyfikacja załadowana\n");
%% Ładowanie współczynników obliczeniowych %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run('S1_coefficients.m')
fprintf("Współczynniki załadowane\n");
%% Ładowanie parametrów z kart katalogowych %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run('S1_parameters.m')
fprintf("Parametry załadowane\n");
cd ../S2_Power_stage
%% Wywołanie skryptu do obliczenia parametrów przetwornicy  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd S2_functions
real = S2_calculate_real(V_in...
    ,V_out,delta_V_out,delta_I_L,I_out...
    ,n,f_s,alfa_R,alfa_C,beta_Cout,...
    beta_ESRCout,beta_VCout,gamma_DS,gamma_D,...
    ESR_Cout,R_DS,t_R*1e-9...
    ,t_F*1e-9,DCR,V_f,L,V_out_p);
fprintf("Wstępne obliczenia wykonane\n");
%% Uporządkowanie zmiennych do struktur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
run('S2_structures_real.m')
cd ..
%% Uruchomienie symulacji  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd S2_models
fprintf("Rozpoczynam symulację...\n");
out = sim("S2_Boost_model_real");
clc
fprintf("Symulacja wykonana\n");
cd ..
%% Wywołanie skryptu do sprawdzenia sygnałów z symulacji  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd S2_functions
[real.general.sim,real.L.sim,real.Diode.sim,real.MOSFET.sim,...
    real.Cout.sim] = S2_simulation_real(out,spec.V_in);
fprintf("Wyniki symulacji przetworzone na wartości do porównania z wynikami obliczeń\n");
%% Wywołanie skryptu do wygenerowania raportu  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S2_write_real(spec,real.general,real.L,real.Diode,real.Cout,real.MOSFET);
fprintf("Raport wygenerowany\n");
cd ..