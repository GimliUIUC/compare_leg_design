%% Manipulability Ellipsoid

delta = 0.1;


% draw ellipsoid

for ext = linspace(0.05,0.29,5)
    
    P = [ext;0];

% % open chain
%     JO = Jcb_O(delta,ext);
%     DrawEllip(JO,P);
%     drawOpenChain(delta,ext);


% % paralle five bar
%     JP = Jcb_P(delta,ext);
%     DrawEllip(JP,P);
%     drawParallel(delta,ext);

% 
% % symmetric five bar
%     JS = Jcb_S(delta,ext)
%     DrawEllip(JS,P);
%     drawSymmetric(delta,ext);

end


%% det(inv(JJ^T))

ext_span = linspace(0.05,0.29,100);
delta_span = linspace(0.1,0.9,100);
len_ext = length(ext_span);
len_del = length(delta_span);
detO = zeros(len_ext,len_del);
detP = zeros(len_ext,len_del);
detS = zeros(len_ext,len_del);
for i = 1:length(delta_span)
    for j = i:length(ext_span)
        JO = Jcb_O(delta_span(i),ext_span(j));
        JP = Jcb_P(delta_span(i),ext_span(j));
        JS = Jcb_S(delta_span(i),ext_span(j));
%         detO(j,i) = det(inv(JO*JO'));
%         detP(j,i) = det(inv(JP*JP'));
%         detS(j,i) = det(inv(JS*JS'));
        detO(j,i) = sqrt(det(JO*JO'));
        detP(j,i) = sqrt(det(JP*JP'));
        detS(j,i) = sqrt(det(JS*JS'));
        if detS(j,i)>0.02
            detS(j,i)=0.02;
        end
    end
end
[delta, ext] = meshgrid(delta_span,ext_span);
detO = detS;
detO = real(detO);
pcolor(delta,ext,detO)
shading flat
hold on
[C,H]=contour(delta,ext,detO,'-k','LevelStep',0.002);
colorbar
caxis([0 0.02])
clabel(C,H);
xlabel('\delta')
ylabel('extesion')
 
% figure
% mesh(delta,ext,detO)




