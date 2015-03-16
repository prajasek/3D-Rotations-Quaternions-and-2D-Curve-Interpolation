function [q] = rotation3D_50120433(U,P0,P,th)

U = [U', 1]'
P0 = [P0',1]';
P= [P', 1]';

ux = U(1);
uy = U(2);
uz = U(3);

umag = sqrt(ux^2 + uy^2 + uz^2 );

u_unit = [ux /umag , uy/umag, uz/umag]';

d = sqrt((u_unit(2))^2  +  (u_unit(3)^2));

c1= u_unit(3) / d; %z
c2= u_unit(2) / d; %y

Rxthx = [ 1 0 0  0 ;  0 c1 -c2 0 ; 0 c2 c1 0 ; 0 0 0 1 ];
Rx_thx = [ 1 0 0  0 ;  0 c1 c2 0 ; 0 -c2 c1 0 ; 0 0 0 1 ];
Rythy = [d 0 -u_unit(1) 0 ; 0 1 0 0 ; u_unit(1) 0 d 0 ; 0 0 0 1];
Ry_thy = [d 0 u_unit(1) 0 ; 0 1 0 0 ; -u_unit(1) 0 d 0 ; 0 0 0 1];
Rz     = [ cos(th) -sin(th) 0 0 ; sin(th) cos(th) 0 0 ; 0 0 1 0 ; 0 0 0 1];
T1 = [1 0 0 -P0(1)  ; 0 1 0 -P0(2) ; 0 0 1 -P0(3) ; 0 0 0 1];
T2 = [1 0 0 P0(1)  ; 0 1 0 P0(2) ; 0 0 1 P0(3) ; 0 0 0 1];

R = T2*(Rx_thx)*(Ry_thy)*Rz * (Rythy) * (Rxthx) * T1;

q1 = R*P;
q = [q1(1) q1(2) q1(3)]'; 
