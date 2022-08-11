function [general,L,Diode,MOSFET,Cout] = S2_simulation_ideal(out)
    V_out = out.V_data.V_Boostout_mean.Data(end);                          %Napięcie wyjściowe [V]
    I_out = out.I_data.I_Boostout_mean.Data(end);                          %Prąd wyjściowy [A]
    I_in = out.I_data.I_in_mean.Data(end);                                 %Prąd wejściowy [A]
    
    
    delta_I_L_temp = islocalmin(out.I_data.I_L.Data);                      %Wektor minimów lokalnych prądu cewki
    delta_I_L_temp2 = islocalmax(out.I_data.I_L.Data);                     %Wektor maksimów lokalnych prądu cewki
    k = 1;
    l = 1;
    for i = 1:length(delta_I_L_temp)                                       %Pętla do stworzenia wektorów indeksów 
        if delta_I_L_temp(i) == 1                                          %minimów i maksimów lokalnych prądu cewki
             delta_I_L_temp_indx(k) = i;
             k = k + 1;
        end
        if delta_I_L_temp2(i) == 1
             delta_I_L_temp2_indx(l) = i;
             l = l + 1;
        end
    end
    delta_I_L = out.I_data.I_L.Data(delta_I_L_temp2_indx(end-1)) - ...     %Oscylacje prądu cewki[A]
        out.I_data.I_L.Data(delta_I_L_temp_indx(end-1));

    delta_V_out_temp = islocalmin(out.V_data.V_Boostout.Data);             %Wektor minimów lokalnych napięcia wyjściowego
    delta_V_out_temp2 = islocalmax(out.V_data.V_Boostout.Data);            %Wektor maksimów lokalnych napięcia wyjściowego
    k = 1;
    l = 1;
    for i = 1:length(delta_V_out_temp)                                     %Pętla do stworzenia wektorów indeksów
        if delta_V_out_temp(i) == 1                                        %minimów i maksimów lokalnych napiecia wyjściowego
             delta_V_out_temp_indx(k) = i;
             k = k + 1;
        end
        if delta_V_out_temp2(i) == 1
             delta_V_out_temp2_indx(l) = i;
             l = l + 1;
        end
    end
    delta_V_out = out.V_data.V_Boostout.Data(delta_V_out_temp2_indx(end-1))... %Oscylacje napięcia wyjściowego [V]
        - out.V_data.V_Boostout.Data(delta_V_out_temp_indx(end-1));
    %Cewka
    I_Lav = out.I_data.I_L_mean.Data(end);                                 %Średni prąd cewki [A]
    I_Lmax = out.I_data.I_L.Data(delta_I_L_temp2_indx(end-1));             %Maksymalny prąd cewki [A]
    %Dioda
    I_Dav = out.I_data.I_D_mean.Data(end);                                 %Średni prąd diody [A]
    I_Dmax = max(out.I_data.I_D.Data(end-10000:end));                      %Maksymalny prąd diody [A]
    I_DRMS = out.I_RMS_data.I_D_RMS.Data(end);                             %RMS prądu diody [A]
    %Kondensator wyjściowy
    I_CRMS = out.I_RMS_data.I_Cout_RMS.Data(end);                          %RMS prądu kondensatora [A]
    %MOSFET
    I_MOSFETRMS = out.I_RMS_data.I_MOSFET_RMS.Data(end);                   %RMS prądu MOSFETu [A]
    %% Uporządkowanie zmiennych do struktur %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    general.V_out = V_out;
    general.I_out = I_out;
    general.I_in = I_in;
    general.delta_I_L = delta_I_L;
    general.delta_V_out = delta_V_out;
    L.I_Lav = I_Lav;                    
    L.I_Lmax = I_Lmax;                     
    Diode.I_Dav = I_Dav;                 
    Diode.I_Dmax = I_Dmax;                 
    Diode.I_DRMS = I_DRMS;                        
    Cout.I_CRMS = I_CRMS;                      
    MOSFET.I_MOSFETRMS = I_MOSFETRMS;             
end
