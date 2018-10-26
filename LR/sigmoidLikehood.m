% function L = sigmoidLikehood(x, y, w)
% % x: features of a data point
% % y: single number 
% sig = 1/(1 + exp(-dot(w,x)));
% L = ( (1 - sig)^(1 - y) ) * ( sig^y );


function L = sigmoidLikehood(x, y, w)
         
%             y = (1) .*(x>2.0) + ... %positive part
%             (((x - x.^2/4)*0.5)+0.5) .*(0 <= x & x <= 2.0) + ... %positive part x-x.^2/4+1
%             (((x + x.^2/4)*0.5)+0.5) .*(-2.0 <= x & x < 0) + ... %negative part x+x.^2/4-1
%             ((0)) .*(x<-2.0); %negative part
            

u=dot(w,x);
idx = find(u > 2);
u(idx) = 2;
u(u>2) =2;

idx = find(u < -2);
u(idx) = -2;
u(u<-2) =-2;
         a = u;
         b = -abs(u);
         sig =((( u + (a.*(b))/4)*0.5)+0.5);
L = ( (1 - sig)^(1 - y) ) * ( sig^y );
end
    