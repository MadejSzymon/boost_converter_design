function S2_write_real(spec,general,L,Diode,Cout,MOSFET)
    fileID = fopen('../S2_reports/S2_report_real.txt','w');
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
    fprintf(fileID,'Współczynnik wypełnienia =                              %.2f\n',general.calc.D);
    fprintf(fileID,'Rezystancja obciążenia =                                %.2f Ohm \n\n',general.calc.R_out);
    
    fprintf(fileID,'PORÓWNANIE WYNIKÓW Z OBLICZEŃ I SYMULACJI:  ##############################################################################################################################\n');
    fprintf(fileID,'                                        Obliczenia       Symulacja      Dobrano poprawnie:\n');
    fprintf(fileID,'Sprawność =                             %.2f %%         %.2f %%                              ',general.calc.n_real,general.sim.n_real);
    if general.calc.n_real > spec.n && general.sim.n_real > spec.n
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    fprintf(fileID,'Oscylacje prądu cewki =                 %.2f %%          %.2f %%                             ',general.calc.delta_I_L/L.calc.I_Lav*100,general.sim.delta_I_L/L.sim.I_Lav*100);
    if general.calc.delta_I_L > general.sim.delta_I_L
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    fprintf(fileID,'Oscylacje napiecia wyjściowego =        %.2f %%          %.2f %%                              ',general.calc.delta_V_out/spec.V_out*100,general.sim.delta_V_out/general.sim.V_out*100);
    if general.calc.delta_V_out > general.sim.delta_V_out
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    
    fprintf(fileID,'DOBÓR KOMPONENTÓW - CEWKA:  ##############################################################################################################################\n');
    fprintf(fileID,'                                        Dobrano       Obliczenia       Symulacja      Dobrano poprawnie\n');
    fprintf(fileID,'Indukcyjność =                          %.2f uH       %.2f uH          ---------           ',L.param.L*1e6,L.calc.L_min*1e6);
    if L.param.L > L.calc.L_min
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    fprintf(fileID,'Średni prąd =                           %.2f A        %.2f A          %.2f A                  ',L.param.I_Lav,L.calc.I_Lav,L.sim.I_Lav);
    if L.param.I_Lav > L.calc.I_Lav && L.param.I_Lav> L.sim.I_Lav
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
     fprintf(fileID,'Maksymalny prąd =                      %.2f A        %.2f A          %.2f A                   ',L.param.I_Lmax,L.calc.I_Lmax,L.sim.I_Lmax);
    if L.param.I_Lmax > L.calc.I_Lmax && L.param.I_Lmax> L.sim.I_Lmax
        fprintf(fileID,'TAK\n\n');
    else
        fprintf(fileID,'NIE\n\n');
    end
    
    fprintf(fileID,'DOBÓR KOMPONENTÓW - DIODA:  ##############################################################################################################################\n');
    fprintf(fileID,'                                        Dobrano       Obliczenia       Symulacja      Dobrano poprawnie\n');
    fprintf(fileID,'Średni prąd =                           %.2f A        %.2f A           %.2f A                ',Diode.param.I_Dav,Diode.calc.I_Dav,Diode.sim.I_Dav);
    if Diode.param.I_Dav > Diode.calc.I_Dav && Diode.param.I_Dav > Diode.sim.I_Dav
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    fprintf(fileID,'Maksymalny prąd przewodzenia =          %.2f A        %.2f A           ------                ',Diode.param.I_C,Diode.calc.I_C);
    if Diode.param.I_C > Diode.calc.I_C
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
     fprintf(fileID,'Maksymalne napięcie wsteczne =         %.2f V        %.2f V           ------               ',Diode.param.V_R,Diode.calc.V_R);
    if Diode.param.V_R > Diode.calc.V_R
        fprintf(fileID,'TAK\n\n');
    else
        fprintf(fileID,'NIE\n\n');
    end
    
    fprintf(fileID,'DOBÓR KOMPONENTÓW - KONDENSATOR WYJŚCIOWY:  ##############################################################################################################################\n');
    fprintf(fileID,'                                        Dobrano       Obliczenia       Symulacja      Dobrano poprawnie\n');
    fprintf(fileID,'Pojemność =                             %.2f uF        %.2f uF         ------                ',Cout.param.C_out*1e6,Cout.calc.C_out*1e6);
    if Cout.param.C_out > Cout.calc.C_out
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    fprintf(fileID,'ESR =                                   %.2f Ohm       %.2f Ohm        ------                ',Cout.param.ESR_Cout,Cout.calc.ESR_Cout);
    if Cout.param.ESR_Cout < Cout.calc.ESR_Cout
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
     fprintf(fileID,'Napięcie polaryzacji =                 %.2f V         %.2f V          ------                ',Cout.param.V_Cout,Cout.calc.V_Cout);
    if Cout.param.V_Cout > Cout.calc.V_Cout
        fprintf(fileID,'TAK\n\n');
    else
        fprintf(fileID,'NIE\n\n');
    end
    
    fprintf(fileID,'DOBÓR KOMPONENTÓW - MOSFET:  ##############################################################################################################################\n');
    fprintf(fileID,'                                        Dobrano       Obliczenia       Symulacja      Dobrano poprawnie\n');
    fprintf(fileID,'Napięcie dren-źródło =                  %.2f V         %.2f V          ------                ',MOSFET.param.V_DS,MOSFET.calc.V_DS);
    if MOSFET.param.V_DS > MOSFET.calc.V_DS
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    fprintf(fileID,'Prąd drenu =                            %.2f A         %.2f A          ------                   ',MOSFET.param.I_D,MOSFET.calc.I_D);
    if  MOSFET.param.I_D >  MOSFET.calc.I_D
        fprintf(fileID,'TAK\n');
    else
        fprintf(fileID,'NIE\n');
    end
    cd ..\S2_output_data
    save("S2_data_real.mat")
    cd ..\S2_functions
end