clear all;

% Read in the signal from the audio file
[signal, Fs] = audioread("SecretMessage2023.wav");
T = 1/Fs; % Sampling period; 1/(sampling frequency)
L = length(signal); % Number of points in 'signal'
t = [0:L-1] * T; % Time vector

symbol_period = 1; % message is encoded in 1-second duration symbol periods
symbol_sample = symbol_period/T; % number of samples in 1 second

for i = 0:75
    j = i+1;

    % i and j determine which symbol period to perform DFT
    Y = fft(signal(symbol_sample*i+1:symbol_sample*j)); % perform DFT
    
    % multiply magnitude of the output of DFT by 2/L to get the peak amplitude
    A = abs(Y)*2/symbol_sample;  
    
    % '(0:L-1)' is cycles per L points; converts to cycles per second
    f = (0:symbol_sample-1)*Fs/symbol_sample; 
    
    %plotting all 76 symbol periods
    subplot(13,6,i+1)
    plot(f(1:ceil(symbol_sample/2)),A(1:ceil(symbol_sample/2))); 
    axis([0 Fs/2 0 0.1])
    grid('minor');
end
