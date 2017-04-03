%% find optimal delta value
% cost function
% min f = alpha1*1/sig_min2 + alpha2*sig_max

close all
delta_span = linspace(-0.99,0.99,200);
ex_span = linspace(0.01,0.29,100);
sig_min = zeros(size(ex_span,2),size(delta_span,2));
sig_max = zeros(size(sig_min));
sig_mean = zeros(size(sig_min));
sig_minmax = zeros(size(sig_min));
sig_new = zeros(size(sig_min));


% sig_min2 is a another sig_min with 0 entries replaced by a small value
% so that when it's inverted, the value would be big, which will not be 
% an optimal value
sig_minInv = zeros(size(sig_min));

[delta, extension] = meshgrid(delta_span,ex_span);
len_del = length(delta_span);
%% open chain sig_min
for i = 1:size(ex_span,2)
    for j = -(i-3)+100:i-3+100
        J = Jcb_P(delta(i,j),extension(i,j));
        sig_min(i,j) = sqrt(min(eig((J*J'))));
        sig_minInv(i,j) = 1/sqrt(min(eig((J*J'))));
%         if sig_min(i,j)~=0
%             sig_minInv = 1/sig_min(i,j);
%         end
        
        sig_max(i,j) = sqrt(max(eig((J*J'))));
        if sig_max(i,j)>1
            sig_max(i,j) = 1;
        end
        sig_mean(i,j) = 1/2*trace(J*J');
        if sig_mean(i,j)>0.1
            sig_mean(i,j) = 0.1;
        end
        sig_minmax(i,j) = sig_min(i,j)/sig_max(i,j);
        sig_new(i,j) = sig_max(i,j)/sig_min(i,j)-1;
%         sig_new(i,j) = log(sig_new(i,j));
    end
end
%% find optimal delta vale
alpha1 = 1;
alpha2 = 3;

% f = alpha1*f1 + alpha2*f2
% where f1 is column sum of 1/sig_min2
% f2 is column sum of sig_max
num = []
for ii = 1:size(sig_minInv,2)
    num = [num sum(sig_minInv(:,ii)~=0)];
end
f1 = sum(sig_minInv)./num;
f2 = sum(sig_max)./num;
f = alpha1*f1 + alpha2*f2;
[fmin,ind] = min(f)
delta_span(ind)



% sig_min
pcolor(delta,extension,sig_min)
shading flat
hold on
[C,H]=contour(delta,extension,sig_min,'-k','LevelStep',0.02);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{min}')
colorbar
caxis([0 0.2])
pbaspect([2 1 1])

% sig_max
figure
pcolor(delta,extension,sig_max)
shading flat
hold on
[C,H]=contour(delta,extension,sig_max,'-k','LevelStep',0.02);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{max}')
colorbar
caxis([0 0.5])
pbaspect([2 1 1])

% sig_mean
figure
pcolor(delta,extension,sig_mean)
shading flat
hold on
[C,H]=contour(delta,extension,sig_mean,'-k','LevelStep',0.002);
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
title('\sigma_{mean}')
colorbar
caxis([0 0.06])
pbaspect([2 1 1])

% open chain sig_minmax
figure
pcolor(delta,extension,sig_minmax)
shading flat
hold on
[C,H]=contour(delta,extension,sig_minmax,'-k');%,'LevelStep',0.01);
colorbar
% caxis([0 0.06])
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
pbaspect([2 1 1])
% title('\sigma_{max}/\sigma_{min}-1')

%% symmetric five_bar (S)
figure
for i = 1:size(ex_span,2)
    for j = 1:i
        del = delta(i,j);
        exten = extension(i,j);
        J = Jcb(delta(i,j),extension(i,j));
        sig_min(i,j) = sqrt(min(eig((J*J'))));
        sig_max(i,j) = sqrt(max(eig((J'*J))));
    end
end

pcolor(delta,extension,sig_min)
shading flat
hold on
[C,H]=contour(delta,extension,sig_min,'-k');
clabel(C,H);

figure
mesh(delta,extension,sig_min)



