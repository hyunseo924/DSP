%1.1&1.2
 dconvdemo
% nn=0:99;
% xx=cos(0.08*pi*nn);
% bb=[1/31/31/3];
% yy=firfilt(bb,xx);
%1.4
%dconvdeomo
%%
%2.1
dconvdemo
%2.1.(a)
%x[n]: Unit Sample, delay 3
%h[n]: Unin Sample, delay 5
%2.1.(b)
%x[n]: Pulse, Amplitude -3, length 5, delay 3
%y[n]: User Signal, [1, -1]
%2.1.(c)
%bk의 값이 1과 -1로 절댓값이 같고 부호가 다르기 때문에 uniform한 x값에 적용되면 결과가 0이 됨.
%2.1.(d)&(e) n은 3부터 6까지 max값
%(f)
%%
%2.2
%(a)
load echart.mat;
show_img(echart);
%hold on
%plot([1, size(echart,2)], [67, 67], 'r', 'LineWidth', 2);
%%
%(b)
m=147; %임의의 row (67, 147, 221)
yy1 = firfilt(echart(m,:),[1,-1]);
subplot(2,1,1);
stem(echart(m,:))
title("before")
subplot(2,1,2);
stem(yy1);
title("after filtering")
%(c)
%sign은 black&white를 결정
%(d) 
%흰색(양수)->검정(0)은 negative, 검정(0)->흰색(양수)은 positive로 바뀜=nonzero 부분을 통해 edge를 찾을 수 있다.
%67은 m의 시작과 끝 부분을 커버하지 못하므로 적당한 m을 선택하여 계산하면 약 45-13=32가 나온다(가장 큰 E)
%%
clc;
%3: Filtering a Medical Image to Find Edges
load CT_chest.mat
[row,col]=size(chest);
xedge=zeros(row,col);
for m=1:row
    x=conv(chest(m,:),[1,-1]);
    xedge(m,:)=x(:,1:col);
end
yedge=zeros(row,col);
for m=1:col
    y=conv(chest(:,m),[1,-1]);
    yedge(:,m)=y(1:row,:);
end

xyedge=abs(xedge)+abs(yedge);

subplot(2,2,1);
imshow(chest);
title("origin")
subplot(2,2,2);
imshow(uint8(xedge));
title("x edge");
subplot(2,2,3);
imshow(uint8(yedge));
title("y edge");
subplot(2,2,4);
imshow(uint8(xyedge));
title("xy edge")
