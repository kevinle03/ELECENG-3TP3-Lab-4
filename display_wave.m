clear all;

% Read in the signal from the audio file
[signal, Fs] = audioread("tones2023.wav");
T = 1/Fs; % Sampling period; 1/(sampling frequency)
L = length(signal); % Number of points in 'signal'
t = [0:L-1] * T; % Time vector

t_plot = 0.005; % 5 milliseconds
num_of_samples = t_plot/T; % number of samples in 5 msec

% Plotting the first 5 msec of the signal
plot(t(1:num_of_samples), signal(1:num_of_samples)); 
title('Plot of Input Signal');
xlabel('time (seconds)');
grid('minor');