function output = MID (k) 

%%Defining function and variables
syms X
fun = @(X) sin(X).*exp(X-((X.^2)/4));

a = 0;
b = 2;
n = 2.^k;
h = (b-a)./n;
dx = h./2;
x = a+dx:h:b-dx;

%%Midpoint approx.
Mid = sum(fun(x)).*h;

output = Mid;

end