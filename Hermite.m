%% Hermite_Interpolation

clear all ; close all ; clc;
t  = [0:0.01:1]';                           %Values of t
s = size(t);
T = [t.^3, t.^2, t ,ones(s)];
F1 = [2 -2 1 1 ; -3 3 -2 -1; 0 0 1 0 ; 1 0 0 0 ];
Ft = T*F1;
F = Ft *[ 0 0 ; 2 0 ; 1 1  ;1 0];
plot(F(:,1) , F(:,2) )
xlabel('Px')
ylabel('Py')
title('Curve')


