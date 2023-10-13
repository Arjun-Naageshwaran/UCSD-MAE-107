function output = LEFT (a,b) 

syms X
LE = zeros(1,11);

%%Approximation loop for the 5 n values
for k = 1:11
    n = 2^k;
    h = (b-a)/n;
    x = a:h:b; 
    LE(k) = sum(sin(x))*h;
end

output = int(sin(X), a, b);

end