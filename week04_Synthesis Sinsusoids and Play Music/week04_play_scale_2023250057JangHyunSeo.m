%%3.1
function xx = key2not(X,keynum,dur) %dur: sec단위
    fs=11025;
    tt=0:(1/fs):dur; %1초에 11025 samples
    freq=440*2^(1/12*(keynum-49));%%채우기
    xx=real(X*exp(j*2*pi*frequ*tt));
end
%%
%%3.2
scale.keys= [ 40 42 44 45 47 49 51 52 ];
%--- NOTES: C D E F G A B C
scale.durations = 0.25 * ones(1,length(scale.keys));
fs = 11025;
xx = zeros(1, sum(scale.durations)*fs+length(scale.keys) );
n1 = 1;
for kk = 1:length(scale.keys)
    keynum = scale.keys(kk);
    tt=0:1/fs:0.25;
    tone =1*cos(2*pi*440*2^(1/12*(keynum-49))*tt);%%<============= FILL IN THIS LINE
    n2 = n1 + length(tone)- 1;
    xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
    n1 = n2 + 1;
end
 soundsc( xx, fs )
%%
%3.3 Spectrogram: Two M-files
spectrogram(xx,512,[],512,fs,'yaxis')
colormap(jet)

%%2단계는 다음주 과제와 함께 제출할 예정입니다.