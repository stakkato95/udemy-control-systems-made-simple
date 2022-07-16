Batt = readmatrix('UDDS_50.csv');
T = Batt(:,1);
I = Batt(:,2);
I = -I;

% constants
R = 0.1;
K0 = 3;
K1 = 0.01;
K2 = 0.01;
K3 = 0.01;
K4 = 0.01;

Cn = 5.4 * 3600; % battery capacity 5.4 Amp/h
DeltaT = 0.1;
SOC = 0.9; % 90% charge at the beginning

SOC_vector = [];
V_vector = [];

for k = 1:length(I)
    V = K0 - R * I(k) - K1 / SOC - K2 * SOC + K3 * log(SOC) + K4 * log(1 - SOC);
    SOC = SOC - DeltaT / Cn * I(k);
    
    SOC_vector = [SOC_vector SOC];
    V_vector = [V_vector V];
end

plot(SOC_vector);
figure;
plot(V_vector);