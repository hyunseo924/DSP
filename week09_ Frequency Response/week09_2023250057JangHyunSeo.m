%%%%%%%%%%%%%%%LP12%%%%%%%%%%%%%%%%%
%2.1
%(a)~(b)
dltidemo
%(c) y[n]=1.05 cos(0.1\pin - 0.8\pi)=1.05cos(0.1*pi(n-8))
%(d) 8-4=4 -->4만큼 delay됨
%(e) y[n]은 length가 20 이상일 때 zero에 매우 근접한다.
%(f) what=1.1일 때 2pin만큼 주기가 차이나므로 이전 input과 같이 output이 zero가 나온다.
%%
%2.2
%(a)~(b)
bb1=ones(1,10)*0.8;
ww1=-pi:(pi/100):pi;
HH1=freqz(bb1,1,ww1);
bb2=[1,-0.8];
ww2=-pi:(pi/100):pi;
HH2=freqs(bb2,1,ww2);
%Filter#2 is lowpass filter
subplot(2,2,1);
plot(abs(HH1));
title("Filter#1-magnitude");
subplot(2,2,2);
plot(angle(HH1));
title("Filter#1-Phase");
subplot(2,2,3);
plot(abs(HH2));
title("Filter#2-magnitude");
subplot(2,2,4);
plot(angle(HH2));
title("Filter#2-Phase");
%(c)
%overall cascaded system의 frequency respones는 각 filter의 frequency response를 곱한 값, magnitude
%response는 각 magnitude response를 더한 값이 된다.
%%
%%%%%%%%%%%%%%%MP03%%%%%%%%%%%%%%%%
%4~5
[xx,fs]=audioread('SunshineSquare.wav');
xx=xx';
%soundsc(xx,fs);
%figure;
spectrogram(xx,[],fs);
% noise freq: 0.2857,0.5714,0.8571 (pi*radians/sample)
% start time: 7.979e+04
A1=-2*cos(pi*0.2857);
H1=[1,A1,1];
A2=-2*cos(pi*0.5714);
H2=[1,A2,1];
A3=-2*cos(pi*0.8571);
H3=[1,A3,1];
%%
%7
ww=-pi:pi/100:pi;
HH1=freqz(H1,1,ww);
HH2=freqz(H2,1,ww);
HH3=freqz(H3,1,ww);
subplot(2,3,1);
plot(abs(H1));
subplot(2,3,2);
plot(abs(H2));
subplot(2,3,3);
plot(abs(H3));
subplot(2,3,4);
plot(ww,abs(HH1));
subplot(2,3,5);
plot(ww,abs(HH2));
subplot(2,3,6);
plot(ww,abs(HH3));
%8~10
figure;
yy1=filter(H1,1,xx);
%spectrogram(yy1,[],fs);
yy2=filter(H2,1,yy1);
%spectrogram(yy2,[],fs);
yy3=filter(H3,1,yy2);
spectrogram(yy3,[],fs);
sound(yy3,fs)


