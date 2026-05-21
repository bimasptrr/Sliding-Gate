### Parameter Sistem Smart Sliding Gate (Linear)

Berikut adalah kode MATLAB untuk memuat matriks State-Space dan parameter tuning PID:

```matlab
% Parameter Fisik (Radius 2 cm)
R = 2.0; L = 0.5; Km = 0.1; Kb = 0.1; J = 0.02; b = 0.2; r = 0.02;
num_pos = [Km * r];
den_pos = [(J*L) ((J*R)+(L*b)) ((b*R)+(Km*Kb)) 0];

% Konversi ke State-Space
[A, B, C, D] = tf2ss(num_pos, den_pos);

% Parameter PID Controller
P_val = 200;
I_val = 0;
D_val = 8;
