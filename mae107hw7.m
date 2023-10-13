%% Problem 4

%%Defining variables
syms f(x) x
f(x) = atan(x+(2*x^3)/3)-0.7;             %%Function f(x)
g = diff(f);                              %%Derivative of f(x)
x(1) = 1;                                 %%Initial condition
eps = 10^-6;                              %%Epsilon: the bound on the error

for n=1:1000
        x(n+1) = eval(x(n) - f(x(n))/g(x(n)));

        if (abs(f(x(n+1)))<eps)           %%Stopping condition  
            root = double(x(n+1));
            break;
        end
end

%%Answer sets
xvals = eval(x)                           %%x values from initial condition to root with n steps
yvals = eval(f(x))                        %%f(x) values from f(x(1)) to root where f(x) = 0
root

%%The function converges at x0=1, but not x0=2. The list of x and f values
%%for x0=2 is therefore too long to include.At x0=1, the function converged
%%at x=0.0.654972. I used epsilon = 10^-6 to capture enough accuracy.
%%Newton's method requires 2 FE's for each n, and 1 DE for each n. Since
%%n=3 for x0=1, there were 6 FE's and 3 DE's.

%%_________________________________________________________________________

%% Problem 5

%%Defining variables

syms f(x) x
f(x) = atan(x+(2*x^3)/3)-0.7;             %%Function f(x)
x(1) = 2;                                 %%Initial conditions
x(2) = -3;
eps = 10^-6;                              %%Epsilon: the bound on the error

for n=2:1000
        x(n+1) = eval(x(n) - f(x(n))*((x(n)-x(n-1))/(f(x(n)-f(x(n-1))))));
        
        if (abs(f(x(n+1)))<eps)           %%Stopping condition  
            root = double(x(n+1));
            break;
        end
end

%%Answer sets
xvals = eval(x)                           %%x values from initial condition to root with n steps
yvals = eval(f(x))                        %%f(x) values from f(x(1)) to root where f(x) = 0

%%The function converges at both but x0=4, x1=3 takes FAR longer. I will
%%include a screenshot of the values for x0=2, x1=-3, but there were too
%%many for x0=4, x1=3. Again, the values converged at x=0.0.654972. I used 
%%epsilon = 10^-6 to capture enough accuracy. For the Secant method, there
%%are 3 FE's for each n, and since n=14, there were 42 FEs for x0=2, x1=-3.

%%_________________________________________________________________________

%% Problem 7

%%Defining variables
g = @(x) (atan(3-x))/4;
x0 = -100;                     %%Initial condition
n = 40;                        %%Arbitrary number of steps
eps = 10^-10;                  %%Epsilon: the bound on the error

i = 1;
while i <= n                   %%Stopping condition
    p = g(x0);
    if abs(p-x0) < eps
       break;
    else
       i = i+1;
       x0 = p
    end
end

%%For g = (atan(3-x))/4, the function neatly converged at 0.3039. For the
%%other function g_hat = 3-tan(4*x), the function does not converge. It
%%simply operates for n steps. 