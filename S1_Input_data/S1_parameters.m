%% Parametry elementów przetwornicy odczytane z kart katalogowych  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cewka
L = 700 * 1e-6;                                                             %Indukcyjność cewki [H]
DCR = 0.06;                                                                 %Rezystancja cewki [Ohm]
I_Lav = 4;                                                                  %Średni prąd cewki [A]
I_Lmax = 4;                                                                 %Maksymalny prąd cewki [A]
%Dioda
V_f = 0.7;                                                                  %Napięcie przewodzenia [V]
I_Dav = 45;                                                                 %Średni prąd diody [A]
I_C = 600;                                                                  %Maksymalny prąd diody [A]
V_R = 1700;                                                                 %Maksymalne napięcie wsteczne [V]
%Kondensator wyjściowy
C_out = 100 * 1e-6;                                                         %Pojemność kondensatora [F]
ESR_Cout = 0.035;                                                           %Rezystancja kondensatora [Ohm]
V_Cout = 100;                                                               %Napięcie polaryzacji [V]
%MOSFET
R_DS = 0.027;                                                               %Rezystancja dren - źródło [Ohm]
t_R = 13.6 * 1e-9;                                                          %Czas włączenia [s]
t_F = 14.2 * 1e-9;                                                          %Czas wyłączenia [s]
V_DS = 650;                                                                 %Napięcie dren źródło [V]
I_D = 39;                                                                   %Prąd drenu [A]
V_GS = 10;                                                                  %Napięcie bramka - źródło [V]
V_th = 3.1;                                                                 %Napięcie progowe bramka - źródło [V]
C_iss = 1035 * 1e-12;                                                       %Pojemność wejściowa [F]
C_oss = 240  * 1e-12;                                                       %Pojemność wyjściowa [F]
C_rss = 25   * 1e-12;                                                       %Pojemność przejściowa sprzeżenia zwrotnego [F]
R_G = 3;                                                                    %Rezystancja bramki [Ohm]
%% Stała czasowa A2D i PWM
T_PWM = 1/20000;
T_A2D = 1/20000;
T = T_PWM + T_A2D;
%% Parametry A2D
bits = 12;                                                                  %Liczba bitów przetwornika
sat_v = 120;                                                                %Wartość nasycenia przetwornika A/C
f_s =  20000;                                                               %Częstotliwość próbkowania [Hz]	
gmis_v = 1.0;                                                               %Wzmocnienie [-]
ofs_v = 0.0;                                                                %offset [V]
nlsb_v = 2;                                                                 %Szum [LSB]
t_f = 1/200000000000;                                                       %Stała czasowa filtra [s]