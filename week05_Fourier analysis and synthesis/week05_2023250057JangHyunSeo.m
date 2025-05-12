%4 create square wave
%4-1)
T0=0.04;
t=0:0.005:T0;
%4-2)
f=[1 1 1 1 0 0 0 0 1 ];
%4-3)
[FSfun]=fscreate(t,f,6,TYPE='zoh');
%4-4)
FSfun('all')
%4-5)
coef=FSfun('coef')
%%
%4-6)
subplot(2,1,1)
stem(t,f) %he square wave signal created in 4.2).  Use stem() for the signal created in 4.2) 
subplot(2,1,2)
plot(t,f) %plot으로 그린 경우
%%
FSfun('plot')  %resultant plot using 6 harmonics in 4.3)
%%
%4-7)
subplot(2,1,1)
nn=-6:6;
ff=nn/T0;
stem(ff,abs(coef)); %freq에 대한 magnitude(Amplitude Complexcity)
ylabel('magnitude')
subplot(2,1,2)
coef(abs(coef)<1e-6) = 0;
stem(ff,angle(coef)); %freq에 대한 phase 
xlabel('f')
ylabel('phase')
%%
%4-8)
%magnitude는 ak에서 k=0일 때 1/2, k=+-2, +=4 ...일 때 0인 것, k=+-1, +-3..으로 절댓값이 증가함에 따라 크기가 작아지는 것으로 보아 일치함을 알 수 있다.
%반면 phase는 coef(abs(coef)<1e-6) = 0;없이 실행할 경우, 원래 magnitude가 0인 부분을 제외하면 동일하지만, magintude가 0임에도 phase가 0이 아닌 특정
%값이 뜬다. 0이 아닌 0에 매우 근접한 작은 값이 0으로 보여 abs()는 0으로 보이지만 angle()이 0이 나오지 않는 경우가
%있기 때문이다. 이런 경우 절댓값이 매우 작은 ceof값은 0으로 직접 바꿔줘야한다.


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%5 
T2=0.01;
t=0:0.0001:T2;
f=cos(200*pi*t);
[FSfun2]=fscreate(t,f,6,TYPE='zoh');
FSfun2('all')
coef2=FSfun2('coef')
subplot(2,2,1);
stem(t,f);
subplot(2,2,2);
plot(t,f);
title("Fourier Series Plot");
subplot(2,2,3);
stem(abs(coef2));
xlabel('Fuorier Ceofficients');
ylabel('Amplitude');
subplot(2,2,4);
coef2(abs(coef2)<1e-6) = 0 ;
stem(angle(coef2));
xlabel('Fuorier Ceofficients');
ylabel('Phase');
%%
%6
T3=4;
t=0:0.05:T3;
f=0;
for k=1:6
    f = f+sin(pi*k/2)*cos(pi*k*t/2)/(pi*k);
end
[FSfun3]=fscreate(t,f,6,TYPE='zoh');
FSfun3('all')
coef3=FSfun3('coef')

coef3(abs(coef3)<1e-6) = +0.0000+0.0000i;
angle3=angle(coef3);

%abs씌운 amplitude에 부호를 부여
%amplitude에 부호를 부여하지 않는다면 필요 없다.
idx=real(coef3)<0; 
signedcoef3=abs(coef3); 
signedcoef3(idx)=-signedcoef3(idx); 
%

subplot(2,2,1);
stem(t,f);
subplot(2,2,2);
plot(t,f);
title("Fourier Series Plot");
subplot(2,2,3);
stem(signedcoef3);
xlabel('Fuorier Ceofficients');
ylabel('Amplitude');
subplot(2,2,4);
stem(angle3);
xlabel('Fuorier Ceofficients');
ylabel('Phase');

