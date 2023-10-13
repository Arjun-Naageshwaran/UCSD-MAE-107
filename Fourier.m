freq = 1; % Sawtooth frequency 1Hz
T = 5*freq; % Generate 5 periods of the function
fs = 1000; % Sampling Rate

t = 0:1/fs:T-1/fs;
x = sawtooth(2*pi*freq*t);
plot(t,x)

%Answer:

%Define "freq", "T", "fs", and "t" the same way as in the sawtooth function

freq = 1; % Sawtooth frequency 1Hz
T = 5*freq; % Generate 5 periods of the function
fs = 1000; % Sampling Rate
t = 0:1/fs:T-1/fs;

output = 0;
n=5;

%Create a for loop for 1 to n (i.e. the number of harmonics)

for i=1:n
    output = output+(1/i)*sin((i*pi*t)/0.5);
end 

%(1/i)*sin((i*pi*t)/0.5) is the Fourier transformation inside the Summation

output = 0.5-(1/pi)*(output) ;

%0.5-(1/pi)*(output) is the linear transformation of the series outside the
%summation

hold on
plot(t, output)
hold off
grid on