fun1 = @(y1,y2) y2;
fun2 = @(y1,y2) -1/(1+y1^2)-1/sqrt(0.1+y1^2);

x = [2,2.5];
y1(1) = x(1);
y2(1) = x(2);
T = 2;
n = 2^7;
h = T/n;
eps = 10^-4;

x_out1 = zeros(2,n);
x_out2 = zeros(2,n);
t_out = [0:h:T];

for i=2:n
    [x_out1,t_out] = RUNGE4_V(n,x);
    [x_out2,t_out] = RUNGE4_V(n,x);
    x_out1(i+1) = x_out1(i) - fun1(x_out1(i),t_out(i))*((x_out1(i)-x_out1(i-1))/(fun1(x_out1(i),t_out(i))-fun1(x_out1(i+1),t_out(i+1))));
    x_out2(i+1) = x_out2(i) - fun2(x_out2(i),t_out(i))*((x_out2(i)-x_out2(i-1))/(fun2(x_out2(i),t_out(i))-fun2(x_out2(i+1),t_out(i+1))));
    y1(1) = x_out1(i+1);
    y2(1) = x_out2(i+1);
    
    if abs(fun1(x_out1(i+1),t_out(i+1)))<eps       
        output = y1(1);
        break;
    end

    if abs(fun2(x_out2(i+1),t_out(i+1)))<eps       
        output = y2(1);
        break;
    end
end

y1(1)
y2(1)
