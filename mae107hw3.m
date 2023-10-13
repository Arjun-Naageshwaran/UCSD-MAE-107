%% Problem 2

%%Defining variables
x = pi/4; 
y = 1/(1 + x^2); 

%%Dh Approx.
for i=1:11
    h(i) = -i;
    x1 = x + 10^-i;
    x2 = x - 10^-i;
    D(i) = (atan(x1) - atan(x))/(10^-i);
    Dhat(i) = (atan(x1) - atan(x2))/(2*(10^-i));
end

%%Defining the lof of errors to easily graph
e1 = log10(abs(D - y));
e2 = log10(abs(Dhat - y));

%%Graphing log of errors
plot(h, e1, h, e2)
legend("log10(e)", "log10(e_hat)")

yl = ylim
xl = xlim

%%_________________________________________________________________________

%% Problem 3

%%Defining variables
syms x
x0 = 1;
c2 = x

%%Reinterpreting bad pseudocode
for i=1:7
    c2 = c2 - 0.4 * (1.5 + sin((c2).^2));
end

f(c2) = exp(2*c2);

j = [1:10];
h = 10.^-j;

%%Derivative Approximations
D = (f(x0+h) - f(x0))./(h);
Dhat = (f(x0+h) - f(x0-h))./(2*h);

%%_________________________________________________________________________

%% Problem 4

%%Defining variables
x = 0; 
y = (2 - 2*x^2)/(x^2 + 2); 

%%Derivative Approximations
for i=1:6
    j = i-1;
    h(i) = -j;
    x1 = x + 10^-j;
    x2 = x - 10^-j;
    D2(i) = (log(x1^2 + 2) + log(x2^2 + 2) - 2 * log(2))/(10^-(2*j));
end

%%Graphing log of error
e = log10(abs(D2 - y));
plot(h, e)
legend("log10(e)")