spec.V_in = V_in;                                                           %Napięcie wejściowe[V]                                                     
spec.V_out = V_out;                                                            
spec.delta_V_out = delta_V_out;                                                     
spec.delta_I_L = delta_I_L;                                                        
spec.I_out = I_out;                                                                   
spec.n = n;                                                                
spec.f_s = f_s; 
spec.sim_time = sim_time;
coef.alfa_R = alfa_R;
coef.alfa_C = alfa_C;
coef.beta_Cout = beta_Cout;
coef.beta_ESRCout = beta_ESRCout;
coef.beta_VCout = beta_VCout;
coef.gamma_DS = gamma_DS;
coef.gamma_D = gamma_D;
clearvars -except spec coef ideal