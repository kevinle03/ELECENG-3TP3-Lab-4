clear all;

% Read in the signal from the audio file
[signal, Fs] = audioread("SecretMessage2023.wav");
T = 1/Fs; % Sampling period; 1/(sampling frequency)
L = length(signal); % Number of points in 'signal'
t = [0:L-1] * T; % Time vector

Y = fft(signal); % perform DFT

% multiply magnitude of the output of DFT by 2/L to get the peak amplitude
A = abs(Y)*2/L;  

% '(0:L-1)' is cycles per L points; converts to cycles per second
f = (0:L-1)*Fs/L; 

% plotting only the positive frequencies;
plot(f(1:ceil(L/2)),A(1:ceil(L/2)));
title('Single-Sided Magnitude Spectrum');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
axis([0 Fs/2 0 0.1])
grid('minor');