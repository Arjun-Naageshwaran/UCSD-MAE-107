%% Problem 3

function output = RUNGE4(f)

%%Establish syms t x
%%Running the code: RUNGE4(sin(2*t)*sqrt(x^2+1))

%%The following values depend on c2
%%C1 + C2 = 1
%%C1 * (alpha) = 1/2
%%C2 * (beta) = 1/2
%%Except in the special case where c2 = 1, c1 = 0, alpha = beta = 1/2.

c2 = 1;  %%C2 values: 1 or exp(-1/9)
c1 = 1 - c2;;  %%C1 values: 0 or 1 - c2;
A = 0.5; %%Alpha values: 0.5 OR 0.5/c1
B = 0.5;  %%Beta values: 0.5 OR 0.5/c2



%%Initial conditions and final T value
t1 = 0;
x1 = 1;
T = 4;
t(1) = t1;

%%Preallocating x and y for the graph. Since the size of the answer matrix
%%changes with n (1st is 10, then 100, then 1000, etc.) I have a 1x5 cell
%%and each answer matrix is stored in a cell.
Z = cell(1,5);
Y = cell(1,5);

fun = inline(f);

%%Outer for loop to iterate n from 10^1 to 10^5
for i = 1:5   
    n = 10^i;
    h = (T-t1)/n;
    Y{1,i} = 0:T/n:T;
    x = 1:length(Y{1,i});
    x(1) = x1;

    tic

%%Inner for loop calculates RK4 method. I used "tic" and "toc" commands
%%outside this loop to gauge how long this would take.
    for k = 1:n
         t(k+1) = t(k)+h; 
         k1 = fun(t(k), x(k));
         k2 = fun(t(k)+0.5.*h, x(k)+0.5.*h.*k1);
         k3 = fun(t(k)+0.5.*h, x(k)+0.5.*h.*k2);
         k4 = fun(t(k)+h, x(k)+h.*k3);
         x(k+1) = x(k)+(h/6).*(k1+(2.*k2)+(2.*k3)+k4);
    end
    Z{1,i}=x;

    toc
end

%%My output is the cell array of the 5 answer matrices
output = Z;

%%Graphing the approximations but looping across each of the 5 cells in the
%%preallocated cell arrays
figure(1);
hold on
for k = 1:5
    plot(Y{1,k},Z{1,k}(1:end))
end

legend('10 steps','100 steps','1000 steps','10000 steps','100000 steps = true solution')
title('Arjun N. Problem 3: approximations for c2 = 1')
xlabel('t values')
ylabel('x values')

%%calculating error 
error=[1:4];

for i = 1:4
    error(i) = abs(Z{1,end}(end)-Z{1,i}(end));
end

%%Graphing the errors
figure(2)
hold on
plot(1:4,log10(error))
legend('error')
title('Arjun N. Problem 3: errors for c2 = 1')
xlabel('log10 of step number')
ylabel('log10 of error')

end