% Tema 2 - SP - Botezatu Georgiana-Elena - numarul 4.

P=40; % perioada semnalului
D=4; 
N=25;  %Nr de coeficienti ai seriei Fourier
F=1/P; %Frecventa semnalului
t=0:0.002:4*P-0.002; %Esantionarea semnalului
w0=2*pi*F; 
x=0.5+0.5*sawtooth(2*pi*t/P,4/40); 
%Determinarea coeficientilor.
for k = -N:N %Constanta dupa care se realizeaza suma
    xf = x; 
    X(k+26) = trapz(t,xf); 
end
%Reconstruirea semnalului dat
x_sgnnou(1:length(t)) = 0;%Semnalul nou
for i = 1:length(t);
for k = -N:N
x_sgnnou(i) = x_sgnnou(i) + 1/4*(1/P)*X(k+N+1)*exp(j*k*w0*t(i));
end
end 

figure(1);
plot(t,x); 
title('x(t) si armonicile semnalului esantionat');
hold on 
plot(t,x_sgnnou,'r:'); 
xlabel('Timp (s)');
ylabel('Amplitudine');

Fr = -N*F:F:N*F; 
figure(2); 
stem(Fr,abs(X)); 
title('Spectrul lui x(t)');
xlabel('Frecventa (Hz)'); 
ylabel('|X|'); 
