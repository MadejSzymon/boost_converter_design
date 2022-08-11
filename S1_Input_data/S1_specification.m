%% Specyfikacja przetwornicy %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_in = 30;                                                                  %Napięcie wejściowe [V]
V_out_p = 40;                                                               %Napięcie wyjściowe [V]
V_out = 45;                                                                 %Napięcie wyjściowe [V]
delta_V_out = 1;                                                            %Maksymalne oscylacje napięcia wyjściowego [%]
delta_I_L = 25;                                                             %Maksymalne oscylacje prądu cewki [%]
I_out = 2;                                                                  %Prąd wyjściowy [A]               
n = 90;                                                                     %Minimalna sprawność [%]    
f_s = 20*1e3;                                                               %Częstotliwość kluczowania [Hz]

sim_time = 40e-3;
sim_small_time = 2*sim_time;
D_add_time = sim_time;

PM_low = 80;
PM_high = 90;
GM_low = 10;
GM_high = 25;