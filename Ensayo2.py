#En cmd se ejecuta con los siguientes comandos
#py -3.1 "C:\Users\juanz\Google Drive\Semestre 6\Laboratorio Electronica Digital\ProyectoTurnero\Ensayo2.py"

import serial
import time
#Can be Downloaded from this Link
#https://pypi.python.org/pypi/pyserial

COM5 = serial.Serial(
    port='COM5',
    baudrate=9600,
    timeout=0,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS
)

while 1:
    print(COM5.inWaiting())
    str1 = input(">> COM")
    if COM5.inWaiting() > 7:
        dato = COM5.read(8)
        for x in dato:
            print("-", x, end="")
        print("---|")
    if str1 == '5':
        dato0 = bytearray(8)
        dato0 = [1, 1, 1, 1, 1, 1, 1, 1]
        if (dato0 == [1, 1, 1, 1, 1, 1, 1, 1]):
            print ("algo")
        COM5.write(dato0)


#Ctrl+C to Close Python Window