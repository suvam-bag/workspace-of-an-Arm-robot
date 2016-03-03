function [xp, yp] = workspace(x,y,r)

%objects ion x,y space
t=0:0.1:2*pi;   
xp = r*cos(t)+x;
yp = r*sin(t)+y; 
figure(1)
fill(xp(:),yp(:),'b');
axis equal;
hold on
rectangle('Position',[-1.25,0.625,0.4,0.4],...
          'FaceColor','b');
hold on

%circular objects in joint variable space
l1=1;
l2=1;
C2 = (xp.^2 + yp.^2 - l1^2 - l2^2)/(2*l1*l2);
S2 = sqrt(1 - C2.^2);
th2 = atan2d(-S2, C2);
k1 = l1 + l2.*C2;
k2 = l2*S2;
th1 = atan2d(yp, xp) - atan2d(-k2, k1); % theta1 is deduced
figure(3)
fill(th1(:),th2(:), 'r.');
hold on
axis equal;

%square object in joint variable space
a=-1.45:0.01:-1.05;
b=0.425:0.01:0.825;
[A, B] = meshgrid(a, b);
C2A = (A.^2 + B.^2 - l1^2 - l2^2)/(2*l1*l2);
S2A = sqrt(1 - C2A.^2);
th2A = atan2d(S2A, C2A); % theta2 is deduced
k7 = l1 + l2.*C2A;
k8 = l2*S2A;
th1A = atan2d(B, A) - atan2d(k8, k7); % theta1 is deduced
figure(3)
fill(th1A(:),th2A(:), 'r.');
hold on
axis equal;
end

