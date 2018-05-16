function [] = fir_1 ()

    ord = 100;
    fs = 8192; %sampling freq
    fN = fs/2; %Nyquist freq
    f1 = 500; %first freq
    f2 = 600; %sec freq
    fn1 = f1/fN;
    fn2 = f2/fN;
    %fr1 = fir1(ord,[fn1 fn2]); %band = [fn1 fn2];
    fn3 = 1200/fN;
    fn4 = 1300/fN;
    fn5 = 2000/fN;
    fn6 = 2100/fN;
    fr2 = fir1(ord,[fn1 fn2 fn3 fn4 fn5 fn6]);
    %dlmwrite('blue3.txt',bM);
    %type('blue3.txt')
    %hfvt = fvtool(fr1,1);
    [y,fs] = audioread('u1.wav');
    sound(y,fs);
    r1 = filter(fr2,1,y);
    %r2 = filter(fr2,1,r1);
    fvtool(r1,1);  
    %subplot(2,1,1);
    %plot(y);
    %subplot(2,1,2);
    %plot(r1);
    
end