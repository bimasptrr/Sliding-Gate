% ==========================================================
% KODE PARAMETER LENGKAP: SMART SLIDING GATE
% ==========================================================
clear; clc;

% 1. Data Fisik Motor & Pagar
R = 2.0;    % Hambatan Jangkar (Ohm)
L = 0.5;    % Induktansi Jangkar (Henry)
Km = 0.1;   % Konstanta Torsi (Nm/A)
Kb = 0.1;   % Konstanta Back-EMF (V/rad/s)
J = 0.02;   % Inersia total (kg.m^2)
b = 0.2;    % Koefisien gesek (Nms)
r = 0.02;   % Radius pinion/gir (2 cm)

% 2. Pembentukan Transfer Function (Posisi)
% Rumus: G(s) = (Km * r) / (s * ((J*s + b)(L*s + R) + Km*Kb))
num_pos = [Km * r]; 
den_pos = [(J*L) ((J*R)+(L*b)) ((b*R)+(Km*Kb)) 0];

% Membuat objek Transfer Function untuk pengecekan
sys_tf = tf(num_pos, den_pos);

% 3. Konversi ke State-Space (Untuk Pengaturan Initial Condition)
% Digunakan agar kita bisa setting posisi awal 100 atau 0
[A, B, C, D] = tf2ss(num_pos, den_pos);

% 4. Parameter PID Tuning (Target Settling Time 4 Detik)
% Gunakan variabel ini langsung di blok PID Simulink
P_val = 2500;
I_val = 10;
D_val = 600;
N_val = 100; % Filter coefficient

% 5. Menampilkan Status di Command Window
fprintf('\n==========================================\n');
fprintf('>>> DATA SISTEM BERHASIL DIMUAT <<<\n');
fprintf('==========================================\n');
sys_tf
fprintf('------------------------------------------\n');
fprintf('Variabel num_pos, den_pos, A, B, C, D siap digunakan.\n');
fprintf('Gunakan [0; 0; 100] untuk Buka, dan [0; 0; 0] untuk Tutup.\n');
fprintf('==========================================\n');