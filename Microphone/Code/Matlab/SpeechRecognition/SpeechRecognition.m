function SpeechRecognition()

fs = 20000; % Sampling Frequency 
[x,fs]=audioread('luck1.wav');
x = x(1:9000); %!!!
sound(x,fs);

%voicefft = fft(x);
%voicefftn = (voicefft-min(voicefft))/(max(voicefft)-min(voicefft))*1000;
%plot(abs(voicefftn));
voice=cov(x);


[y0,fs]=audioread('yellow1.wav'); 	%reference
y0 = y0(1:9000);

[r0,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red1.wav');
r0 = r0(1:9000);
[r1,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red2.wav');
r1 = r1(1:9000);
[r2,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red3.wav');
r2 = r2(1:9000);
[r3,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red4.wav');
r3 = r3(1:9000);
[r4,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red5.wav');
r4 = r4(1:9000);
[r5,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red6.wav');
r5 = r5(1:9000);
[r6,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red7.wav');
r6 = r6(1:9000);
[r7,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red8.wav');
r7 = r7(1:9000);
[r8,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red9.wav');
r8 = r8(1:9000);
[r9,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red10.wav');
r9 = r9(1:9000);

[b0,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue1.wav');
b0 = b0(1:9000);
[b1,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue2.wav');
b1 = b1(1:9000);
[b2,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue3.wav');
b2 = b2(1:9000);
[b3,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue4.wav');
b3 = b3(1:9000);
[b4,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue5.wav');
b4 = b4(1:9000);
[b5,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue6.wav');
b5 = b5(1:9000);
[b6,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue7.wav');
b6 = b6(1:9000);
[b7,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue8.wav');
b7 = b7(1:9000);
[b8,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue9.wav');
b8 = b8(1:9000);
[b9,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue10.wav');
%b9 = b9(1:9000);


ref=cov(y0);
delta0 = abs(ref - voice);
sel = 'noise';
dif = abs(delta0);
disp(['noi: ',num2str(dif)]); 


red=cov(r0);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red1';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end
  
red=cov(r1);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red2';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

%red=cov(r2);
%deltar = abs(red - voice);
%if (deltar <= dif) 
%    sel = 'red3';
%    dif = abs(deltar);
%    disp(['red: ',num2str(dif)]);
%end

red=cov(r3);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red4';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

red=cov(r4);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red5';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

red=cov(r5);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red6';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

red=cov(r6);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red7';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

red=cov(r7);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red8';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

red=cov(r8);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red9';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

red=cov(r9);
deltar = abs(red - voice);
if (deltar <= dif) 
    sel = 'red10';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
end

blue=cov(b0);
deltab = abs(blue - voice);
if (deltab <= dif) 
    sel = 'blue1';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

blue=cov(b1);
deltab = abs(blue - voice);
if (deltab <= dif) 
    sel = 'blue2';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

blue=cov(b2);
deltab = abs(blue - voice);
if (deltab <= dif) 
    sel = 'blue3';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

blue=cov(b3);
deltab = abs(blue - voice);
if (deltab <= dif) 
    sel = 'blue4';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

blue=cov(b4);
deltab = abs(blue - voice);
if (deltab <= dif) 
    sel = 'blue5';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

%blue=cov(b5);
%deltab = abs(blue - voice);
%if (deltab <= dif) 
%    sel = 'blue6';
%    dif = abs(deltab);
%    disp(['blue: ',num2str(dif)]);
%end

%blue=cov(b6);
%deltab = abs(blue - voice);
%if (deltab <= dif) 
%    sel = 'blue7';
%    dif = abs(deltab);
%    disp(['blue: ',num2str(dif)]);
%end

%blue=cov(b7);
%deltab = abs(blue - voice);
%if (deltab <= dif) 
%    sel = 'blue8';
%    dif = abs(deltab);
%    disp(['blue: ',num2str(dif)]);
%end

blue=cov(b8);
deltab = abs(blue - voice);
if (deltab <= dif) 
    sel = 'blue9';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

%blue=cov(b9);
%deltab = abs(blue - voice);
%if (deltab <= dif) 
%    sel = 'blue10';
%    dif = abs(deltab);
%    disp(['blue: ',num2str(dif)]);
%end

disp(sel);
 
 

   
end
