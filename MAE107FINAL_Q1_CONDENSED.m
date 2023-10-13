%% Problem 1

%%I wrote this problem as a script rather than a function, but it calls the
%%various other functions for the integral approximations
%%Establish variables and the function
a = 0;
b = 2;
fun = @(X) sin(X).*exp(X-((X.^2)/4));

%%Pre-allocate space for the various approximations from 1:11
LE = 1:11;
TR = 1:11;
TRC = 1:11;
M = 1:11;

%%The for loop which calls the functions for the various approximations and
%%puts the values in the preallocation matrices
for k = 1:11
    LE(k) = LEFT(k);
    TR(k) = TRAP(k);
    M(k) = MID(k);
    TRC(k) = TRAPC(k);
end

%%Calculating error for each method using the corrected trapezoid
%%approximation at n=10^12 as the "correct" colution
N = 2^12;
h = (b-a)/N;
x = a:h:b;
I = TRAPC(12);
e_LE = abs(LE - I);
e_TR = abs(TR - I);
e_M = abs(M - I);
e_TRC = abs(TRC -I);

%%Plotting the log of stepz sizes and errors against each other
k = 1:11;
n = 2.^k;
figure(1);
hold on;
plot(log10(n), log10(e_LE));
plot(log10(n), log10(e_TR));
plot(log10(n), log10(e_M));
plot (log10(n), log10(e_TRC));
title('Arjun N. Problem 1: log of errors and step size')
legend('Left endpoint error', 'Trapezoidal error', 'Midpoint error', 'Corrected Trapezoid Method')
xlabel('log10(step number)')
ylabel('log10(error)')