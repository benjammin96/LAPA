clear
nx=30;
ny=30;
MaxIt=100;

V = zeros(nx,ny);
BCR=1;
BCL=1;
V(:,1) =BCR;
V(:,nx)=BCL;
y=1;
x=1;
for i=1:MaxIt
for y =1:ny

    if(y==1 || y==ny)
       continue
    else
        for(x = 2:nx-1)
        V(y,x)= (V(y,x+1)+V(y,x-1)+V(y+1,x)+V(y-1,x))/4;

        end
    end
%     surf(V)
%     pause(0.001)
end
x=1:30;
y=1:30;
[X,Y]=meshgrid(x,y);
figure(1)
title 'Potential'
surf(X,Y,V);
pause(0.001)  
[dx,dy]=gradient(V);
figure(2)
title 'Electric field'
quiver(X,Y,dx,dy);



end
figure(3)
title 'Imboxfilt'
B=imboxfilt(V,3);
B(:,1) =BCR;
B(:,nx)=BCL;
B(ny,:)=0;
B(1,:)=0;
surf(B);

