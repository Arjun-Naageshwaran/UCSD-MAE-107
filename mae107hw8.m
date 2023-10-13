clear all
close all
clc

%% Problem 1
%%Writing the function

function G = fixedpoint(X)

G(1,1) = exp((-X(1,1)^2)/4)+1/4*atan(X(2,1)-X(1,1));
G(2,1) = 1/5*(sin(X(1,1))+cos(X(2,1)-pi/4))-1/2;

end

%%I pasted my function here to condense all the code onto one page. This
%%would obviously be in a different m file when running it 

%%Defining variables
syms x1 x2
n = 2;              %%Number of steps
X = cell(1,n)       %%indexing X

for ifp = 1:n
    X{1} = [10:10]                       %%Initial values
    X{ifp+1} = fixedpoint(X{ifp})        %%Running the function
    e = abs(X{end-1} - X{end})           %%Error

    if e > [0.001;0.001]
        n = n+1
    else
        return
    end
end