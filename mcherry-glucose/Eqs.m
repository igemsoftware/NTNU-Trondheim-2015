function dx=Eqs(t,x)

   k_c =254;
   k_1 =50;
   k_2 =500;
   k_Lc =1200;
   k_tr =1334;
   k_Gm =1.8;
   k_Gd =39;
   global GKC_e; 
   P_Gad =1e-3;

  %% Input
  KGN_i=x(1);
  C_1=x(2);
  C_2=x(3);
  PtxS=x(4);
  mCherry_i=x(5);
  mCherry_m=x(6);
  disp(t);

  %% Equations
  dKGN_i=k_c*(GKC_e-KGN_i)-k_1*KGN_i^2*PtxS^2+k_1*C_1;
  dC_1=k_1*KGN_i^2*PtxS^2-k_1*C_1+k_2*C_1*P_Gad;
  dC_2=k_2*C_1*P_Gad-k_2*C_2-k_tr*C_2;
  dPtxS=k_Lc-2*C_1-2*C_2;
  dmCherry_i=k_tr*C_2-k_Gm*mCherry_i-k_Gd*mCherry_i;
  dmCherry_m=k_Gm*mCherry_i-k_Gd*mCherry_m;

  %% Output
  dx=zeros(6,1);
  dx(1)=dKGN_i;
  dx(2)=dC_1;
  dx(3)=dC_2;
  dx(4)=dPtxS;
  dx(5)=dmCherry_i;
  dx(6)=dmCherry_m;
end