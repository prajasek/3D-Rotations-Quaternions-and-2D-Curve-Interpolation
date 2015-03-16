%% Four-point_Interpolation
close all ; clc ; clear all;

%% 2c)
t  = [0:0.01:1]';                           %Values of t
B1 = [-5.334 10.667 -10.667 5.334; ...      %Second Formulation of 
      10.667 -18.667 13.34 -5.334; ...      %Blending Function
     -6.334 8 -2.667 1 ;... 
      1  0 0 0 ]
T = [t.^3, t.^2, t ,ones(101,1)];           % T(t) =[t^3 t^2 t 1]

P1 = T*B1;                                  % P1 = T(t) * M
figure();
plot(t,P1)                                  % Plot New Blending Function
xlabel('t -->');
ylabel('New Blending Function');
title('New Blending Function vs t');

B2= [-4.5 13.5 -13.5 4.5;                   % Original Blending Function
      9.0 -22.5 18 -4.5;
      -5.5 9.0 -4.5 1.0;
       1.0 0 0 0];
   
P2 = T*B2;                                  % P2 = T(t)* M 
figure();
plot(t,P2)                                  %PLot Original Blending Fn
xlabel('t-->');
ylabel('Original Blending Function');
title('Original Blending Function vs t');

%% 2d) Plot the Original 4-point interpolation curve for given points     

Pt = P2*[0 0 ; 1 0 ; 0 -1 ;  1 1 ];

figure();
plot(Pt(:,1) , Pt(:,2)) 
title('Question 2d)')
xlabel('Px')
ylabel('Py')
linex = zeros(1) * t ;
hold on;
plot(linex,t,'r')
plot(t,linex,'r')
plot(linex,-t,'r')
plot(-t , linex , 'r')

linex1 = ones(1,101)*1; 
hold on;
plot(linex1,t,'r');
plot(t,linex1,'r');
plot(linex1,-t,'r');
plot(-t , linex1 , 'r');

linex2 = ones(1,101)*-1; 
hold on;
plot(linex2,t,'r');
plot(t,linex2,'r');
plot(linex2,-t,'r');
plot(-t , linex2 , 'r');




