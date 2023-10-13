function y = g1(x,i)
% x = vector of x's
% i = identify which element to evaluate
% y = g(x)
% Used for Example 6.1

switch i
    case 1
        y = (10-x(1).^2)./x(2);
    case 2
        y = 57-3.*x(1).*x(2).^2;
    otherwise
        y = [(10-x(1).^2)./x(2); 57-3.*x(1).*x(2).^2];
end

