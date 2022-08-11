spec.V_in = V_in;
spec.V_out = V_out;
spec.I_out = I_out;
spec.f_s = f_s;
spec.D_add = D_add;
spec.sim_time = sim_time;
spec.D_add_time = D_add_time;
real_small.Diode.param.V_f = V_f;
real_small.Diode.param.DCR = DCR;
real_small.Cout.param.ESR_Cout = ESR_Cout;
real_small.Cout.param.C_out = C_out;                                                                 
real_small.MOSFET.param.R_DS = R_DS;
real_small.MOSFET.param.I_D = I_D;
real_small.MOSFET.param.V_th = V_th;
real_small.MOSFET.param.V_GS = V_GS;
real_small.MOSFET.param.t_R = t_R;
real_small.MOSFET.param.t_F = t_F;
real_small.MOSFET.param.C_iss = C_iss;
real_small.MOSFET.param.C_rss = C_rss;
real_small.MOSFET.param.C_oss = C_oss;
real_small.Cout.param.C_out = C_out;
real_small.L.param.L = L;
real_small.general.calc.D = D;
real_small.general.calc.R_out = R_out;
real_small.general.calc.omega_zn = omega_zn;
real_small.general.calc.omega_zp = omega_zp;
real_small.general.calc.omega_n = omega_n;
real_small.general.calc.dzeta = dzeta;
real_small.general.calc.T_px = T_px;
real_small.general.calc.T_p = T_p;
clearvars -except real_small out spec tf1