%% Problem 2

%%Defining variables
x(1) = 0;
n = 4;
dt = 2/n;
t = 0:dt:2;
x_bar = 4 - 4*exp(-2);
x(1) = 0;

%%Solving the ODE
for i = 1:n
    x(i + 1) = x(i) + dt*(4 - x(i));
end

hold on
plot(t, x)

%%Euler's approx. 
for j = 1:6
    n = 10^j;
    dt = 2/n;
    dd(j) = dt
    t = 0:dt:2;
    x(1) = 0;

    for i = 1:n
        x(i + 1) = x(i) + dt*(4 - x(i));
    end
    
    y(j) = abs(x_bar - x(n + 1))
    plot(t, x)
end

%%Plotting log of errors for n values
x = 4 - 4.*exp(-t);
plot(t, x);
legend("n=4", "n=10", "n=100", "n=1000", "n=10000", "n=100000","1000000", "true")
hold off
dd = log10(dd);
plot(dd, log10(y))

%%_________________________________________________________________________

%% Problem 3

%%Defining variables
n = 10^6;
dt = 10/n;
tt = 0:dt:10;
x(1) = pi/3;

%%Solving the ODE
for i = 1:n
    t = (i - 1)*dt;
    x(i + 1) = x(i) + dt*(1 + cos(t))*0.5*sin(2*atan(x(i)));
end

x_bar = x(n + 1)
hold on
plot(tt, x)

%%Euler's approx. 
for j = 1:5
    x = 0;
    n = 10^j;
    dt = 10/n;
    dd(j) = dt
    tt = 0:dt:10;
    x(1) = pi/3;
 
    for i = 1:n
        t = (i - 1)*dt;
        x(i + 1) = x(i) + dt*(1 + cos(t))*0.5*sin(2*atan(x(i)));
    end
 
    y(j) = abs(x_bar - x(n + 1));
    plot(tt, x)
end

%%Plotting log of errors for n values
legend("n=1000000", "n=10", "n=100", "n=1000", "n=10000", "n=100000")
hold off
dd = log10(dd);
plot(dd, log10(y))

%%_________________________________________________________________________


