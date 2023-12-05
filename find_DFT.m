clear all;

% Read in the signal from the audio file
[signal, Fs] = audioread("tones2023.wav");
T = 1/Fs; % Sampling period; 1/(sampling frequency)
L = length(signal); % Number of points in 'signal'
t = [0:L-1] * T; % Time vector

Y = fft(signal); % perform DFT

% multiply magnitude of the output of DFT by 2/L to get the peak amplitude
A = abs(Y)*2/L;  

% '(0:L-1)' is cycles per frame; converts to cycles per second
f = (0:L-1)*Fs/L; 

f_double_sided = (-L/2:ceil(L/2)-1)*Fs/L;

% plotting the two-sided frequency spectrum (including the negative
% frequencies)
% fftshift shifts points between ceil(L/2)+1 and L to the negative side
plot(f_double_sided,fftshift(A)); 
title('Two-Sided Magnitude Spectrum');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
axis([-Fs/2 Fs/2 0 0.5])
grid('minor');

figure()

% plotting only the positive frequencies; the use of '(1:ceil(L/2))' 
% below assures that code will work with even or odd number of samples
plot(f(1:ceil(L/2)),A(1:ceil(L/2))); 
title('Single-Sided Magnitude Spectrum');
ylabel('Amplitude');
xlabel('Frequency (Hz)');
axis([0 Fs/2 0 0.5])
grid('minor');
