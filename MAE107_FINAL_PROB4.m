%% Problem 4
%%I wrote this problem as a script rather than a function, but it calls the
%%RUNGE2_P function for the curve estimation
%%Establishing variables
n = [2,4,8,16,32,64,128,256,512,1024,2048];
x_out1 = cell(1,length(n));
t_out1 = cell(1, length(n));
t = 0;
x = 0;
T = 4;

%Filling the empty x and t matrices with values from the external function
for i = 1:length(n)
    tic
    [x_out1{i},t_out1{i}] = RUNGE2_P(n(i));
    toc
end

%%Plotting the approximation curves
figure(1)
hold on
for i = 1:length(x_out1)
    plot(t_out1{i},x_out1{i});
end
legend('n=2^1','n=2^2','n=2^3','n=2^4','n=2^5','n=2^6','n=2^7','n=2^8','n=2^9','n=2^10','n=2^11')
title('Arjun N. Problem 4: approximations of piecewise function for c2 = 1')
xlabel('t values')
ylabel('x values')

%%"True estimation" is RK2 at n=10^12
EST1 = RUNGE2_P(4096);
error1 = zeros(1,length(n));

%Solving for error
figure(2)
hold on
for i = 1:length(x_out1)
    error1(i) = abs(EST1(end)-x_out1{i}(end));
end

%Plotting log of errors against log of step size
plot(log10(n),log10(error1));
hold off
title('Arjun N. Problem 4: log of error and step size for c2 = 1')
legend('error')
xlabel('log10(step size)')
ylabel('log10(error)')