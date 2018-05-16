function SpeechRecognitionWithFunc()

fs = 20000; % Sampling Frequency 
[x,fs]=audioread('green6.wav');
N = 9000; %!!! take first N frames from sample
x = x(1:N); 
sound(x,fs);

voicefft = fft(x);
voicefftn = (voicefft-min(voicefft))/(max(voicefft)-min(voicefft))*1000;
%plot(abs(voicefftn));
%voice=cov(voicefftn);


[y0,fs]=audioread('yellow1.wav'); 	%reference
y0 = y0(1:N);
% samples uploading
[r0,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red1.wav');
r0 = r0(1:N);
[r1,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red2.wav');
r1 = r1(1:N);
[r2,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red3.wav');
r2 = r2(1:N);
[r3,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red4.wav');
r3 = r3(1:N);
[r4,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red5.wav');
r4 = r4(1:N);
[r5,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red6.wav');
r5 = r5(1:N);
[r6,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red7.wav');
r6 = r6(1:N);
[r7,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red8.wav');
r7 = r7(1:N);
[r8,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red9.wav');
r8 = r8(1:N);
[r9,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red10.wav');
r9 = r9(1:N);
[r10,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red11.wav');
r10 = r10(1:N);
[r11,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red12.wav');
r11 = r11(1:N);
[r12,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red13.wav');
r12 = r12(1:N);
[r13,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red14.wav');
r13 = r13(1:N);
[r14,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red15.wav');
r14 = r14(1:N);
[r15,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red16.wav');
r15 = r15(1:N);
[r16,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red17.wav');
r16 = r16(1:N);
[r17,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red18.wav');
r17 = r17(1:N);
%[r18,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red19.wav');
%r18 = r18(1:N);
%[r19,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\red20.wav');
%r19 = r19(1:N);

[b0,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue1.wav');
b0 = b0(1:N);
[b1,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue2.wav');
b1 = b1(1:N);
[b2,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue3.wav');
b2 = b2(1:N);
[b3,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue4.wav');
b3 = b3(1:N);
[b4,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue5.wav');
b4 = b4(1:N);
[b5,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue6.wav');
b5 = b5(1:N);
[b6,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue7.wav');
b6 = b6(1:N);
[b7,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue8.wav');
b7 = b7(1:N);
[b8,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue9.wav');
b8 = b8(1:N);
[b9,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue10.wav');
b9 = b9(1:N);
[b10,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue11.wav');
b10 = b10(1:N);
[b11,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue12.wav');
b11 = b11(1:N);
[b12,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue13.wav');
b12 = b12(1:N);
[b13,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue14.wav');
b13 = b13(1:N);
[b14,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue15.wav');
b14 = b14(1:N);
[b15,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue16.wav');
b15 = b15(1:N);
[b16,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue17.wav');
b16 = b16(1:N);
%[b17,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue18.wav');
%b17 = b17(1:N);
%[b18,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue19.wav');
%b18 = b18(1:N);
%[b19,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\blue20.wav');
%b19 = b19(1:N);

[g0,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green1.wav');
g0 = g0(1:N);
[g1,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green2.wav');
g1 = g1(1:N);
[g2,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green3.wav');
g2 = g2(1:N);
[g3,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green4.wav');
g3 = g3(1:N);
[g4,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green5.wav');
g4 = g4(1:N);
[g5,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green6.wav');
g5 = g5(1:N);
[g6,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green7.wav');
g6 = g6(1:N);
[g7,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green8.wav');
g7 = g7(1:N);
[g8,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green9.wav');
g8 = g8(1:N);
[g9,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green10.wav');
g9 = g9(1:N);
[g10,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green11.wav');
g10 = g10(1:N);
[g11,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green12.wav');
g11 = g11(1:N);
[g12,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green13.wav');
g12 = g12(1:N);
[g13,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green14.wav');
g13 = g13(1:N);
[g14,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green15.wav');
g14 = g14(1:N);
[g15,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green16.wav');
g15 = g15(1:N);
[g16,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green17.wav');
g16 = g16(1:N);
[g17,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green18.wav');
g17 = g17(1:N);
%[g18,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green19.wav');
%g18 = g18(1:N);
%[g19,fs]=audioread('C:\Users\Gera\Desktop\fir_matlab\slovar\green20.wav');
%g19 = g19(1:N);

reffft = fft(y0);
reffftn = (reffft-min(reffft))/(max(reffft)-min(reffft))*1000;
%plot(abs(reffftn));

covar =  cov(voicefftn,reffftn);
c0 = real(covar(1,2));

cmax = c0;

result0 = 'noise';

disp(['noi: ',num2str(cmax)]); 

treshold = 221; %lower is 50, max is 221
result1 = '';

for i = 0:17
    name = strcat('r',num2str(i));
    [cmax,result0] = subred(eval(name),voicefftn,cmax,treshold,i);
    %disp(cmax);
    if (~isempty(result0))
        result1 = result0;
    end
end

for j = 0:16
    name = strcat('b',num2str(j));
    [cmax,result0] = subblue(eval(name),voicefftn,cmax,treshold,j);
    %disp(cmax);
    if (~isempty(result0))
        %result1 = '';
        result1 = result0;
    end
end

for k = 0:17
    name = strcat('g',num2str(k));
    [cmax,result0] = subgreen(eval(name),voicefftn,cmax,treshold,k);
    %disp(cmax);
    if (~isempty(result0))
        %result1 = '';
        result1 = result0;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp(result1);
 
 
end

function [out1,out2] = subred(red,voicefftn,cmax,treshold,i)

redfft = fft(red);
redfftn = (redfft-min(redfft))/(max(redfft)-min(redfft))*1000;
covar =  cov(voicefftn,redfftn);
c = real(covar(1,2));
out1 = cmax;
out2 = '';
if (c>cmax)&&(c>treshold) 
    out1 = c;
    out2 = strcat('red',num2str(i+1));
    disp(['red: ',num2str(out1)]);
    
end
end

function [out3,out4] = subblue(blue,voicefftn,cmax,treshold,j)

bluefft = fft(blue);
bluefftn = (bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000;
covar =  cov(voicefftn,bluefftn);
c = real(covar(1,2));
out3 = cmax;
out4 = '';
if (c>cmax)&&(c>treshold) 
    out3 = c;
    out4 = strcat('blue',num2str(j+1));
    disp(['blue: ',num2str(out3)]);
    
end
end

function [out5,out6] = subgreen(green,voicefftn,cmax,treshold,k)

greenfft = fft(green);
greenfftn = (greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000;
covar =  cov(voicefftn,greenfftn);
c = real(covar(1,2));
out5 = cmax;
out6 = '';
if (c>cmax)&&(c>treshold) 
    out5 = c;
    out6 = strcat('green',num2str(k+1));
    disp(['green: ',num2str(out5)]);
    
end
end