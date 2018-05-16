function [] = fir ()

    ord = 100;
    fs = 8192; %sampling freq
    fN = fs/2; %Nyquist freq
    f1 = 700; %first freq
    f2 = 800; %sec freq
    fn1 = f1/fN;
    fn2 = f2/fN;
    bnd = [fn1 fn2];
    bM = fir1(ord,bnd);
    %dlmwrite('blue3.txt',bM);
    %type('blue3.txt')
    %fid = fopen('r1.txt', 'wb');
    %fwrite(fid, bM, 'double');
    %fclose(fid);
    hfvt = fvtool(bM,1);
    
end