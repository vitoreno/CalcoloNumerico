import struct
import sys
import pprint


def binary(num):
    if sys.version_info.major == 3:
        bn = ''.join(bin(c).replace('0b', '').rjust(8, '0') for c in struct.pack('!f', num))
    else:
        bn = ''.join(bin(ord(c)).replace('0b', '').rjust(8, '0') for c in struct.pack('!f', num))
    return {'segno': bn[0], 
            'esponente': bn[1:9], 
            'mantissa': bn[9:],
            'numero': num}


def get_esp_mant(num):
    esp = int(num["esponente"],2) - 2**7 + 1 + 1
    mant = 2**-1
    for e in range(len(num["mantissa"])):
        ex = -(e+2)
        if num["mantissa"][e] == '1':
            mant += 2**ex
    return (esp, mant)


def get_esp_mant2(num):
    esp = int(num["esponente"],2) - 2**7 + 1
    mant = 1
    for e in range(len(num["mantissa"])):
        if num["mantissa"][e] == '1':
            mant += 2**(-(e+1))
    return (esp, mant)


if __name__ == '__main__':
    if(len(sys.argv) < 2):
        print('Errore nella chiamata')
        print('python num_macchina_32bit.py <numero>')
        exit(1)
    
    num = binary(float(sys.argv[1]))
    esp, mant = get_esp_mant(num)
    numero_rappresentato = (-1 if num['segno'] == '1' else 1) * mant * 2**esp
    
    print('Numero:\t{0}'.format(num['numero']))
    print()
    print('Segno:\t\t' + num['segno'])
    print('Esponente:\t' + num['esponente'])
    print('Mantissa:\t' + num['mantissa'])
    print()
    print('Esponente:\t{0}'.format(esp))
    print('Mantissa:\t{0}'.format(mant))
    print()
    print('Numero rappresentato: {0}'.format(numero_rappresentato))
    print('Errore: {0}'.format(abs(num['numero']-numero_rappresentato)))