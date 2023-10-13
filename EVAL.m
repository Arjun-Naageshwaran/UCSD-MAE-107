function output = EVAL(x)

%%Evaluating the function at a given x values
syms X
f = @(X) sin(X).*exp(x-((x.^2)/4));
output = f(x);

end

