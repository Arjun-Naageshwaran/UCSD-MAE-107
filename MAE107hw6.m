%%Problem 1

%%Left-Endpoint Approx & Trapezoidal Approx

%%Start and end points
syms X
a=0;
b=pi/3;

%%Size of trapezoidal and left hand approximation matrices
tr = 1:5;
LE = zeros(1,5);

%%Approximation loop for the 5 n values
for k = 1:5
    n = 10^k;
    h = (b-a)/n;
    x = a:h:b; %%Step number normally notated as k, but k is used for another thing in this problem
    LE(k) = sum(tan(x))*h; %%Left endpoint approx
    tr(k) = (sum(tan(x))-(tan(a)+tan(b))/2)*h;
end

I = int(tan(X), 0, pi/3);
e_LE = abs(LE-I);
e_tr = abs(tr-I);

%Plotting errors
n = [10, 100, 1000, 10000, 100000];
figure(1);
hold on;
plot(log10(n), log10(e_LE));
plot(log10(n), log10(e_tr));
legend('Left endpoint error', 'Trapezoidal error')
xlabel('log10(step number)')
ylabel('log10(error)')

%%_________________________________________________________________________

%%Problem 3
d = [20 3 2 3 -11/3];
u = [4 6 3/2 1];
l = [-10 10/9 1 -2];
b = [1; 2; 1; 2; 3];

%%Organizes data from initial matrix
for n = 1:length(d)-1
    d(n+1) = d(n+1)-u(n)*l(n)/d(n);
    b(n+1) = b(n+1)-b(n)*l(n)/d(n);
end

A = diag(d);

%%Reorganizes data into solution set
for n = 1:length(u)
    A(n,n+1) = u(n);
end

X = A./b;
Answer = A*X-b

%%_________________________________________________________________________

%%Problem 5

a = 0;
b = 1;


for k = 1:4
    n = [4,8,16,32];
    y = zeros(1,length(k));
    V = ones(1,n(k)+1);
    h = (b-a)/n(k);

    g = -2/h^2;
    z = 1-2*g;

    M = diag(V*z);
    
    %%Generates the values for the tri-diagonal system
    for l = 1:n(k)
        M(l,l+1) = g;
        M(l+1,l) = g;
    end

    B{k} = M;
    x = a:h:b;
    y = 21*cos(2*pi*x);
    
    %%Plots the approximations for step sizes 4, 8, 16, and 32 respectively
    e = B{k}\y.';
    figure(2);
    hold on;
    plot(x,e)
    legend('4 steps', '8 steps', '16 steps', '32 steps')
    ylabel('error')
    xlabel('x')
end
