function [t,x] = Euler(h, t0, x0, interval_length, func)
nsteps = floor(interval_length/h) + 1;
t = zeros(nsteps,1);
x = zeros(nsteps,1);
t(1) = t0;
x(1) = x0;
for i=2:nsteps
    x(i) = x(i-1) + h* func(t(i-1), x(i-1));
    t(i) = t(i-1) + h;
end