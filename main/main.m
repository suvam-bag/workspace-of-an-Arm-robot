l1 = 1; % length of first arm
l2 = 1; % length of second arm

theta1 = -(3*pi/2):0.1:(3*pi/2); % all possible theta1 values
theta2 = -(3*pi/4):0.1:(3*pi/4); % all possible theta2 values

[THETA1, THETA2] = meshgrid(theta1, theta2); % generate a grid of theta1 and theta2 values

X = l1 * cos(THETA1) + l2 * cos(THETA1 + THETA2); % compute x coordinates
Y = l1 * sin(THETA1) + l2 * sin(THETA1 + THETA2); % compute y coordinates

data1 = [X(:) Y(:) THETA1(:)]; % create x-y-theta1 dataset
data2 = [X(:) Y(:) THETA2(:)]; % create x-y-theta2 dataset

figure(1)
grid on;
plot(X(:), Y(:), 'r.');
hold on
axis equal;
xlabel('X','fontsize',10)
ylabel('Y','fontsize',10)
title('X-Y co-ordinates generated for all theta1 and theta2 combinations using forward kinematics formula','fontsize',10)

areaOfCircleC = workspace(0.75,0.0,0.125);
areaOfCircleD = workspace(1.125,0.0,0.125);
areaOfCircleB = workspace(-1.625,-0.3,0.25);


%conversion to theta domain by inverse kinematic
figure(3)
c2 = (X.^2 + Y.^2 - l1^2 - l2^2)/(2*l1*l2);
s2 = sqrt(1 - c2.^2);
THETA2D(:,:,1) = atan2d(s2, c2); % theta2 is deduced
THETA2D(:,:,2) = atan2d(-s2, c2);
k1 = l1 + l2*c2;
k2 = l2*s2;
THETA1D(:,:,1) = atan2d(Y, X) - atan2d(k2, k1); % theta1 is deduced
THETA1D(:,:,2) = atan2d(Y, X) - atan2d(-k2, k1);
xlabel('theta1');ylabel('theta2');
plot(THETA1D(:),THETA2D(:), 'y.');
hold on


%trajectory plot of theta1 vs t
figure(4)
%3 knot points have been considered
t1=[1,2,3,4,5];
theta_t1=[30,47.64,87.74,63.86,180];

i=1:1:2;
p1 = polyfit(t1(i),theta_t1(i),1);
x2 = 1:.1:2;
y2 = polyval(p1,x2);
plot(x2,y2,'b');
hold on
i=2:1:3;
p1 = polyfit(t1(i),theta_t1(i),1);
x2 = 2:.1:3;
y2 = polyval(p1,x2);
plot(x2,y2,'b');
hold on
i=3:1:5;
p1 = polyfit(t1(i),theta_t1(i),3);
x2 = 3:.1:5;
y2 = polyval(p1,x2);
plot(x2,y2,'b');
xlabel('time');ylabel('theta1');
hold on

%trajectory plot of theta2 vs t
figure(5)
%3 knot points have been considered
t2=[1,2,3,4,5];
theta_t2=[-110,-122.8,-122.8,117.8,0];

j=1:1:2;
p2 = polyfit(t2(j),theta_t2(j),1);
x3 = 1:.1:2;
y3 = polyval(p2,x3);
plot(x3,y3,'b');
hold on
j=2:1:3;
p2 = polyfit(t2(j),theta_t2(j),1);
x3 = 2:.1:3;
y3 = polyval(p2,x3);
plot(x3,y3,'b');
hold on
j=3:1:5;
p2 = polyfit(t2(j),theta_t2(j),3);
x3 = 3:.1:5;
y3 = polyval(p2,x3);
plot(x3,y3,'b');
xlabel('time');ylabel('theta2');
hold on

%trajectory plot of theta1 vs theta2
figure(3)

k=1:1:2;
t3 = polyfit(theta_t1(k),theta_t2(k),1);
x4 = 30:.1:47.64;
y4 = polyval(t3,x4);
plot(x4,y4,'b');
hold on
k=2:1:3;
t3 = polyfit(theta_t1(k),theta_t2(k),1);
x4 = 47.64:.1:87.74;
y4 = polyval(t3,x4);
plot(x4,y4,'b');
hold on
plot(y2,y3,'b');
hold on
