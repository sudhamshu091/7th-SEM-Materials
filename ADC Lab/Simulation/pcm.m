f=2; % freq of signal
fs=20*f; % Nyquist sampling
t=0:1/fs:1; % Time
a=2; % Amplitude
x=a*sin(2*pi*f*t); % input signal
figure;
subplot(2,2,1);
plot(t,x,'r-');
xlabel ('Time');
ylabel ('Amplitude');
title ('Input Signal');
grid on;
x1=x+a; % level shifting
subplot(2,2,2);
plot(t,x1,'k+-');
xlabel ('Time');
ylabel ('Amplitude');
title ('Level Shifted Signal');
grid on
q_op=round(x1);%quantization
subplot(2,2,3);
plot(t,q_op,'k+-');
xlabel ('Time');
ylabel ('Amplitude');
title ('Quantized Signal');
grid on;
enco=de2bi(q_op,'left-msb'); % decimal to binary
% pcm Rx
deco=bi2de(enco,'left-msb'); % binary to decimal
xr=deco-a; % level shifting back to original
subplot(2,2,4);
plot(t,xr,'k+-');
xlabel ('Time');
ylabel ('Amplitude');
title ('PCM demodulated Signal');
grid on;
