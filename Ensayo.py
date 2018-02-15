#En cmd se ejecuta con los siguientes comandos
#py -3.1 "C:\Users\juanz\Google Drive\Semestre 6\Laboratorio Electronica Digital\ProyectoTurnero\Ensayo.py"
import sys
import time
import serial

PuertoAbiertos = []
PosicionTurnero = 0

try:
	COM1 = serial.Serial(
	    port='COM1',
	    baudrate=9600,
	    timeout=1,
	    parity=serial.PARITY_EVEN,
	    stopbits=serial.STOPBITS_TWO,
	    bytesize=serial.EIGHTBITS
	)
	PuertoAbiertos.append(COM1)
	ContadorTurnosAsignadosCOM1 = 0
	TurnosCOM1 = []
except:
	print("Puerto COM1 esta cerrado")

try:
	COM2 = serial.Serial(
	    port='COM2',
	    baudrate=9600,
	    timeout=1,
	    parity=serial.PARITY_EVEN,
	    stopbits=serial.STOPBITS_TWO,
	    bytesize=serial.EIGHTBITS
	)
	PuertoAbiertos.append(COM2)
	ContadorTurnosAsignadosCOM2 = 0
	TurnosCOM2 = []
except:
	print("Puerto COM2 esta cerrado")

try:
	COM3 = serial.Serial(
	    port='COM3',
	    baudrate=9600,
	    timeout=1,
	    parity=serial.PARITY_EVEN,
	    stopbits=serial.STOPBITS_TWO,
	    bytesize=serial.EIGHTBITS
	)
	PuertoAbiertos.append(COM3)
	ContadorTurnosAsignadosCOM3 = 0
	TurnosCOM3 = []
except:
	print("Puerto COM3 esta cerrado")

try:
	COM4 = serial.Serial(
	    port='COM4',
	    baudrate=9600,
	    timeout=1,
	    parity=serial.PARITY_EVEN,
	    stopbits=serial.STOPBITS_TWO,
	    bytesize=serial.EIGHTBITS
	)
	PuertoAbiertos.append(COM4)
	ContadorTurnosAsignadosCOM4 = 0
	TurnosCOM4 = []
except:
	print("Puerto COM4 esta cerrado")

def Estado(value):
    if value == b"00100000":
    	COM1.write(b"%d" %PosicionTurnero)
    	if PosicionTurnero == 99:
    		PosicionTurnero = 0
    	else:
    		PosicionTurnero += 1
    	if ContadorTurnosAsignadosCOM1 > 4:
    		ContadorTurnosAsignadosCOM1 = 0
    		TurnosCOM1[ContadorTurnosAsignadosCOM1] = PosicionTurnero
    	else:
    		TurnosCOM1[ContadorTurnosAsignadosCOM1] = PosicionTurnero
    		ContadorTurnosAsignadosCOM1 += 1
    elif value == b"00010000":
    	COM1.write(b"%d" %TurnosCOM1[ContadorTurnosAsignadosCOM1])

linecounter=0
bytecounter=0
bytesperline = 8
while True:
    bytesToRead = COM1.inWaiting()
    if bytesToRead>0:
        value=COM1.read(8)
        print(value)
        


