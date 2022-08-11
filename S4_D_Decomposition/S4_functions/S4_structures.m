control.spec.PM_low = PM_low;
control.spec.GM_low = GM_low;
control.spec.PM_high = PM_high;
control.spec.GM_high = GM_high;
control.param.a = a;
control.param.b = b;
control.param.c = c;
control.param.d = d;
control.param.e = e;
control.param.T_A2D = T_A2D;
control.param.T_PWM = T_PWM;
control.param.T = T;

control.calc.i = 1i;
control.calc.w = w;
control.calc.K_p = K_p;
control.calc.K_i = K_i;


control.calc.w_list = w_list;
control.calc.K_p_list = K_p_list;
control.calc.K_i_list = K_i_list;
control.calc.K_p_PM_low_list = K_p_PM_low_list;
control.calc.K_i_PM_low_list = K_i_PM_low_list;
control.calc.K_p_GM_low_list = K_p_GM_low_list;
control.calc.K_i_GM_low_list = K_i_GM_low_list;

control.calc.K_p_PM_high_list = K_p_PM_high_list;
control.calc.K_i_PM_high_list = K_i_PM_high_list;
control.calc.K_p_GM_high_list = K_p_GM_high_list;
control.calc.K_i_GM_high_list = K_i_GM_high_list;

control.calc.K_p_list_temp = K_p_list_temp;
control.calc.K_i_list_temp = K_i_list_temp;
control.calc.K_p_PM_low_list_temp = K_p_PM_low_list_temp;
control.calc.K_i_PM_low_list_temp = K_i_PM_low_list_temp;
control.calc.K_p_GM_low_list_temp = K_p_GM_low_list_temp;
control.calc.K_i_GM_low_list_temp = K_i_GM_low_list_temp;

control.calc.K_p_PM_high_list_temp = K_p_PM_high_list_temp;
control.calc.K_i_PM_high_list_temp = K_i_PM_high_list_temp;
control.calc.K_p_GM_high_list_temp = K_p_GM_high_list_temp;
control.calc.K_i_GM_high_list_temp = K_i_GM_high_list_temp;

control.calc.k = k;
control.calc.fit_model = fit_model;
control.calc.fit_GM_low_model = fit_GM_low_model;
control.calc.fit_PM_low_model = fit_PM_low_model;
control.calc.fit_GM_high_model = fit_GM_high_model;
control.calc.fit_PM_high_model = fit_PM_high_model;

control.calc.fit_model_coeff = fit_model_coeff;
control.calc.fit_GM_low_model_coeff = fit_GM_low_model_coeff;
control.calc.fit_PM_low_model_coeff = fit_PM_low_model_coeff;
control.calc.fit_GM_high_model_coeff = fit_GM_high_model_coeff;
control.calc.fit_PM_high_model_coeff = fit_PM_high_model_coeff;
clearvars -except control tf1 x_IAE x_ISTAE x_ITAE fval_IAE fval_ISTAE fval_ITAE