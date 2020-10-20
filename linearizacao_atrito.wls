#!/usr/bin/env wolframscript
(* ::Package:: *)

Remove["Global`*"];
Solve[m11 \[Theta]1+m12 \[Theta]2 +h1+at1 d\[Theta]1==\[Tau] && m21 \[Theta]1+m22 \[Theta]2 +h2+at2 d\[Theta]2==0 ,{\[Theta]1, \[Theta]2}]
m1=0.0555;
m2=0.0416;
L1=0.168;
L2=0.14;
l1=0.0973;
l2=0.07;
I1=1.97*10^-4;
I2=9.58*10^-5;
g=9.8;
at1=0.000;
at2=0.002;
m11[\[Theta]2_]=I1+I2+m1*l1^2+m2*L1^2+m2*(l2^2+L2^2)+2L1*m2*l2*Cos[\[Theta]2];
m22=I2+m2*l2^2;
m12[\[Theta]2_]=I2+m2*l2^2+L1*m2*l2*Cos[\[Theta]2];
m21[\[Theta]2_]=m12[\[Theta]2];
g1[\[Theta]1_,\[Theta]2_]=(m1 l1+m2 L1)*g*Cos[\[Theta]1]+m2*l2*g*Cos[\[Theta]1+\[Theta]2];
g2[\[Theta]1_,\[Theta]2_]=m2 l2*g*Cos[\[Theta]1+\[Theta]2];
h1[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_]=-L1(m2 l2)Sin[\[Theta]2](2d\[Theta]1 d\[Theta]2+d\[Theta]2^2)+g1[\[Theta]1,\[Theta]2];
h2[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_]=L1 m2 l2 Sin[\[Theta]2]d\[Theta]1^2+g2[\[Theta]1,\[Theta]2];
f1[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=-((at2 d\[Theta]2 m12[\[Theta]2]+h2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2] m12[\[Theta]2] -at1 d\[Theta]1 m22-h1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2] m22+m22 T)/(m12[\[Theta]2]m21[\[Theta]2]-m11[\[Theta]2]m22));
f2[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=-((at2 d\[Theta]2 m11[\[Theta]2]+h2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2] m11[\[Theta]2] -at1 d\[Theta]1 m21[\[Theta]2]-h1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2] m21[\[Theta]2]+m21[\[Theta]2] T)/(-m12[\[Theta]2]m21[\[Theta]2]+m11[\[Theta]2]m22));
J31[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],\[Theta]1];
J32[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],\[Theta]2];
J33[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],d\[Theta]1];
J34[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],d\[Theta]2];
J41[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],\[Theta]1];
J42[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],\[Theta]2];
J43[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],d\[Theta]1];
J44[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],d\[Theta]2];
T1[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f1[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],T];
T2[d\[Theta]1_,d\[Theta]2_,\[Theta]1_,\[Theta]2_,T_]=D[f2[d\[Theta]1,d\[Theta]2,\[Theta]1,\[Theta]2,T],T];
\[Theta]1eq=Pi/2;
\[Theta]2eq=0;
d\[Theta]1eq=0;
d\[Theta]2eq=0;
J31eq=J31[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J32eq=J32[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J33eq=J33[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J34eq=J34[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J41eq=J41[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J42eq=J42[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J43eq=J43[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
J44eq=J44[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
T1eq=T1[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
T2eq=T2[d\[Theta]1eq,d\[Theta]2eq,\[Theta]1eq,\[Theta]2eq,0];
a={{0,0,1,0},{0,0,0,1},{J31eq,J32eq,J33eq,J33eq},{J41eq,J42eq,J43eq,J44eq}}
b={0,0,T1eq,T2eq}


(* ::InheritFromParent:: *)
(*{{0,0,1,0},{0,0,0,1},{39.10711789063332`,-24.353558731461334`,0.`,0.`},7.716875553108532`,159.35472876340168`,0.`,0.`}}*)


(* ::InheritFromParent:: *)
(**)
