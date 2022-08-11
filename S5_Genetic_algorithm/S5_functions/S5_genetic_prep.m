
figure
hold on
plot3(K_p_list(stability_boundary_range(1):stability_boundary_range(2)),...
    K_i_list(stability_boundary_range(1):stability_boundary_range(2))...
    ,w_list(stability_boundary_range(1):stability_boundary_range(2)),'b','LineWidth',2)
stability_fit = fit(K_p_list(stability_boundary_range(1):stability_boundary_range(2))',...
    K_i_list(stability_boundary_range(1):stability_boundary_range(2))','poly2');
plot(stability_fit)
stability_fit_coeff = coeffvalues(stability_fit);
plot3(K_p_PM_low_list(PM_low_range(1):PM_low_range(2)),...
    K_i_PM_low_list(PM_low_range(1):PM_low_range(2)),...
    w_list(PM_low_range(1):PM_low_range(2)),'r','LineWidth',2)
PM_low_fit = fit(K_p_PM_low_list(PM_low_range(1):PM_low_range(2))',...
    K_i_PM_low_list(PM_low_range(1):PM_low_range(2))','poly2');
plot(PM_low_fit)
PM_low_fit_coeff = coeffvalues(PM_low_fit);
plot3(K_p_PM_high_list(PM_high_range(1):PM_high_range(2)),...
K_i_PM_high_list(PM_high_range(1):PM_high_range(2)),...
w_list(PM_high_range(1):PM_high_range(2)),'c','LineWidth',2)
PM_high_fit = fit(K_p_PM_high_list(PM_high_range(1):PM_high_range(2))',...
K_i_PM_high_list(PM_high_range(1):PM_high_range(2))','poly2');
plot(PM_high_fit)
PM_high_fit_coeff = coeffvalues(PM_high_fit);

plot3(K_p_GM_low_list(GM_low_range(1):GM_low_range(2)),...
    K_i_GM_low_list(GM_low_range(1):GM_low_range(2)),...
    w_list(GM_low_range(1):GM_low_range(2)),'g','LineWidth',2)
GM_low_fit = fit(K_p_GM_low_list(GM_low_range(1):GM_low_range(2))',...
    K_i_GM_low_list(GM_low_range(1):GM_low_range(2))','poly2');
plot(GM_low_fit)
GM_low_fit_coeff = coeffvalues(GM_low_fit);

plot3(K_p_GM_high_list(GM_high_range(1):GM_high_range(2)),...
    K_i_GM_high_list(GM_high_range(1):GM_high_range(2)),...
    w_list(GM_high_range(1):GM_high_range(2)),'k','LineWidth',2)
GM_high_fit = fit(K_p_GM_high_list(GM_high_range(1):GM_high_range(2))',...
    K_i_GM_high_list(GM_high_range(1):GM_high_range(2))','poly2');
plot(GM_high_fit)
GM_high_fit_coeff = coeffvalues(GM_high_fit);

xline(left_bound)
xline(right_bound)
yline(upper_bound)
yline(lower_bound)
xlabel('Kp')
ylabel('Ki')
view([0 90])
xlim([1.2*left_bound,1.2*right_bound])
ylim([1.2*lower_bound,1.2*upper_bound])