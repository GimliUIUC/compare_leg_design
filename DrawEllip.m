%% Draw Ellipsoid
function a = DrawEllip(J,P)
rot = @(th)[cos(th) -sin(th);sin(th) cos(th)];
hold on
[V,D] = eig(inv(J*J'));
v1 = V(:,1);
v2 = V(:,2);
scale = 1e-4;
% scale = 1;
a = D(1,1)*scale;
b = D(2,2)*scale;

th = atan2(v1(2),v1(1));

x0 = P(1);
y0 = P(2);
num = 50;
t = linspace(-pi,pi,num);
pos = [x0*ones(1,num);y0*ones(1,num)] + rot(th)*[a*cos(t);b*sin(t)];
plot(pos(1,:),pos(2,:))
axis([-0.1 0.35 -0.15 0.15])



end