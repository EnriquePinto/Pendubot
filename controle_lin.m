function T = controle_lin(theta1,theta2,theta1ponto,theta2ponto)
g=9.81;
m1=0.0555; 
m2=0.0416; 
L1=0.168;
l1=0.0973; 
L2=0.140;
l2=0.07;
I1=1.97e-4;
I2=9.58e-5;
 
%% Matriz de Inércia

 m11=I1+I2+m1*l1^2+m2*(L1^2+l2^2+2*L1*l2*cos(theta2));
 m12=I2+m2*(l2^2+L1*l2*cos(theta2));
 m21=m12;
 m22=I2+m2*l2^2;

 %% Matriz correspondente as forças exercidas pela gravidade

G = [(m1*l1+m2*L1)*g*cos(theta1)+m2*l2*g*cos(theta1+theta2);
     m2*l2*g*cos(theta1+theta2)];

%% Matriz correspondente as forças de Coriolis e centrifuga

h=m2*L1*l2*sin(theta2);

H = [-h*(2*theta1ponto*theta2ponto+(theta2ponto^2))+G(1);
    h*(theta1ponto^2)+G(2)];
  
%% Realimentação Linearizante
% kp=100;
% kd=2500;
% 
% u=Kp*(pi/2-theta1)-Kd*theta1ponto
% alpha=(m12*H(2)/m22)-H(1);
% beta=(m11-((m12^2)/m22));
% T=double([(beta*u-alpha)]);

%% Controle Linearizado
% x=[theta1;theta2;theta1ponto;theta2ponto];
% xlin=[pi/2;0;0;0];
% K=[-30.416501047675410 -26.453963003363242 -5.202491428055812 -2.747786601199247];
% T=-K*(x-xlin);
end