% function N = entradas3(theta1,theta2,theta1ponto,theta2ponto, t1,at1,at2)
% 
% 
%  g=9.78;
%  m1=0.8436;
%  m2=0.3860;
%  L1=0.2032;
%  L2=0.3556;
%  l1=0.1573;
%  l2=0.1417;
%  I1=0.0057974;
%  I2=0.0053914;
%  mp=0;
%  
% % 
% % theta1=1;
% % theta2=1;
% % theta1ponto=1;
% % theta2ponto=1;
% %  t1=0;
% %  t2=0;
% 
% % syms theta1 theta2 theta1ponto theta2ponto theta1ponto2 theta2ponto2 t1 t2   
% % syms l1 l2 L1 L2 g m1 m2 mp I1 I2
% 
% A1 = I1 + m2*L1^2;
% A2 = m2*L1*l2;
% A3 = m2*L1*l2;
% A4 = (m1*l1+m2*L1)*g;
% 
% B1 = m2*L1*l2;
% B2 = I2+m2*l2^2;
% B3 = m2*L1*l2;
% B4 = m2*g*l2;
% 
% 
% theta1ponto2 = (1/((B1*A2/B2)*cos(theta1-theta2)^2-A1))*((A2*B3/(2*B2))*sin(2*(theta1-theta2))*theta1ponto^2 + A3*sin(theta1-theta2)*theta2ponto^2 - A2*(B4/B2)*cos(theta2)*cos(theta1-theta2) + A4*cos(theta1) - (t1-at1*theta1ponto));
% 
% theta2ponto2 = (1/((B1*A2/A1)*cos(theta1-theta2)^2-B2))*(-B3*theta1ponto^2*sin(theta1-theta2)-B1*(A3/(2*A1))*sin(2*(theta1-theta2))*theta2ponto^2 - B1*(A4/A1)*cos(theta1)*cos(theta1-theta2) + B4*cos(theta2) + (B1/A1)*cos(theta1-theta2)*(t1-at1*theta1ponto));
% 
% N=[theta1ponto2, theta2ponto2];
% 
% 
%       
%  end
% function N = MalhaAberta(theta1,theta2,theta1ponto,theta2ponto, t1,at1,at2)
%  
%  
%  g=9.81;
%   
% m1=0.0555; 
% m2=0.0416; 
% L1=0.168;
% l1=0.0973; 
% L2=0.140;
% l2=0.07;
% I1=1.97e-4;
% I2=9.58e-5;
%  
%  
% A = I1 + m2*L1^2;
% B = m2*L1*l2;
% C = (m1*l1+m2*L1)*g;
% D = I2+m2*l2^2;
% E = m2*g*l2;
%  
%  
% % theta1ponto2 = (1/((B*B/D)*cos(theta1-theta2)^2-A))*((B*B/(2*D))*sin(2*(theta1-theta2))*theta1ponto^2 + B*sin(theta1-theta2)*theta2ponto^2 - B*(E/D)*cos(theta2)*cos(theta1-theta2) + C*cos(theta1) - (t1-at1*theta1ponto));
%  theta1ponto2 = (1/((B*B/D)*cos(theta1-theta2)^2-A))*((B*B/(2*D))*sin(2*(theta1-theta2))*theta1ponto^2 + B*sin(theta1-theta2)*theta2ponto^2 - B*(E/D)*cos(theta2)*cos(theta1-theta2) + C*cos(theta1) - t1)-at1*theta1ponto;
% % theta2ponto2 = (1/((B*B/A)*cos(theta1-theta2)^2-D))*(-B*theta1ponto^2*sin(theta1-theta2)-B*(B/(2*A))*sin(2*(theta1-theta2))*theta2ponto^2 - B*(C/A)*cos(theta1)*cos(theta1-theta2) + E*cos(theta2) + (B/A)*cos(theta1-theta2)*(t1-at2*theta1ponto));
%  theta2ponto2 = (1/((B*B/A)*cos(theta1-theta2)^2-D))*(-B*theta1ponto^2*sin(theta1-theta2)-B*(B/(2*A))*sin(2*(theta1-theta2))*theta2ponto^2 - B*(C/A)*cos(theta1)*cos(theta1-theta2) + E*cos(theta2) + (B/A)*cos(theta1-theta2)*(t1))-at2*theta1ponto;
% 
% N=[theta1ponto2, theta2ponto2];
%      
% end
 

function N = MalhaAberta(theta1,theta2,theta1ponto,theta2ponto, t1,at1,at2)
 
 
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

 M = [m11 m12; m21 m22];

%% Matriz correspondente as forças de Coriolis e centrifuga

h=-m2*L1*l2*sin(theta2);

C = [h*theta2ponto (h*theta2ponto+h*theta1ponto);
     -h*theta1ponto 0];
  
%% Matriz correspondente as forças exercidas pela gravidade

G = [(m1*l1+m2*L1)*g*cos(theta1)+m2*l2*g*cos(theta1+theta2);
     m2*l2*g*cos(theta1+theta2)];

 %% Matriz torque exercido na junta 1 e junta 2
 
  T = [t1;0];

 %% Matriz de atritoo na junta 1 e junta 2
 
AT= [at1*theta1ponto;
     at2*theta2ponto];

theta2pontos=inv(M)*(T-C-G-AT);
theta1ponto2 =theta2pontos(1,1);
theta2ponto2 =theta2pontos(2,1);

N=double([theta1ponto2, theta2ponto2]);
     
end




% function[xp]=sistema_2(z)
% %obtencao dos valores dos estados
% n=4;
% m=1;
% for I=1:n,
% x(I)=z(I);
% end
% for I=(n+1):(n+m),
% u(I-n)=z(I);
% end
% z/pi*180;
% %parametros
% m1 = 0.23425;
% m2 = 0.10281;
% L1 = 0.3;
% L2 = 0.3;
% B1 = 0.03007;
% B2 = 0.000748;
% C1 = 0.04;
% C2 = 0.001;
% Izz1 = 0.01439;
% Ixx2 = 0;
% Iyy2 = 0;
% Izz2 = 0.003055;
% g = -9.78;
% kv=0.00095;
% R=10;
% %calculo de M
% M=[Izz1+m2*L2^2*(sin(x(3)))^2/4+m1*L1^2/4+m2*L1^2 m2*L2*L1*cos(x(3))/2;
% m2*L1*L2*cos(x(3))/2 Izz2+m2*L2^2/4];
% T=[(3*kv*u(1))/R-9*(kv^2)*x(2)/R;
% 0 ];
% M_inv=inv(M);
% V=[ m2*L2^2*sin(2*x(3))*x(4)*x(2)/8-m2*L1*L2*sin(x(3))*x(4)^2/2;
% -m2*L2^2*(sin(2*x(3))*x(2)^2)/8]; %ja corrigido de L1 para L2
% G=[ 0;
% -m2*g*L2*sin(x(3))/2];
% F=[ C1*sign(x(2))+B1*x(2);
% C2*sign(x(4))+B2*x(4)];
% Result=M_inv*[T-V-G-F];
% %estados finais
% xp(1) = x(2);
% xp(2) = [1 0]*Result;
% xp(3) = x(4);
% xp(4) = [0 1]*Result;