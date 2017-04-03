function JO = Jcb_O(delta,ex)
L1 = 0.15*(1 + delta);
L2 = 0.15*(1 - delta);
th1 = 0;
temp = (L1*L1+L2*L2-ex*ex)/(2*L1*L2);
th2 = pi - acos(temp);

JO = ...
[ - sin(th1)*(L1 + L2*cos(th2)) - L2*cos(th1)*sin(th2), - L2*cos(th1)*sin(th2) - L2*cos(th2)*sin(th1);
    cos(th1)*(L1 + L2*cos(th2)) - L2*sin(th1)*sin(th2),   L2*cos(th1)*cos(th2) - L2*sin(th1)*sin(th2)];

end