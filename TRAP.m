function output = TRAP (k) 

%%%Defining function and variables
syms X
fun = @(X) sin(X).*exp(X-((X.^2)/4));

a = 0;
b = 2;
n = 2.^k;
h = (b-a)./n;
x = a:h:b;

%%Trapezoid approx.
TR = h.*(sum(fun(x))-((fun(a)+fun(b))/2));

output = TR;

end