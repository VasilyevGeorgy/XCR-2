function [] = fir_2 ()

    ord = 100;
    fs = 8192; %sampling freq
    fN = fs/2; %Nyquist freq
    f1 = 350; %first freq
    f2 = 450; %sec freq
    fn1 = f1/fN;
    fn2 = f2/fN;
    %fr1 = fir1(ord,[fn1 fn2]); %band = [fn1 fn2];
    fn3 = 1000/fN; %1000 for u
    fn4 = 1100/fN; %1100 for u
    %fn5 = 2000/fN; %2000 for u
    %fn6 = 2100/fN; %2100 for u
    fr2 = fir1(ord,[fn1 fn2 fn3 fn4]);
    %dlmwrite('blue3.txt',bM);
    %type('blue3.txt')
    [y,fs] = audioread('i1.wav');
    sn = (y-min(y))/(max(y)-min(y));
    min(y)
    max(y)
    %sound(y,fs);
    r1 = filter(fr2,1,sn);
    %r2 = filter(fr2,1,r1);
    fvtool(r1,1);  
    plot(sn);
    %subplot(2,1,1);
    %plot(y);
    %subplot(2,1,2);
    %plot(r1);
    
end