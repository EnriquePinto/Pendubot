A=[0 0 1 0;
  0 0 0 1;
  39.107 -24.3536 0 0;
  -7.7169 159.355 0 -13.9202];
% A=[0 0 1 0;
%    0 0 0 1;
%    39.107 -24.3536 0 0;
%    -7.7169 159.355 0 0];
B=[0;0;522.69;-1376.07];
CTRL=rank(ctrb(A,B));
Q=[20 0 0 0;0 30 0 0; 0 0 5 0; 0 0 0 1];
R=[3];
[X,eig,K]=care(A,B,Q,R);