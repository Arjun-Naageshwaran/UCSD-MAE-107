%%This function does computation for the script of Problem 5
function [x_out,t_out] = RUNGE4_V(n,xk)

%%Defining the vector valued functions as anonymous functions
fun1 = @(y1,y2) y2;
fun2 = @(y1,y2) -1/(1+y1^2)-1/sqrt(0.1+y1^2);

%%Defining variables
T = 2;
h = (T)/n;
x_out = zeros(2,n+1);
x_out(1,1) = xk(1);
x_out(2,1) = xk(2);
t_out = [0:h:T];

for k=1:n
    %%RK4 Estimation for function 1
    k1 = fun1(t_out(k), x_out(1,k));
    k2 = fun1(t_out(k)+0.5.*h, x_out(1,k)+0.5.*h.*k1);
    k3 = fun1(t_out(k)+0.5.*h, x_out(1,k)+0.5.*h.*k2);
    k4 = fun1(t_out(k)+h, x_out(1,k)+h.*k3);
    x_out(1,k+1) = x_out(1,k)+(h/6).*(k1+(2.*k2)+(2.*k3)+k4);

    %%RK4 Estimation for function 1
    k1 = fun2(t_out(k), x_out(2,k));
    k2 = fun2(t_out(k)+0.5.*h, x_out(2,k)+0.5.*h.*k1);
    k3 = fun2(t_out(k)+0.5.*h, x_out(2,k)+0.5.*h.*k2);
    k4 = fun2(t_out(k)+h, x_out(2,k)+h.*k3);
    x_out(2,k+1) = x_out(2,k)+(h/6).*(k1+(2.*k2)+(2.*k3)+k4);
end
end
