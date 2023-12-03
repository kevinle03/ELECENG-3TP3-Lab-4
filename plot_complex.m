clear all;

% Read in the signal from the audio file
[signal, Fs] = audioread("tones2023.wav");
T = 1/Fs; % Sampling period; 1/(sampling frequency)
L = length(signal); % Number of points in 'signal'
t = [0:L-1] * T; % Time vector

Y = fft(signal); % perform DFT

% Plotting Y on a complex plane; x-axis is real, y-axis is imaginary
plot(real(Y(1:1+ceil((L-1)/2))),imag(Y(1:1+ceil((L-1)/2))),"o");
axis equal
grid on
xlabel("Re(z)")
ylabel("Im(z)")