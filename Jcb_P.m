function J = Jcb_P(delta,ex)
L1 = 0.15*(1 + delta);
L2 = 0.15*(1 - delta);
th1 = 0;
temp = (L1*L1+L2*L2-ex*ex)/(2*L1*L2);
th2 = pi - acos(temp);

J = ...
[ L2*cos(th1 - th2)*sin(th1) - sin(th1)*(L1 + L2*cos(th1 - th2)), L2*sin(th1 - th2)*cos(th1) - L2*cos(th1 - th2)*sin(th1);
  cos(th1)*(L1 + L2*cos(th1 - th2)) - L2*cos(th1 - th2)*cos(th1), L2*cos(th1 - th2)*cos(th1) + L2*sin(th1 - th2)*sin(th1)];
 

end