function J = Jcb_S(delta,ex)
L1 = 0.15*(1 + delta);
L2 = 0.15*(1 - delta);
th1 = 0;
temp = (L1*L1+ex*ex-L2*L2)/(2*L1*ex);
th2 = 2*acos(temp);

J = ...
[ - cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2, cos(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))) - (sin(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2;
    (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 - sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2))), (cos(th1/2 + th2/2)*(L1*cos(th1/2 - th2/2) + (L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))/2 + sin(th1/2 + th2/2)*((L1*sin(th1/2 - th2/2))/2 + (L1^2*cos(th1/2 - th2/2)*sin(th1/2 - th2/2))/(2*(L2^2 - L1^2*sin(th1/2 - th2/2)^2)^(1/2)))];
 
end