function SimpleSpeechRecognition(filename)

fs = 22000; % Sampling Frequency 
[x,fs]=audioread('e2.wav');

voice=cov(x);


[y0,fs]=audioread('o1.wav'); 	%reference
[y1,fs]=audioread('red1.wav');
[y2,fs]=audioread('green1.wav');
[y3,fs]=audioread('blue1.wav');





ref=cov(y0);
delta0 = abs(ref - voice);
sel = 'noise';
dif = abs(delta0);
disp(['noi: ',num2str(dif)]); 


one=cov(y1);
delta1 = abs(one - voice);
if (delta1 <= dif) 
    sel = 'red';
    dif = abs(delta1);
    disp(['red: ',num2str(dif)]);
end
  
two = cov(y2);
delta2 = abs(two - voice);
if (delta2 <= dif) 
    sel = 'green';
    dif = abs(delta2);
    disp(['gre: ',num2str(dif)]);
end 
     
three = cov(y3);
delta3 = abs(three - voice);
if (abs(delta3) <= dif) 
    sel = 'blue';
    dif = abs(delta3);
    disp(['blu: ',num2str(dif)]);
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
