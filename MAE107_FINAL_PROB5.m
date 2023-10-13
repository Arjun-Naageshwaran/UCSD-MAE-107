%% Problem 5
%%I wrote this problem as a script rather than a function, but it calls the
%%RUNGE4_V function for the curve estimation

%%Establishing variables
%%I used guess and check for the value of n to create the right curve
n = 2^7;

%%Preallocating the t and x values for graphing purposes
x_out1 = zeros(2,n);
t_out1 = cell(1,n);
t = 0;
x = [1,2];
T=2;

%%Calling the RK4 function to estimate the curve
[x_out1,t_out1] = RUNGE4_V(n,x);

%%The "true" solution is the next highest step size, in this case 2^8
EST1 = RUNGE4_V(2*n,x);

%%Computing error
diff = abs(EST1(:,end)-x_out1(:,end));
error = sqrt(sum(diff.^2));

%%Plotting using the qualifying epsilon error size of 10^-8
if error <= 10^-8
    fprintf('error less than 10^-8')
    figure(1)
    hold on
    plot(x_out1(1,:),x_out1(2,:));
    legend ('n = 10^7')
    title('Arjun N. Problem 5: approximations of vector-valued function')
    xlabel('t values')
    ylabel('x values')
end
