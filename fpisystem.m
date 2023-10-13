function xr = fpisystem(g,x0)
% Function to demonstrate the fixed-point iteration for a system of
% nonlinear equations
%
% g is another .m file that calculates the functions in the form x = g(x)
% x0 is a vector of initial guess
% xr is a vector containing the solution
%
% Syntax: xr = fpisystem(@g,x0)

% Initialize values
es = 0.0001;
maxit = 100;

count = 0;
er = 1;
xi = x0;
n = length(x0);

% main loop
while (abs(er)>es && count<maxit)
    count = count+1;    % increment the counter
    xold = xi;          % keep the old estimate
    for i=1:n
        xi(i)=g(xi,i);  % update the estimate. Loops through x to use the most recent value of xi
    end
    er = norm(xi-xold)/norm(xi);    % approximate relative error
    fprintf('%3g %10.6g %10.6g %10.4g\n',count, xi(1), xi(2), er);
end

% display results
if count >= maxit
    disp(' ')       % Check if maximum iterations were reached
    disp(['Failed to converge in ',num2str(maxit),' iterations'])
    disp(' ')
    disp('--------------------------------------------')
    disp(' ')
    xr = NaN;
else
    disp(' ')       % display the value of the solution
    disp(['Solution has been found in ',num2str(count),' iterations.'])
    fprintf('\n      x1         x2\n')
    fprintf('%10.4f %10.4f\n',xi(1), xi(2));
    disp(' ')
    disp('--------------------------------------------')
    disp(' ')
    xr = xi;        % return the value of the root
end


