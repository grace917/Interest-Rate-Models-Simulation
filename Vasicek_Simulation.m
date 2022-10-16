%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Vasicek Simulation: Long-term mean=1 or 2, contain in 2 different sheet(p), each sheet with 20 series, each with 1000 forward steps, all with initial rate 0.001%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a = 1;
b = [2 1]; %Long-term mean=1 or 2
r0 = 0.001;
dt = 0.25;
sigma = 0.02;
N = 1000;

rate = zeros(N+1, 20, 2);  %row, column, sheet
%rate = zeros(N+1,20);
rate(1,:,:) = 0.001;
for p = 1:2
    for j = 1:20
        for i = 1:N
            dr = a*(b(p)-rate(i,j,p))*dt + sigma*sqrt(dt)*randn(1); %randn(5,1) 5-1 matrix Normally distributed random numbers
            rate(i+1,j,p) = rate(i,j,p) + dr;
        end
    end
end

x = [1:1:1001];
p = 2; % p = 1
plot(x, rate(:,:,p))
xlabel('Steps')
ylabel('Vasicek Short Term Rate')
