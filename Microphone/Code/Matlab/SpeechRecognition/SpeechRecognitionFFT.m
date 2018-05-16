function SpeechRecognitionFFT()

fs = 20000; % Sampling Frequency 
[x,fs]=audioread('yellow1.wav');
x = x(1:9000); %!!!
sound(x,fs);

voicefft = fft(x);
voicefftn = (voicefft-min(voicefft))/(max(voicefft)-min(voicefft))*1000;
%plot(abs(voicefftn));
voice=cov(voicefftn);


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

reffft = fft(y0);
reffftn = (reffft-min(reffft))/(max(reffft)-min(reffft))*1000;
%plot(abs(reffftn));

ref=cov(reffftn);
delta0 = abs(ref - voice);
sel = 'noise';
dif = abs(delta0);
disp(['noi: ',num2str(dif)]); 

treshold = 40;

redfft = fft(r0);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red1';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end
  
redfft = fft(r1);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold))  
    sel = 'red2';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r2);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red3';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r3);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red4';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r4);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold))
    sel = 'red5';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
   
end

redfft = fft(r5);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red6';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r6);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red7';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r7);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red8';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r8);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red9';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

redfft = fft(r9);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
red=cov(redfftn);
deltar = abs(red - voice);
if ((deltar <= dif)&&(deltar <=treshold)) 
    sel = 'red10';
    dif = abs(deltar);
    disp(['red: ',num2str(dif)]);
    
end

bluefft = fft(b0);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold))  
    sel = 'blue1';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b1);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue2';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b2);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold))
    sel = 'blue3';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b3);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold))
    sel = 'blue4';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b4);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue5';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b5);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue6';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b6);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue7';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b7);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue8';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b8);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue9';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

bluefft = fft(b9);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
blue=cov(bluefftn);
deltab = abs(blue - voice);
if ((deltab <= dif)&&(deltab <=treshold)) 
    sel = 'blue10';
    dif = abs(deltab);
    disp(['blue: ',num2str(dif)]);
end

disp(sel);
 
 
%if sel == one
%    soundsc(y1,Fs)
%        soundsc(h,Fs)
%elseif sel == two
%    soundsc(y2,Fs)
%        soundsc(h,Fs)
%elseif sel == three
%    soundsc(y3,Fs)
%        soundsc(h,Fs)
%elseif sel == four
%    soundsc(y4,Fs)
%        soundsc(h,Fs)
%elseif sel == five
%    soundsc(y5,Fs)
%        soundsc(h,Fs)
%else soundsc(audioread('denied.wav'),Fs)
   
end
