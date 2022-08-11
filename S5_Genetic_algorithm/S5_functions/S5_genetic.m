
dt = 1e-6;
PopSize = 25;
MaxGenerations = 10;
s = tf('s');
G_tf = (a*s^2+b*s+c)/(s^2+d*s+e);

lb = [left_bound lower_bound];   % Lower bounds
ub = [right_bound upper_bound];  % Upper bounds
figure
tf_param = [a b c d e];
options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGenerations',MaxGenerations,'OutputFcn',@S5_myfun);
[x,fval] = ga(@(x)S5_pidtest_IAE(t_f,tf_param,dt,x),2,[],[],[],[],lb,ub,...
    @(x)S5_simple_constraint(x,stability_fit_coeff,GM_low_fit_coeff,...
    GM_high_fit_coeff,PM_low_fit_coeff,PM_high_fit_coeff),options);

fval_IAE = fval;
x_IAE = x;

[x,fval] = ga(@(x)S5_pidtest_ITAE(t_f,tf_param,dt,x),2,[],[],[],[],lb,ub,...
    @(x)S5_simple_constraint(x,stability_fit_coeff,GM_low_fit_coeff,...
    GM_high_fit_coeff,PM_low_fit_coeff,PM_high_fit_coeff),options);

fval_ITAE = fval;
x_ITAE = x;

[x,fval] = ga(@(x)S5_pidtest_ISTAE(t_f,tf_param,dt,x),2,[],[],[],[],lb,ub,...
    @(x)S5_simple_constraint(x,stability_fit_coeff,GM_low_fit_coeff,...
    GM_high_fit_coeff,PM_low_fit_coeff,PM_high_fit_coeff),options);

fval_ISTAE = fval;
x_ISTAE = x;