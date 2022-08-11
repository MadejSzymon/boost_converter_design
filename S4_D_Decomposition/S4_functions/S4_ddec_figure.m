figure(1)

hold on

 
plot3(K_p_list,K_i_list,w_list,'b','LineWidth',2)
plot3(K_p_PM_low_list,K_i_PM_low_list,w_list,'r','LineWidth',2)
plot3(K_p_PM_high_list,K_i_PM_high_list,w_list,'c','LineWidth',2)
plot3(K_p_GM_low_list,K_i_GM_low_list,w_list,'g','LineWidth',2)
plot3(K_p_GM_high_list,K_i_GM_high_list,w_list,'k','LineWidth',2)

yline(0)
xline(0)
Le = legend('Granica stabliności','$PM_{low}$','$PM_{high}$','$GM_{low}$','$GM_{high}$');
set(Le,'Interpreter','latex')

xlabel('Kp')
ylabel('Ki')
view([0 90])