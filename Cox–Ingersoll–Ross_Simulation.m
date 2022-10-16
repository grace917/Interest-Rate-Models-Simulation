%%%%%%%%%%%
% CIR Simulation %
%%%%%%%%%%%

a = 1;
b = 2; %Long-term mean=1 or 2
r0 = 0.001;
dt = 0.25;
sigma = 0.02;
N = 1000;

rate = zeros(N+1, 20);  %row, column
rate(1,:) = r0;
for j = 1:20
    for i = 1:N
        dr = a*(b-rate(i,j))*dt + sigma*sqrt(rate(i,j))*sqrt(dt)*randn(1); 
        rate(i+1,j) = rate(i,j) + dr;
    end
end

x = [1:1:1001];
plot(x, rate)
xlabel('Steps')
ylabel('CIR Short Term Rate')
