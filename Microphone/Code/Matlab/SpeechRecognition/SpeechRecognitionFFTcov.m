function SpeechRecognitionFFTcov()

fs = 20000; % Sampling Frequency 
[x,fs]=audioread('green5.wav');
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

sel = 'noise';
disp(['noi: ',num2str(cmax)]); 

treshold = 150; %lower is 50, max is 201

redfft = fft(r0);
redfftn0 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r1);
redfftn1 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r2);
redfftn2 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r3);
redfftn3 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r4);
redfftn4 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r5);
redfftn5 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r6);
redfftn6 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r7);
redfftn7 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r8);
redfftn8 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r9);
redfftn9 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r10);
redfftn10 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r11);
redfftn11 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r12);
redfftn12 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r13);
redfftn13 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r14);
redfftn14 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r15);
redfftn15 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r16);
redfftn16 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);
redfft = fft(r17);
redfftn17 = real((redfft-min(redfft))/(max(redfft)-min(redfft))*1000);


bluefft = fft(b0);
bluefftn0 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b1);
bluefftn1 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b2);
bluefftn2 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b3);
bluefftn3 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b4);
bluefftn4 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b5);
bluefftn5 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b6);
bluefftn6 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b7);
bluefftn7 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b8);
bluefftn8 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b9);
bluefftn9 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b10);
bluefftn10 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b11);
bluefftn11 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b12);
bluefftn12 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b13);
bluefftn13 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b14);
bluefftn14 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b15);
bluefftn15 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
bluefft = fft(b16);
bluefftn16 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);
%bluefft = fft(b17);
%bluefftn17 = real((bluefft-min(bluefft))/(max(bluefft)-min(bluefft))*1000);

greenfft = fft(g0);
greenfftn0 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g1);
greenfftn1 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g2);
greenfftn2 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g3);
greenfftn3 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g4);
greenfftn4 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g5);
greenfftn5 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g6);
greenfftn6 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g7);
greenfftn7 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g8);
greenfftn8 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g9);
greenfftn9 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g10);
greenfftn10 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g11);
greenfftn11 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g12);
greenfftn12 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g13);
greenfftn13 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g14);
greenfftn14 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g15);
greenfftn15 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g16);
greenfftn16 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);
greenfft = fft(g17);
greenfftn17 = real((greenfft-min(greenfft))/(max(greenfft)-min(greenfft))*1000);

%{
save('r0.txt', 'redfftn0', '-ASCII','-append');
save('r1.txt', 'redfftn1', '-ASCII','-append');
save('r2.txt', 'redfftn2', '-ASCII','-append');
save('r3.txt', 'redfftn3', '-ASCII','-append');
save('r4.txt', 'redfftn4', '-ASCII','-append');
save('r5.txt', 'redfftn5', '-ASCII','-append');
save('r6.txt', 'redfftn6', '-ASCII','-append');
save('r7.txt', 'redfftn7', '-ASCII','-append');
save('r8.txt', 'redfftn8', '-ASCII','-append');
save('r9.txt', 'redfftn9', '-ASCII','-append');
save('r10.txt', 'redfftn10', '-ASCII','-append');
save('r11.txt', 'redfftn11', '-ASCII','-append');
save('r12.txt', 'redfftn12', '-ASCII','-append');
save('r13.txt', 'redfftn13', '-ASCII','-append');
save('r14.txt', 'redfftn14', '-ASCII','-append');
save('r15.txt', 'redfftn15', '-ASCII','-append');
save('r16.txt', 'redfftn16', '-ASCII','-append');
save('r17.txt', 'redfftn17', '-ASCII','-append');

save('b0.txt', 'bluefftn0', '-ASCII','-append');
save('b1.txt', 'bluefftn1', '-ASCII','-append');
save('b2.txt', 'bluefftn2', '-ASCII','-append');
save('b3.txt', 'bluefftn3', '-ASCII','-append');
save('b4.txt', 'bluefftn4', '-ASCII','-append');
save('b5.txt', 'bluefftn5', '-ASCII','-append');
save('b6.txt', 'bluefftn6', '-ASCII','-append');
save('b7.txt', 'bluefftn7', '-ASCII','-append');
save('b8.txt', 'bluefftn8', '-ASCII','-append');
save('b9.txt', 'bluefftn9', '-ASCII','-append');
save('b10.txt', 'bluefftn10', '-ASCII','-append');
save('b11.txt', 'bluefftn11', '-ASCII','-append');
save('b12.txt', 'bluefftn12', '-ASCII','-append');
save('b13.txt', 'bluefftn13', '-ASCII','-append');
save('b14.txt', 'bluefftn14', '-ASCII','-append');
save('b15.txt', 'bluefftn15', '-ASCII','-append');
save('b16.txt', 'bluefftn16', '-ASCII','-append');
%save('b17.txt', 'bluefftn17', '-ASCII','-append');

save('g0.txt', 'greenfftn0', '-ASCII','-append');
save('g1.txt', 'greenfftn1', '-ASCII','-append');
save('g2.txt', 'greenfftn2', '-ASCII','-append');
save('g3.txt', 'greenfftn3', '-ASCII','-append');
save('g4.txt', 'greenfftn4', '-ASCII','-append');
save('g5.txt', 'greenfftn5', '-ASCII','-append');
save('g6.txt', 'greenfftn6', '-ASCII','-append');
save('g7.txt', 'greenfftn7', '-ASCII','-append');
save('g8.txt', 'greenfftn8', '-ASCII','-append');
save('g9.txt', 'greenfftn9', '-ASCII','-append');
save('g10.txt', 'greenfftn10', '-ASCII','-append');
save('g11.txt', 'greenfftn11', '-ASCII','-append');
save('g12.txt', 'greenfftn12', '-ASCII','-append');
save('g13.txt', 'greenfftn13', '-ASCII','-append');
save('g14.txt', 'greenfftn14', '-ASCII','-append');
save('g15.txt', 'greenfftn15', '-ASCII','-append');
save('g16.txt', 'greenfftn16', '-ASCII','-append');
save('g17.txt', 'greenfftn17', '-ASCII','-append');
%}
input = real(voicefftn);
save('inputg5.txt', 'input', '-ASCII','-append');

disp(sel);
 
 
   
end