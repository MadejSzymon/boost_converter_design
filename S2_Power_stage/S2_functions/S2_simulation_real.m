function [general,L,Diode,MOSFET,Cout] = S2_simulation_real(out,V_in)
    general.V_out = out.V_data_real.V_Boostout_mean.Data(end);             %Napięcie wyjściowe [V]
    general.I_out = out.I_data_real.I_Boostout_mean.Data(end);             %Prąd wyjściowy [A]
    general.I_in = out.I_data_real.I_in_mean.Data(end);                    %Prąd wejściowy [A]
    general.n_real = general.V_out*general.I_out/(V_in*general.I_in)*100;  %Sprawność[%]
    
    delta_I_L_temp = islocalmin(out.I_data_real.I_L.Data);                 %Wektor minimów lokalnych prądu cewki
    delta_I_L_temp2 = islocalmax(out.I_data_real.I_L.Data);                %Wektor maksimów lokalnych prądu cewki
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
    general.delta_I_L = out.I_data_real.I_L.Data(delta_I_L_temp2_indx(end-1)) - ...   %Oscylacje prądu cewki[A]
        out.I_data_real.I_L.Data(delta_I_L_temp_indx(end-1));

    delta_V_out_temp = islocalmin(out.V_data_real.V_Boostout.Data);        %Wektor minimów lokalnych napięcia wyjściowego
    delta_V_out_temp2 = islocalmax(out.V_data_real.V_Boostout.Data);       %Wektor maksimów lokalnych napięcia wyjściowego
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
    general.delta_V_out = out.V_data_real.V_Boostout.Data(delta_V_out_temp2_indx(end-1))... %Oscylacje napięcia wyjściowego [V]
        - out.V_data_real.V_Boostout.Data(delta_V_out_temp_indx(end-1));
    
    %Cewka
    L.I_Lav = out.I_data_real.I_L_mean.Data(end);                                %Średni prąd cewki [A]
    L.I_Lmax = max(out.I_data_real.I_L.Data(end-10000:end));                     %Maksymalny prąd cewki [A]
    %Dioda
    Diode.I_Dav = out.I_data_real.I_D_mean.Data(end);                            %Średni prąd diody [A]
    Diode.I_Dmax = max(out.I_data_real.I_D.Data(end-10000:end));                 %Maksymalny prąd diody [A]
    Diode.I_DRMS = out.I_RMS_data_real.I_D_RMS.Data(end);                        %RMS prądu diody [A]
    %Kondensator wyjściowy
    Cout.I_CRMS = out.I_RMS_data_real.I_Cout_RMS.Data(end);                      %RMS prądu kondensatora [A]
    %MOSFET
    MOSFET.I_MOSFETRMS = out.I_RMS_data_real.I_MOSFET_RMS.Data(end);             %RMS prądu MOSFETu [A] 
end
