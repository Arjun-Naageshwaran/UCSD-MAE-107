% Solve x'(t)=sin(2t)sqrt(x^2+1) with x0=1
a=0;
T=4;
x0 = 1;                  % Initial Condition
h=(T-a)/2^2;                   % Time step
t = 0:h:2;               % t goes from 0 to 2 seconds.
xstar = zeros(size(t));  % Preallocate array (good coding practice)

xstar(1) = x0;           % Initial condition gives solution at t=0.

for i=1:(length(t)-1)
  k1 = -2*xstar(i)              % Approx for y gives approx for deriv
  y1 = xstar(i)+k1*h/2          % Intermediate value
  k2 = -2*y1                    % Approx deriv at intermediate value.
  xstar(i+1) = xstar(i) + k2*h  % Approximate solution at next value of y
end

xstar