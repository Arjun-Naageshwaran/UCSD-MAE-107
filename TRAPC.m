function output = TRAPC (k) 

%%Defining function and variables
syms X
fun = @(X) sin(X).*exp(X-((X.^2)/4));

a = 0;
b = 2;
n = 2.^k;
h = (b-a)./n;
x = a:h:b;

%%Corrected trapezoid approx.
TRC = TRAP(k) - h./24.*(3.*fun(a)-4.*fun(a+h)+fun(a+2.*h)+3.*fun(b)-4.*fun(b-h)+fun(b-h.*2));

output = TRC;

end