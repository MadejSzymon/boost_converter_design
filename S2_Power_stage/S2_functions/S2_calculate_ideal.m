function output = S2_calculate_ideal(V_in,V_out,delta_V_out,delta_I_L,I_out,n,f_s...
    ,alfa_R,alfa_C,beta_ESRCout,beta_VCout,gamma_DS,...
    gamma_D)
%% Obliczenia podstawowych parametrów elementów przetwornicy %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D = 1 - V_in/(V_out);                                                      %Współczynnik wypełnienia dla idealnych warunków [-]
I_in = I_out/(1-D);                                                        %Prąd wejściowy [A]
delta_I_L = delta_I_L*I_in/100;                                            %Oscylacje prądu cewki [A]
delta_V_out = delta_V_out*V_out/100;                                       %Oscylacje napięcia wyjściowego [V]
R_out = V_out/I_out;                                                       %Rezystancja obciążenia [Ohm]
P_loss = (100 - n)/100*V_out*I_out;                                        %Maksymalna moc strat [W]

% Cewka
I_Lav = I_in;                                                              %Średni prąd cewki [A]
L_min = V_in*(V_out-V_in)/(f_s*delta_I_L*V_out);                           %Minimalna wartość indukcyjności [H]
L_CCMmin = D*V_in/(2*I_in*f_s);                                            %Wartość indukcyjności, poniżej której zaczyna się DCM [H]
I_DCMout = D*V_in/(2*L_min*f_s);                                           %Prąd wyjściowy od którego zaczyna się DCM dla L_min [A] 
I_Lmax = I_in + delta_I_L/2;                                               %Maksymalny prąd cewki

%Dioda
I_Dav = I_out;                                                             %Średni prąd diody [A]
I_Dmax = I_Lmax;                                                           %Maksymalny prąd diody [A]
V_R = alfa_R * V_out;                                                      %Maksymalne napięcie wsteczne [V]
I_C = alfa_C * I_Dmax;                                                     %Maksymalny prąd przewodzenia [A]
I_DRMS = ((1-D)*(I_Dmax^2+delta_I_L^2/3-I_Dmax*delta_I_L))^0.5;            %RMS prądu diody [A]
    
%Kondensator wyjściowy
C_out = (I_out*D)/(f_s*delta_V_out);                                       %Minimalna wartość pojemności [F] 
I_CRMS = (I_DRMS^2-I_out^2)^0.5;                                           %RMS prądu kondensatora [A]
ESR_Cout = (delta_V_out)/(beta_ESRCout*I_Dmax);                            %Maksymalna wartość ESR kondensatora [Ohm]
V_Cout = beta_VCout * V_out;                                               %Napięcie polaryzacji kondensatora [V]

%MOSFET
V_DS = gamma_DS * V_out;                                                   %Maksymalne napięcie dren-źródło [V]
I_D = gamma_D * I_Dmax;                                                    %Maksymalny prąd drenu [A]

%% Uporządkowanie zmiennych do struktur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output.general.calc.D = D;                                   
output.general.calc.I_in = I_in;                   
output.general.calc.delta_I_L = delta_I_L;       
output.general.calc.delta_V_out = delta_V_out;                    
output.general.calc.R_out = R_out;                                     
output.general.calc.P_loss = P_loss;
output.L.calc.I_Lav = I_Lav;                               
output.L.calc.L_min = L_min;
output.L.calc.L_CCMmin = L_CCMmin;                                        
output.L.calc.I_DCMout = I_DCMout;                                
output.L.calc.I_Lmax = I_Lmax;
output.Diode.calc.I_Dav = I_Dav;                                             
output.Diode.calc.I_Dmax = I_Dmax;                              
output.Diode.calc.V_R = V_R;                                      
output.Diode.calc.I_C = I_C;                    
output.Diode.calc.I_DRMS = I_DRMS;
output.Cout.calc.C_out = C_out;
output.Cout.calc.I_CRMS = I_CRMS;           
output.Cout.calc.ESR_Cout = ESR_Cout;                                 
output.Cout.calc.V_Cout = V_Cout;
output.MOSFET.calc.V_DS = V_DS;                                  
output.MOSFET.calc.I_D = I_D;  
end