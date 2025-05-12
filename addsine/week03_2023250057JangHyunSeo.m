%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Lab P-1
%%
%a
T=1/4000;
tt=-T:T/25:T;
%b
D=24;
M=9;
A1=22;
A2=1.2*A1;
tm1=37.2/M*T;
tm2=-41.3/D*T;
x1=A1*cos(2*pi*4000*(tt-tm1));
x2=A2*cos(2*pi*4000*(tt-tm2));
subplot(3,1,1)
plot(tt,x1)
title("x1 장현서")
subplot(3,1,2)
plot(tt,x2)
title("x2")
%c
x3=x1+x2;
subplot(3,1,3)
plot(tt,x3)
title("x3")
%d
orient tall
print -dpng 'sin_plot.png'
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Lab S-0
%3-1
figure;
x=(1:200)/60;
r=sqrt(x.*x-1);
sig=exp(1j*2*pi*r);
plot(x,real(sig),'mo-',x,imag(sig),'go-')
%%
%3-2
function [xx,tt] = onecos(f,X,dur,tstart)
    T=1/f;
    tt=tstart:T/32:tstart+dur;
    xx=real(X*exp(1j*2*pi*f*tt));
end
[xx0,tt0] = onecos([2], [5*exp(j*pi/4)], 2,-1);
plot(tt0,xx0)
%%publish
%%file:///C:/%EA%B3%A0%EB%8C%80%203-1/MATLAB/html/week03_2023250057JangHyunSeo.html
%%
%3-3-1
function [xx,tt] = add_sines(freqs, Camps, dur, tstart)
    Tmin=1/max(freqs);
    tt=tstart:Tmin/32:tstart+dur;
    xx=0;
    if length(freqs) ~= length(Camps)
        error("lengths of freqs and Camps are not equal.")
    end
    for k=1:length(freqs)
        xx=xx+exp(2*pi*freqs(k)*tt*j)*Camps(k);
    end
    xx=real(xx);
end
save("add_sines.mat")
%3-3-2
load add_sines.mat
[xx0,tt0] = add_sines([12,9,0], [exp(j*pi/4),2i,-4], 1,-0.5);
plot(tt0,xx0);
%%publish
%%file:///C:/%EA%B3%A0%EB%8C%80%203-1/MATLAB/html/week03_2023250057JangHyunSeo.html
T_final=1/gcd(12,9)
fre_final=1/T_final
%%figure에 점을 찍어 직접 period를 확인할 수도 있다.
%%한 극점(-0.304688,-6.97838)을 기준으로 한 주기 이후의 극점은 (0.0286458,-6.97838)이다. 
%%0.0286458-(-0.304688)=0.3333으로 계산한 값과 일치함을 확인할 수 있다. 
