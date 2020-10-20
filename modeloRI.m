% function Q=modeloRI(u)
% q1=u(1); tau=u(2);at1=u(3); theta1ponto=u(4);
% I1=0.00042; I2=1.685e-5; m1=0.0555; m2=0.141; 
% lc1=0.0085; l1=0.168; g=9.81;
% D11=I1+I2+m1*(lc1^2)+m2+l1^2; D12=I2;
% D21=I2; D22=I2;
% D=[D11 D12; D21 D22];
% G11=(m1*lc1+m2*l1)*g*sin(q1); G21=0;
% G=[G11; G21]; T=[0; tau];
% Qpp=D\(T-G); q1pp=Qpp(1,1)- (at1*theta1ponto); q2pp=Qpp(2,1);
% Q=[q1pp;q2pp];

function Q=modeloRI(u)
q1=u(1); tau=u(2);at1=u(3); theta1ponto=u(4);at2=0;
I1=1.97e-4; I2=3.968e-5; m1=0.0555; m2=0.141; 
lc1=0.0973; l1=0.168; g=9.81;

Ja=m1*lc1^2+m2*l1^2+I2; J1=inv(Ja);
h=(m1*lc1+m2*l1)*g;
J2=J1+inv(I2);
q1pp=-J1*(h*sin(q1)+tau+(at1*theta1ponto));
q2pp=J1*h*sin(q1)+J2*(tau+(at2*theta1ponto));
Q=[q1pp;q2pp];