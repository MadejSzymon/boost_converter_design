D = real.general.calc.D;                                                    % Współczynnik wypełnienia przed przejściem do nowego punktu pracy [-]
D_p = real.general.calc.D_p;                                                  % Współczynnik wypełnienia po przejściu do nowego punktu pracy [-]
D_add = D - D_p;                                                             % Wzrost współczynnika wypełnienia [-]
R_out = V_out_p/I_out;                                                        % Rezystancja wyjściowa [Ohm]
%% Elementy transmitancji (Równania 2-6 )%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
omega_zn = 1/(C_out*ESR_Cout);
omega_zp = (R_out*(1-D)^2-DCR)/L;
omega_n = (((1-D)^2*R_out+DCR)/(L*C_out*(R_out+ESR_Cout)))^0.5;
dzeta = (C_out*(DCR*(R_out+ESR_Cout)+R_out*ESR_Cout*(1-D)^2)+L)/...
    (2*(L*C_out*(R_out+ESR_Cout)*(DCR+(1-D)^2*R_out))^0.5);
T_px = (-ESR_Cout*V_out_p)/((R_out+ESR_Cout)*(1-D));
%%  Transmitancja (Równanie 1)
T_p = tf([T_px T_px*(omega_zn-omega_zp) ...
    -T_px*omega_zn*omega_zp],[1 2*dzeta*omega_n omega_n^2]);