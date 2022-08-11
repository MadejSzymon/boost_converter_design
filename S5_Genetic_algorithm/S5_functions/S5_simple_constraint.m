function [c, ceq] = S5_simple_constraint(x,p,r,s,t,u)
%SIMPLE_CONSTRAINT Nonlinear inequality constraints.

c = [-r(1)*x(1)^2 - r(2)*x(1) - r(3) + x(2);
     - p(1)*x(1)^2 - p(2)*x(1) - p(3) + x(2);
    s(1)*x(1)^2 + s(2)*x(1) + s(3) - x(2);
    - t(1)*x(1)^2 - t(2)*x(1) - t(3) + x(2);
    u(1)*x(1)^2 + u(2)*x(1) + u(3) - x(2)];

% No nonlinear equality constraints:
ceq = [];