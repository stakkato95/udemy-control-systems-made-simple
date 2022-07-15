Data = xlsread('Battery_Parameters.xlsx');
SOC = Data(:,1);
OCV = Data(:,2);
R_Charge = Data(:,3);
R_Discharge = Data(:,4);

plot(SOC, OCV);
xlabel('SOC %');
ylabel('OCV');
figure;

plot(SOC, R_Charge);
hold on;
plot(SOC, R_Discharge);
legend('RCharge', 'RDischarge');