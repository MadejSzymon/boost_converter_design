function J = S5_pidtest_ISTAE(t_f,a,dt,parms)


G = tf([parms(1)*a(1) parms(2)*a(1)+a(2)*parms(1) a(2)*parms(2)+a(3)*parms(1) a(3)*parms(2)],[1 a(4) a(5) 0],'InputDelay',1/20000);
G_fb = tf(1,[t_f 1],'InputDelay',1/20000);
ClosedLoop = feedback(G,G_fb);

t = 0:dt:0.05;
[y,t] = step(ClosedLoop,t);

J = trapz(t.^2.*abs(1-y))
step(ClosedLoop,t)
h = findobj(gcf,'type','line');
set(h,'linewidth',2);
drawnow