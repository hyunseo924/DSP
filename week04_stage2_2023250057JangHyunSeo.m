%%
%4
fs=11025;
load bach_fugue_short.mat 
%load bach_fugue.mat

bpm=120;
beats_per_second=bpm/60;
seconds_per_beat=1/beats_per_second;
seconds_per_pulse=seconds_per_beat/4;
Tstartindex=[];
Tduration_samples=[];
Tendindex=[];
Tkeynum=[];
TnoteNumbers=[];

for i = 1:2
    startindex= round(seconds_per_pulse*theVoices(i).startPulses*fs);
    duration_samples=round(seconds_per_pulse*theVoices(i).durations*fs);
    endindex=startindex+duration_samples;
    Tstartindex=[Tstartindex startindex];
    Tduration_samples=[Tduration_samples duration_samples];
    Tendindex=[Tendindex endindex];
    TnoteNumbers=[TnoteNumbers theVoices(i).noteNumbers(:)'];
end

xx = zeros(1, max(Tendindex));
    
for kk = 1:length(TnoteNumbers)
    keynum = TnoteNumbers(kk);
    tt=(1:Tduration_samples(kk))/fs;
    tone =cos(2*pi*440*2^((1/12)*(keynum-49))*tt);
    xx(Tstartindex(kk):Tstartindex(kk)+Tduration_samples(kk)-1) = xx(Tstartindex(kk):Tstartindex(kk)+Tduration_samples(kk)-1)+tone;
end

 soundsc( xx, fs )
%%
%4(d)
spectrogram(xx,512,[],512,fs,'yaxis')
%%
%4(e) 
plot(xx(10000:10100))
