%%This function does computation for the script of Problem 4
function [x_out, t_out] = RUNGE2_P(n)

%%Defining variables
c2 = 1;
c1 = 1-c2;
A = 0.5;
B = 0.5;
t1 = 0;
t(1) = t1;
x1 = 0;
x(1) = x1;
T = 4;
h = (T-t1)/n;

%%Preallocating the t and x for the graph
x_out = zeros(1,n+1);
x_out(1) = x1;
t_out = [t1:h:T];

%%Defining the piecewise function(s)
fun1 = @(t,x) 0.5*sqrt(x^2+1);
fun2 = @(t,x) 0.5-x;

%%for loop to iterate from 1 to n
for i = 1:n
    %%If statements establish which functions are used for which t values
    %%Fun1 used for t<=1
    if t_out(i) <= 1
        f1 = fun1(t_out(i), x_out(i));
        f2 = fun1(t_out(i)+0.5*h, x_out(i)+0.5*h*f1);
        x_out(i+1) = x_out(i)+(h.*c1.*f1)+(h.*c2.*f2);
    %%Fun2 used for t>1
    else
        f1 = fun2(t_out(i), x_out(i));
        f2 = fun2(t_out(i)+0.5*h, x_out(i)+0.5*h*f1);
        x_out(i+1) = x_out(i)+(h.*c1.*f1)+(h.*c2.*f2);
    end
end
end
