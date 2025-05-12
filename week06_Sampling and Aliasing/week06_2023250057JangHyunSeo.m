%1
run con2dis.m
%%
%2
tt=0:0.001:1;
a1=cos(2*pi*(11)*tt);
a2=cos(2*pi*(7)*tt);
a3=cos(2*pi*(2)*tt);
subplot(3,1,1);
plot(tt,a1);
xlabel("a1");
subplot(3,1,2);
plot(tt,a2);
xlabel("a2")
subplot(3,1,3);
plot(tt,a3);
xlabel("a3")
%%
%3
b1=10*a1+3*a2+a3;
b2=a1+3*a2+10*a3;
subplot(1,2,1);
plot(tt,b1);
xlabel("b1");
subplot(1,2,2);
plot(tt,b2);
xlabel("b2");
%b1 mainly contains high frequency components. freqs of a1 is 11, and
%whose amplitude is the most biggest
%%
%4
xx=imread('abdomen.bmp');
%5
minx=min(min(xx));
maxx=max(max(xx));
%6
imshow(xx);
%7
%비교적 선명한 왼쪽 구간이 low frequency, 드문드문한 가운데 부분이 high frequency임을 관찰할 수 있다.
%%
%8 
xx_down=xx(1:3:end,1:3:end);
subplot(2,1,1);
imshow(xx);
title("xx");
subplot(2,1,2);
imshow(xx_down);
title("xx down");
%픽셀이 더 깨진 것(aliasing)을 확인할 수 있다. high frequency였던 부분이 더 심하게 aliasing이 일어났음을
%확인할 수 있다. 충분한 fs를 확보하지 못했기 때문이다.
%%
%9&10
[M,N]=size(xx);
[X,Y]=meshgrid(1:3:N,1:3:M);
[xq,yq]=meshgrid(1:N,1:M);
subplot(2,1,1)
xx_down_ZOH=interp2(X,Y,xx_down,xq,yq,'nearest');
imshow(xx_down_ZOH);
title("zoh");
subplot(2,1,2);
xx_down_FOH=interp2(X,Y,double(xx_down),xq,yq,'linear');
imshow(uint8(xx_down_FOH));
title("foh")
%11
%zoh는 인접한 값과 동일한 값으로 보간한다. 반면 foh는 인접값들을 연결하여 더 부드러운 이미지를 만들 수 있다. 