clear all;

% The frequencies were found to be 1000 Hz, 4000 Hz and 6000 Hz,
% with amplitudes 0.4, 0.2 and 0.2 respectively

f1 = 1000;
f2 = 4000;
f3 = 6000;

A1 = 0.4;
A2 = 0.2;
A3 = 0.2;

L = 160000; % Original audio being read in had 160000 samples
Fs = 16000; % Audio was sampled at 16kHz in previous step
T = 1/Fs;
t = (0:L-1)*T; % Time vector

% When Y(f1,f2,f3) are plotted on a complex plane, it can be noted that
% there is no real component and only a negative imaginary component.
% This means that there is a -90 degrees (-pi/2) phase shift

phase1 = -pi/2;
phase2 = -pi/2;
phase3 = -pi/2;

sinusoid1 = A1*cos(2*pi*f1*t+phase1);
sinusoid2 = A2*cos(2*pi*f2*t+phase2);
sinusoid3 = A3*cos(2*pi*f3*t+phase3);

final_wave = sinusoid1+sinusoid2+sinusoid3;

t_plot = 0.005; % 5 milliseconds
num_of_samples = t_plot/T; % number of samples in 5 msec

% Plotting the first 5 msec of the signal
plot(t(1:num_of_samples),final_wave(1:num_of_samples));
title('Plot of Recreated Signal');
xlabel('time (seconds)');
grid('minor');