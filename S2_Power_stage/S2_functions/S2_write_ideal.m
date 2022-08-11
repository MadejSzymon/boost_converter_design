function S2_write_ideal(spec,general,L,Diode,Cout,MOSFET)
    fileID = fopen('../S2_reports/S2_report_ideal.txt','w');
    fprintf(fileID,'BOOST - DOBÓR PARAMETRÓW  ##############################################################################################################################\n\n');
    
    fprintf(fileID,'SPECYFIKACJA:  ##############################################################################################################################\n');
    fprintf(fileID,'Napięcie wejściowe =                                    %.2f V\n',spec.V_in);
    fprintf(fileID,'Napięcie wyjściowe =                                    %.2f V\n',spec.V_out);
    fprintf(fileID,'Maksymalne oscylacje napięcia wyjściowego =             %.2f %% \n',spec.delta_V_out);
    fprintf(fileID,'Maksymalne oscylacje prądu cewki =                      %.2f %% \n',spec.delta_I_L);
    fprintf(fileID,'Prąd wyjściowy =                                        %.2f A \n',spec.I_out);
    fprintf(fileID,'Minimalna sprawność =                                   %.2f %% \n',spec.n);
    fprintf(fileID,'Maksymalna moc strat =                                  %.2f W \n',general.calc.P_loss);
    fprintf(fileID,'Częstotliwość kluczowania =                             %.2f kHz \n\n',spec.f_s/1000);
    
    fprintf(fileID,'PODSTAWOWE PARAMETRY PRZETWORNICY:  ##############################################################################################################################\n');
    fprintf(fileID,'Współczynnik wypełnienia dla sprawności 100%% =         %.2f\n',general.calc.D);
    fprintf(fileID,'Maksymalne oscylacje napięcia wyjściowego =             %.2f V \n',general.calc.delta_V_out);
    fprintf(fileID,'Maksymalne oscylacje prądu cewki =                      %.2f A \n',general.calc.delta_I_L);
    fprintf(fileID,'Rezystancja obciążenia =                                %.2f Ohm \n\n',general.calc.R_out);
    
    fprintf(fileID,'PODSTAWOWE PARAMETRY ELEMENTÓW PRZETWORNICY - CEWKA:  ##############################################################################################################################\n');
    fprintf(fileID,'Średni prąd cewki =                                     %.2f A \n',L.calc.I_Lav);
    fprintf(fileID,'Minimalna wartość indukcyjności =                       %.2f uH \n',L.calc.L_min*1e6);
    fprintf(fileID,'Wartość indukcyjności, poniżej której zaczyna się DCM = %.2f uH \n',L.calc.L_CCMmin*1e6);
    fprintf(fileID,'Prąd wyjściowy od którego zaczyna się DCM dla L_min =   %.2f A \n',L.calc.I_DCMout);
    fprintf(fileID,'Maksymalny prąd cewki =                                 %.2f A \n\n',L.calc.I_Lmax);
    
    fprintf(fileID,'PODSTAWOWE PARAMETRY ELEMENTÓW PRZETWORNICY - DIODA:  ##############################################################################################################################\n');
    fprintf(fileID,'Średni prąd diody =                                     %.2f A \n',Diode.calc.I_Dav);
    fprintf(fileID,'Maksymalny prąd diody =                                 %.2f A \n',Diode.calc.I_Dmax);
    fprintf(fileID,'Maksymalne napięcie wsteczne =                          %.2f V \n',Diode.calc.V_R);
    fprintf(fileID,'Maksymalny prąd przewodzenia =                          %.2f A \n',Diode.calc.I_C);
    fprintf(fileID,'RMS prądu diody =                                       %.2f A \n\n',Diode.calc.I_DRMS);
    
    fprintf(fileID,'PODSTAWOWE PARAMETRY ELEMENTÓW PRZETWORNICY - KONDENSATOR WYJŚCIOWY:  ##############################################################################################################################\n');
    fprintf(fileID,'Minimalna wartość pojemności =                          %.2f uF \n',Cout.calc.C_out*1e6);
    fprintf(fileID,'RMS prądu kondensatora =                                %.2f A \n',Cout.calc.I_CRMS);
    fprintf(fileID,'Maksymalna wartość ESR kondensatora =                   %.2f mOhm \n',Cout.calc.ESR_Cout*1e3);
    fprintf(fileID,'Napięcie polaryzacji kondensatora =                     %.2f V \n\n',Cout.calc.V_Cout);
    
    fprintf(fileID,'PODSTAWOWE PARAMETRY ELEMENTÓW PRZETWORNICY - MOSFET:  ##############################################################################################################################\n');
    fprintf(fileID,'Maksymalne napięcie dren-źródło =                       %.2f V \n',MOSFET.calc.V_DS);
    fprintf(fileID,'Maksymalny prąd drenu =                                 %.2f A \n\n',MOSFET.calc.I_D);
    
    fprintf(fileID,'PORÓWANIE WYNIKÓW Z OBLICZEŃ I SYMULACJI:  ##############################################################################################################################\n');
    fprintf(fileID,'                                        Obliczenia       Symulacja\n');
    fprintf(fileID,'Napięcie wyjściowe =                    %.2f V          %.2f V\n',spec.V_out,general.sim.V_out);
    fprintf(fileID,'Prąd wyjściowy =                        %.2f A          %.2f A\n',spec.I_out,general.sim.I_out);
    fprintf(fileID,'Prąd wejściowy =                        %.2f A          %.2f A\n',general.calc.I_in,general.sim.I_in);
    fprintf(fileID,'Oscylacje prądu cewki =                 %.2f A          %.2f A\n',general.calc.delta_I_L,general.sim.delta_I_L);
    fprintf(fileID,'Oscylacje napiecia wejściowego =        %.2f V          %.2f V\n',general.calc.delta_V_out,general.sim.delta_V_out);
    fprintf(fileID,'Średni prąd cewki =                     %.2f A          %.2f A\n',L.calc.I_Lav,L.sim.I_Lav);
    fprintf(fileID,'Maksymalny prąd cewki =                 %.2f A          %.2f A\n',L.calc.I_Lmax,L.sim.I_Lmax);
    fprintf(fileID,'Średni prąd diody =                     %.2f A          %.2f A\n',Diode.calc.I_Dav,Diode.sim.I_Dav);
    fprintf(fileID,'Maksymalny prąd diody =                 %.2f A          %.2f A\n',Diode.calc.I_Dmax,Diode.sim.I_Dmax);
    fprintf(fileID,'RMS prądu diody =                       %.2f A          %.2f A\n',Diode.calc.I_DRMS,Diode.sim.I_DRMS);
    fprintf(fileID,'RMS prądu kondesatora wyjściowego =     %.2f A          %.2f A\n',Cout.calc.I_CRMS,Cout.sim.I_CRMS);
    fclose(fileID);
    
    cd ..\S2_output_data
    save("S2_data_ideal.mat")
    cd ..\S2_functions
end