function output = S2_calculate_real(V_in,V_out,delta_V_out,delta_I_L,I_out,n,f_s...
    ,alfa_R,alfa_C,beta_Cout,beta_ESRCout,beta_VCout,gamma_DS,...
    gamma_D,ESR_Cout,R_DS,t_R,t_F,DCR,V_f,L,V_out_p)
%% Obliczenia podstawowych parametrów elementów przetwornicy %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms('x');
P_DCR = DCR*(I_out^2*V_out_p^2)/(V_in^2*x^2);                              %Straty mocy na rezystancji diody{W}
P_D_f = I_out*V_f;                                                         %Straty mocy na  spadku napięciu przewodzenia diody[W]
P_R_DS = (V_out_p-V_in*x)/(V_out_p)*(I_out^2*V_out_p^2)/(V_in^2*x^2)*R_DS; %Straty mocy na rezystancji dren-źródło MOSFETu[W]
P_sw = 0.5*V_out_p*f_s*(t_R+t_F)*(I_out*V_out_p)/(V_in*x);                %Straty mocy na przełączaniu MOSFETu
n_list_p = double(solve(x == (I_out*V_out_p)/(I_out*...
     V_out_p+DCR*(I_out^2*V_out_p^2)/(V_in^2*x^2)+...
     I_out*V_f+...
     (V_out_p-V_in*x)/(V_out_p)*(I_out^2*V_out_p^2)/(V_in^2*x^2)*R_DS+...
     0.5*V_out_p*f_s*(t_R+t_F)*((I_out*V_out_p)/(V_in*x)+delta_I_L*(V_out_p*I_out)/(100*V_in*x)/2)+...
     ((V_in*x/V_out_p*(((V_out_p*I_out)/(V_in*x)+delta_I_L*(V_out_p*I_out)/(100*V_in*x)/2)^2+...
     (((delta_I_L*(V_out_p*I_out)/(100*V_in*x))^2)/...
     (3-delta_I_L*(V_out_p*I_out)/(100*V_in*x)*((V_out_p*I_out)/(V_in*x)+...
     delta_I_L/2)))))-I_out^2)*R_DS),x));
n_temp_p = 0;
for i =  1:length(n_list_p)
    if n_list_p(i) > n_temp_p && n_list_p(i) < 1
        n_temp_p = n_list_p(i);
    end
end
D_p = 1 - V_in/V_out_p*n_temp_p;




n_list = double(solve(x == (I_out*V_out)/(I_out*...
     V_out+DCR*(I_out^2*V_out^2)/(V_in^2*x^2)+...
     I_out*V_f+...
     (V_out-V_in*x)/(V_out)*(I_out^2*V_out^2)/(V_in^2*x^2)*R_DS+...
     0.5*V_out*f_s*(t_R+t_F)*((I_out*V_out)/(V_in*x)+delta_I_L*(V_out*I_out)/(100*V_in*x)/2)+...
     ((V_in*x/V_out*(((V_out*I_out)/(V_in*x)+delta_I_L*(V_out*I_out)/(100*V_in*x)/2)^2+...
     (((delta_I_L*(V_out*I_out)/(100*V_in*x))^2)/...
     (3-delta_I_L*(V_out*I_out)/(100*V_in*x)*((V_out*I_out)/(V_in*x)+...
     delta_I_L/2)))))-I_out^2)*R_DS),x));
n_temp = 0;
for i =  1:length(n_list)
    if n_list(i) > n_temp && n_list(i) < 1
        n_temp = n_list(i);
    end
end
D = 1 - V_in/V_out*n_temp;
n_real = (1-D)*V_out/V_in*100;                                              %Sprawność [%]
I_in = I_out/(1-D);                                                         %Prąd wejściowy [A]
delta_I_L = delta_I_L*I_in/100;                                             %Oscylacje prądu cewki [A]
delta_V_out = delta_V_out*V_out/100;                                        %Oscylacje napięcia wyjściowego [V]
R_out = V_out/I_out;                                                        %Rezystancja obciążenia [Ohm]
P_loss = (100 - n)/100*V_out*I_out;                                         %Maksymalna moc strat [W]

% Cewka
I_Lav = I_in;                                                               %Średni prąd cewki [A]
L_min = V_in*(V_out-V_in)/...                                               %Minimalna wartość indukcyjności [H]
    (f_s*delta_I_L*V_out);
L_CCMmin = D*V_in/...
    (2*I_in*f_s);                                                           %Wartość indukcyjności, poniżej której zaczyna się DCM [H]
I_DCMout = D*V_in/...
    (2*L*f_s);                                                              %Prąd wyjściowy od którego zaczyna się DCM dla L_min [A] 
I_Lmax = I_in + ...
    delta_I_L/2;                                                            %Maksymalny prąd cewki

%Dioda
I_Dav = I_out;                                                              %Średni prąd diody [A]
I_Dmax = I_Lmax;                                                            %Maksymalny prąd diody [A]
V_R = alfa_R * V_out;                                                       %Maksymalne napięcie wsteczne [V]
I_C = alfa_C * I_Dmax;                                                      %Maksymalny prąd przewodzenia [A]
I_DRMS = ((1-D)*...
    (I_Dmax^2+delta_I_L^2/...                                               %RMS prądu diody [A]
    3-I_Dmax*delta_I_L))^0.5;

%Kondensator wyjściowy
C_out = (beta_Cout*I_out*D)/...                                             %Minimalna wartość pojemności [F]
    (f_s*(delta_V_out-ESR_Cout*...
    (I_in+delta_I_L/2)));
I_CRMS = (I_DRMS^2-I_out^2)^0.5;                                            %RMS prądu kondensatora [A]
ESR_Cout = (delta_V_out)/...
    (beta_ESRCout*I_Dmax);                                                  %Maksymalna wartość ESR kondensatora [Ohm]
V_Cout = beta_VCout * V_out;                                                %Napięcie polaryzacji kondensatora [V]

%MOSFET
V_DS = gamma_DS * V_out;                                                    %Maksymalne napięcie dren-źródło [V]
I_D = gamma_D * I_Dmax;                                                     %Maksymalny prąd drenu [A]
%% Uporządkowanie zmiennych do struktur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output.general.calc.D = D;
output.general.calc.D_p = D_p;
output.general.calc.I_in = I_in;                   
output.general.calc.delta_I_L = delta_I_L;       
output.general.calc.delta_V_out = delta_V_out;                    
output.general.calc.R_out = R_out;                                     
output.general.calc.P_loss = P_loss;
output.general.calc.n_real = n_real;
output.general.calc.n_list = n_list;
output.general.calc.n_temp = n_temp;
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