#En cmd se ejecuta con los siguientes comandos
#py -3.1 "C:\Users\juanz\Google Drive\Semestre 6\Laboratorio Electronica Digital\ProyectoTurnero\Clases.py"

import sys
import time
import serial
import pygame

#--------------------------------------------------------------
#---- Inicia --- ClassTurnosDisponibles -----------------------
class ClassTurnosDisponibles():
    """docstring for TurnosDisponibles
    Esta Clase va a administrar los turnos que se van a utilizar
    en el proyecto, tiene capacidad para 
    """
    ContadorTurnos = 0
    LimiteTurnos = 0
    def __init__(self):
        self.ListaTurnosDisponibles = []

    def UtilizarTurno(self):
        if ContadorTurnos < LimiteTurnos:
            if len(self.ListaTurnosDisponibles) == 0:
                self.ContadorTurnos += 1
                if str(self.ContadorTurnos)[-1] == "0":
                    if str(self.ContadorTurnos)[-2] == "0":
                        self.ContadorTurnos += 1
                return self.ContadorTurnos
            else:
                return self.ListaTurnosDisponibles.pop(-1)
        else:
            return 0

    def DevolverTurno(self, Turno):
        self.ListaTurnosDisponibles.append(Turno)

TurnosDisponibles = ClassTurnosDisponibles()
#---- Termina --- ClassTurnosDisponibles ----------------------
#--------------------------------------------------------------

#--------------------------------------------------------------
#1 -> 1, 100 -> 1, 1000 -> 1, 10000 -> 1
def ValueTo100(valor):
    valorstr = str(valor)
    return int(valorstr[len(valorstr)-2:len(valorstr)])
#--------------------------------------------------------------

#--------------------------------------------------------------
def IntTo8Bytes(valor):
    VectorBytes = bytearray(8)
    valor_temp = valor
    Terminar = False
    if valor_temp==0 or valor_temp > 128:
        print("ERROR - El valor ingresado no es correcto " + str(valor))
    else:
        while not Terminar:
            if valor_temp == 0:
                Terminar = True
            if valor_temp < 128:
                if valor_temp < 64:
                    if valor_temp < 32:
                        if valor_temp < 16:
                            if valor_temp < 8:
                                if valor_temp < 4:
                                    if valor_temp < 2:
                                        if valor_temp == 1:
                                            VectorBytes[7] = 1
                                            valor_temp -= 1
                                        else:
                                            Terminar = True
                                    else:
                                        VectorBytes[6] = 1
                                        valor_temp -= 2
                                else:
                                    VectorBytes[5] = 1
                                    valor_temp -= 4
                            else:
                                VectorBytes[4] = 1
                                valor_temp -= 8
                        else:
                            VectorBytes[3] = 1
                            valor_temp -= 16
                    else:
                        VectorBytes[2] = 1
                        valor_temp -= 32
                else:
                    VectorBytes[1] = 1
                    valor_temp -= 64
            else:
                VectorBytes[0] = 1
                valor_temp -= 128
    return(VectorBytes)
#--------------------------------------------------------------

#--------------------------------------------------------------
#---- Inicia --- Comunicacion ---------------------------------
class ComunicacionGeneradorTurnos():
    """docstring for Comunicacion
    Este Objeto crea el un puerto de comunicacion en
    el que podemos estar acceder no solo a envio y
    recepcion de turnos si no tambien a que turnos a
    manejado para poderce devolver.
    """
    def __init__(self, NombrePuerto):
        try:
            self.NombrePuerto = NombrePuerto
            self.COM = serial.Serial(
                port=NombrePuerto,
                baudrate=9600,
                timeout=1,
                parity=serial.PARITY_EVEN,
                stopbits=serial.STOPBITS_TWO,
                bytesize=serial.EIGHTBITS
                )
        except:
            print("ERROR - El puerto " + NombrePuerto + " no esta disponible")

    def siguiente(self):
        try:
            TurnosDisponibles.LimiteTurnos += 1
            print("Se añado un Nuevo turno, Turno #"+str(TurnosDisponibles.LimiteTurnos))
            byte = IntTo8Bytes(ValueTo100(TurnosDisponibles.LimiteTurnos))
            self.COM.write(byte)
        except:
            print("ERROR - Al añadir un Turno al Turnero")

    def EntroDato(self,Dato):
        if Dato == [1,0,0,0,0,0,0,0]:
            self.siguiente()
        else:
            print("ERROR - El dato "+str(Dato)+" enviado por "+self.NombrePuerto+" es incorrecto")

#---- Termina --- ListaDeCorrimiento --------------------------
#--------------------------------------------------------------

#--------------------------------------------------------------
#---- Inicia --- Comunicacion ---------------------------------
class Comunicacion():
    """docstring for Comunicacion
    Este Objeto crea el un puerto de comunicacion en
    el que podemos estar acceder no solo a envio y
    recepcion de turnos si no tambien a que turnos a
    manejado para poderce devolver.
    """
    def __init__(self, NombrePuerto):
        try:
            self.ListaTurnosAlmacenados = []
            self.NombrePuerto = NombrePuerto
            self.COM = serial.Serial(
                port=NombrePuerto,
                baudrate=9600,
                timeout=1,
                parity=serial.PARITY_EVEN,
                stopbits=serial.STOPBITS_TWO,
                bytesize=serial.EIGHTBITS
                )
        except:
            print("ERROR - El puerto " + NombrePuerto + " no esta disponible")

    def siguiente(self):
        try:
            turno = TurnosDisponibles.UtilizarTurno()
            if turno != 0:
                if self.ListaTurnosAlmacenados[-1] != 0:
                    self.ListaTurnosAlmacenados.append(turno)
                    byte = IntTo8Bytes(ValueTo100(turno))
                    self.COM.write(byte)
                else:
                    self.ListaTurnosAlmacenados.pop(-1)
                    self.ListaTurnosAlmacenados.append(turno)
                    byte = IntTo8Bytes(ValueTo100(turno))
                    self.COM.write(byte)
            else:
                if self.ListaTurnosAlmacenados[-1] != 0:
                    self.ListaTurnosAlmacenados.append(0)
        except:
            print("ERROR - el turno asignado es invalido")

    def anterior(self):
        try:
            print(self.NombrePuerto + " - Anterior - " + str(self.ListaTurnosAlmacenados[-1]) + " - AnteAnterior - " + str(self.ListaTurnosAlmacenados[-2]))
            TurnosDisponibles.DevolverTurno(self.getTurno())
            self.ListaTurnosAlmacenados.pop(-1)
            turno = self.getTurno()
            byte = IntTo8Bytes(ValueTo100(turno))
            self.COM.write(byte)
        except:
            print("ERROR - al retroceder de numero")

    def getTurno(self):
        """docstring for getTurno
        Obtenemos el turno que se esta atendiendo actualmente
        """
        try:
            return(self.ListaTurnosAlmacenados[-1])
        except:
            return 0

    def EntroDato(self,Dato):
        if Dato == [1,0,0,0,0,0,0,0]:
            self.siguiente()
        elif Dato == [0,1,0,0,0,0,0,0]:
            self.anterior()
        else:
            print("ERROR - El dato "+str(Dato)+" enviado por "+self.NombrePuerto+" es incorrecto")

#---- Termina --- ListaDeCorrimiento --------------------------
#--------------------------------------------------------------
