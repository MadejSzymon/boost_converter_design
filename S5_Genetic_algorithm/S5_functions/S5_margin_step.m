
PWM_tf = tf([1],[1],'InputDelay',T_PWM);
A2D_tf = tf([1],[1],'InputDelay',T_A2D);
t_f_tf = tf([1],[0 1]);

K_p_0 = x_ISTAE(1);
K_i_0 = x_ISTAE(2);
PI_ISTAE = tf([K_p_0 K_i_0],[1 0]);
G_ISTAE = feedback(PI_ISTAE*PWM_tf*tf1,A2D_tf*t_f_tf);

K_p_0 = x_ITAE(1);
K_i_0 = x_ITAE(2);
PI_ITAE = tf([K_p_0 K_i_0],[1 0]);
G_ITAE = feedback(PI_ITAE*PWM_tf*tf1,A2D_tf*t_f_tf);

K_p_0 = x_IAE(1);
K_i_0 = x_IAE(2);
PI_IAE = tf([K_p_0 K_i_0],[1 0]);
G_IAE = feedback(PI_IAE*PWM_tf*tf1,A2D_tf*t_f_tf);

figure
margin(PI_ISTAE*PWM_tf*tf1*A2D_tf*t_f_tf)
legend('ISTAE')
figure
margin(PI_ITAE*PWM_tf*tf1*A2D_tf*t_f_tf)
legend('ITAE')
figure
margin(PI_IAE*PWM_tf*tf1*A2D_tf*t_f_tf)
legend('IAE')
figure
hold on 
margin(PI_ISTAE*PWM_tf*tf1*A2D_tf*t_f_tf)
margin(PI_ITAE*PWM_tf*tf1*A2D_tf*t_f_tf)
margin(PI_IAE*PWM_tf*tf1*A2D_tf*t_f_tf)
title('Bode Diagram')
legend('ISTAE','ITAE','IAE')
hold off
figure 
hold on
step(G_ISTAE)
step(G_ITAE)
step(G_IAE)
hold off
xlim([0 40e-3])
legend('ISTAE','ITAE','IAE')