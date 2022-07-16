m = 1000;
b = 50;
r = 10;

s = tf('s');
Plant_TF = 1 / (m * s + b);

Kp = 1000;
Controller = pid(Kp);

TF_ClosedLoop = feedback(Controller * Plant_TF, 1);

t = 0:0.1:20;
step(r * TF_ClosedLoop, t);
axis([o 25 0 10]);