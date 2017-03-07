% Esempio di rappresentazione di un numero macchina
clear all
clc

% Il numero 125 in base 10 corrisponde a
% 1111101 in base 2
% La macchina deve memorizzare quindi
% 1.111101 x 2^6
%
% Il primo 1 a sinistra del . è implicito
% La mantissa vale 111101
% L'esponente 6 va opportunamente scalato applicando l'offset di 1023
% 6 + 1023 = 1029 => 10000000101
x = 125

fid = fopen('binfile.bin','wb');
fwrite(fid, x, 'double', 'ieee-be');
fclose(fid);

fid = fopen('binfile.bin','rb');
v = [];
while ~feof(fid)
    v = [v;fread(fid, 1, 'uint8')];
end
fclose(fid);

bin_str = [];
for i=1:numel(v)
    bin_str = [bin_str, dec2bin(v(i), 8)];
end

segno = bin_str(1)
esponente = bin_str(2:12)
mantissa = bin_str(13:end)