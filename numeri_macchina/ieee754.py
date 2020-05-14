import struct
import sys


def binary(num):
    if sys.version_info.major == 3:
        bn = ''.join(bin(c).replace('0b', '').rjust(8, '0') for c in struct.pack('!f', num))
    else:
        bn = ''.join(bin(ord(c)).replace('0b', '').rjust(8, '0') for c in struct.pack('!f', num))
    return {'segno': bn[0], 'esponente': bn[1:9], 'mantissa': bn[9:]}


def increase_list(l, x, up_bound, delta):
    while(x < up_bound):
        #l.append({'x': x, 'fl(x)': binary(x)})
        l.append(x)
        x += delta


ll = []
#increase_list(ll, 0, 1, 0.2)
#increase_list(ll, 1, 100, 3)
#increase_list(ll, 100, 1000, 200)
#increase_list(ll, 1000, 10000, 3000)
ll = [0.5, 1.0, 125.0]
with open('num.txt', 'w') as fn:
    for l in ll:
        bn = binary(l)
        tmp_s = '{0} \t {1} {2} {3} \n'.format(l, bn['segno'], bn['esponente'], bn['mantissa'])
        fn.write(tmp_s)