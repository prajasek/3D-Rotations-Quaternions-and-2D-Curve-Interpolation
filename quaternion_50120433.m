function [q] = quaternion_50120433(U,P0,P,th)

U = [U', 1]';
P0 = [P0',1]';
P= [P', 1]';
ux = U(1);
uy = U(2);
uz = U(3);

umag = sqrt(ux^2 + uy^2 + uz^2 );

v = [ux /umag , uy/umag, uz/umag]';

vx= v(1);
vy= v(2);
vz= v(3);

c1 = 1 - 2*((sin(th/2)^2)*(vy^2 + vz^2));
c2 = 2*((sin(th/2)^2)*vx*vy) - 2 *cos(th/2)*sin(th/2)*vz;
c3 =  2*((sin(th/2)^2)*vx*vz) + 2*cos(th/2)*sin(th/2)*vy;
c4 = 2*((sin(th/2)^2)*vx*vy) + 2*cos(th/2)*sin(th/2)*vz;
c5 = 1 - 2*((sin(th/2)^2)*(vx^2 + vz^2));
c6 =  2*((sin(th/2)^2)*vy*vz) - 2*cos(th/2)*sin(th/2)*vx;
c7 = 2*((sin(th/2)^2)*vx*vz) - 2*cos(th/2)*sin(th/2)*vy;
c8 =  2*((sin(th/2)^2)*vy*vz)+ 2*cos(th/2)*sin(th/2)*vx;
c9 = 1 - 2*((sin(th/2)^2)*(vx^2 + vy^2));



R = [c1 c2 c3 0 ; c4 c5 c6 0; c7 c8 c9 0 ; 0 0 0 1];

T1 = [1 0 0 -P0(1)  ; 0 1 0 -P0(2) ; 0 0 1 -P0(3) ; 0 0 0 1];
T2 = [1 0 0 P0(1)  ; 0 1 0 P0(2) ; 0 0 1 P0(3) ; 0 0 0 1];

M = T2*R*T1;
q1= M*P;
q = [q1(1) q1(2) q1(3)]' ;

