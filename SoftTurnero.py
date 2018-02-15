#En cmd se ejecuta con los siguientes comandos
#py -3.1 "C:\Users\juanz\Google Drive\Semestre 6\Laboratorio Electronica Digital\ProyectoTurnero\SoftTurnero.py"

import sys
import time
import serial
import pygame
import Clases
from pygame.locals import *

SizeDisplay = [1000, 600]
Blanco = [255,255,255]
Rojo = [255,0,0]
Negro = [0,0,0]

pygame.init()
pantalla = pygame.display.set_mode(SizeDisplay, RESIZABLE)
pantalla.fill(Blanco)

Mensaje1 = pygame.font.Font(None, 60)
TextoMensaje1 = Mensaje1.render("Por favor espere su turno", True, Negro, Blanco)
RectTextoMensaje1 = TextoMensaje1.get_rect()
RectTextoMensaje1.centerx = pantalla.get_rect().centerx
RectTextoMensaje1.y = 5

#--------------------------------------------------------------------------
Turno = pygame.font.Font(None, 90)
TextoTurno = Turno.render("Turno : ", True, Negro, Blanco)
RectTextoTurno = TextoTurno.get_rect()
RectTextoTurno.x = 65
RectTextoTurno.y = 130

NumeroTurno = pygame.font.Font(None, 250)
TextoNumeroTurno = NumeroTurno.render("00", True, Rojo, Blanco)
RectTextoNumeroTurno = TextoNumeroTurno.get_rect()
RectTextoNumeroTurno.x = 310
RectTextoNumeroTurno.y = 85

Mesa = pygame.font.Font(None, 50)
TextoMesa = Mesa.render("en la mesa numero 0", True, Negro, Blanco)
RectTextoMesa = TextoMesa.get_rect()
RectTextoMesa.x = 550
RectTextoMesa.y = 145
#--------------------------------------------------------------------------
Turno1 = pygame.font.Font(None, 45)
TextoTurno1 = Turno1.render("Turno : ", True, Negro, Blanco)
RectTextoTurno1 = TextoTurno1.get_rect()
RectTextoTurno1.x = 240
RectTextoTurno1.y = 305

NumeroTurno1 = pygame.font.Font(None, 125)
TextoNumeroTurno1 = NumeroTurno1.render("00", True, Rojo, Blanco)
RectTextoNumeroTurno1 = TextoNumeroTurno1.get_rect()
RectTextoNumeroTurno1.x = 360
RectTextoNumeroTurno1.y = 280

Mesa1 = pygame.font.Font(None, 30)
TextoMesa1 = Mesa1.render("en la mesa numero 0", True, Negro, Blanco)
RectTextoMesa1 = TextoMesa1.get_rect()
RectTextoMesa1.x = 480
RectTextoMesa1.y = 310
#--------------------------------------------------------------------------
Turno2 = pygame.font.Font(None, 45)
TextoTurno2 = Turno2.render("Turno : ", True, Negro, Blanco)
RectTextoTurno2 = TextoTurno2.get_rect()
RectTextoTurno2.x = 240
RectTextoTurno2.y = 405

NumeroTurno2 = pygame.font.Font(None, 125)
TextoNumeroTurno2 = NumeroTurno2.render("00", True, Rojo, Blanco)
RectTextoNumeroTurno2 = TextoNumeroTurno2.get_rect()
RectTextoNumeroTurno2.x = 360
RectTextoNumeroTurno2.y = 380

Mesa2 = pygame.font.Font(None, 30)
TextoMesa2 = Mesa2.render("en la mesa numero 0", True, Negro, Blanco)
RectTextoMesa2 = TextoMesa2.get_rect()
RectTextoMesa2.x = 480
RectTextoMesa2.y = 410
#--------------------------------------------------------------------------
Turno3 = pygame.font.Font(None, 45)
TextoTurno3 = Turno3.render("Turno : ", True, Negro, Blanco)
RectTextoTurno3 = TextoTurno3.get_rect()
RectTextoTurno3.x = 240
RectTextoTurno3.y = 505

NumeroTurno3 = pygame.font.Font(None, 125)
TextoNumeroTurno3 = NumeroTurno3.render("00", True, Rojo, Blanco)
RectTextoNumeroTurno3 = TextoNumeroTurno3.get_rect()
RectTextoNumeroTurno3.x = 360
RectTextoNumeroTurno3.y = 480

Mesa3 = pygame.font.Font(None, 30)
TextoMesa3 = Mesa3.render("en la mesa numero 0", True, Negro, Blanco)
RectTextoMesa3 = TextoMesa3.get_rect()
RectTextoMesa3.x = 480
RectTextoMesa3.y = 510
#--------------------------------------------------------------------------
class ColaTurnoMesa():
	def __init__(self):
		self.lista = []
		for x in range(0,5):
			#print(x)
			self.lista.append([0,0])

	def add(self,Turno,NumeroMesa):
		self.lista.insert(0,[Turno,NumeroMesa])
		self.lista.pop(-1)

ColaTurnosPantalla = ColaTurnoMesa()
#--------------------------------------------------------------------------

def PrintPantalla(Turno,NumeroMesa):
	ColaTurnosPantalla.add(Turno,NumeroMesa)
	print("Turno "+str(ColaTurnosPantalla.lista[0][0]))
	print("Mesa "+str(ColaTurnosPantalla.lista[0][1]))
	TextoNumeroTurno = NumeroTurno.render(str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
	TextoMesa = Mesa.render("en la mesa numero "+str(ColaTurnosPantalla.lista[0][1]), True, Negro, Blanco)
	#-------------------------------------------------------------------
	TextoNumeroTurno1 = NumeroTurno1.render(str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
	TextoMesa1 = Mesa1.render("en la mesa numero "+str(ColaTurnosPantalla.lista[1][1]), True, Negro, Blanco)
	#-------------------------------------------------------------------
	TextoNumeroTurno2 = NumeroTurno2.render(str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
	TextoMesa2 = Mesa2.render("en la mesa numero "+str(ColaTurnosPantalla.lista[2][1]), True, Negro, Blanco)
	#-------------------------------------------------------------------
	TextoNumeroTurno3 = NumeroTurno3.render(str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
	TextoMesa3 = Mesa3.render("en la mesa numero "+str(ColaTurnosPantalla.lista[3][1]), True, Negro, Blanco)

	pygame.display.flip()

if __name__ == '__main__':
	COM1 = Clases.Comunicacion("COM1")
	#COM2 = Clases.ComunicacionGeneradorTurnos("COM2")
	#COM3 = Clases.Comunicacion("COM3")
	#COM4 = Clases.Comunicacion("COM4")

	while True:
		pantalla.fill(Blanco)
		pantalla.blit(TextoMensaje1, RectTextoMensaje1)
		#------------------------------------------------------
		pantalla.blit(TextoTurno, RectTextoTurno)
		pantalla.blit(TextoNumeroTurno, RectTextoNumeroTurno)
		pantalla.blit(TextoMesa, RectTextoMesa)
		#------------------------------------------------------
		pantalla.blit(TextoTurno1, RectTextoTurno1)
		pantalla.blit(TextoNumeroTurno1, RectTextoNumeroTurno1)
		pantalla.blit(TextoMesa1, RectTextoMesa1)
		#------------------------------------------------------
		pantalla.blit(TextoTurno2, RectTextoTurno2)
		pantalla.blit(TextoNumeroTurno2, RectTextoNumeroTurno2)
		pantalla.blit(TextoMesa2, RectTextoMesa2)
		#------------------------------------------------------
		pantalla.blit(TextoTurno3, RectTextoTurno3)
		pantalla.blit(TextoNumeroTurno3, RectTextoNumeroTurno3)
		pantalla.blit(TextoMesa3, RectTextoMesa3)
		#------------------------------------------------------
		for event in pygame.event.get():
			if event.type == QUIT or (event.type == KEYDOWN and event.key == K_ESCAPE):
				sys.exit()
			if event.type == KEYDOWN and event.key == K_n:
				dato = [1,0,0,0,0,0,0,0]
				#COM2.EntroDato(dato)
		pygame.display.flip()

		if COM1.COM.inWaiting() > 7:
			datoCOM1 = COM1.COM.read(8)
			#print("llego el dato " + str(datoCOM1) + " en COM1")
			COM1.EntroDato(datoCOM1)
			if COM1.getTurno() != 0:
				Turno = Clases.ValueTo100(COM1.getTurno())
				NumeroMesa = 1
				if Turno != 0:
					ColaTurnosPantalla.add(Turno,NumeroMesa)
					if ColaTurnosPantalla.lista[0][0] < 10:
						TextoNumeroTurno = NumeroTurno.render("0"+str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno = NumeroTurno.render(str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
					TextoMesa = Mesa.render("en la mesa numero "+str(ColaTurnosPantalla.lista[0][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[1][0] < 10:
						TextoNumeroTurno1 = NumeroTurno1.render("0"+str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno1 = NumeroTurno1.render(str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
					TextoMesa1 = Mesa1.render("en la mesa numero "+str(ColaTurnosPantalla.lista[1][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[2][0] < 10:
						TextoNumeroTurno2 = NumeroTurno2.render("0"+str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno2 = NumeroTurno2.render(str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
					TextoMesa2 = Mesa2.render("en la mesa numero "+str(ColaTurnosPantalla.lista[2][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[3][0] < 10:
						TextoNumeroTurno3 = NumeroTurno3.render("0"+str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno3 = NumeroTurno3.render(str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
					TextoMesa3 = Mesa3.render("en la mesa numero "+str(ColaTurnosPantalla.lista[3][1]), True, Negro, Blanco)
			else:
				print("No hay mas turnos existentes")

		'''
		if COM2.COM.inWaiting() > 0:
			datoCOM2 = COM2.COM.read(8)
			#print("llego el dato " + str(datoCOM2) + " en COM2")
			COM2.EntroDato(datoCOM2)

		if COM3.COM.inWaiting() > 0:
			datoCOM3 = COM3.COM.read(8)
			#print("llego el dato " + str(datoCOM3) + " en COM3")
			COM3.EntroDato(datoCOM3)
			if COM3.getTurno() != 0:
				Turno = Clases.ValueTo100(COM3.getTurno())
				NumeroMesa = 1
				if Turno != 0:
					ColaTurnosPantalla.add(Turno,NumeroMesa)
					if ColaTurnosPantalla.lista[0][0] < 10:
						TextoNumeroTurno = NumeroTurno.render("0"+str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno = NumeroTurno.render(str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
					TextoMesa = Mesa.render("en la mesa numero "+str(ColaTurnosPantalla.lista[0][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[1][0] < 10:
						TextoNumeroTurno1 = NumeroTurno1.render("0"+str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno1 = NumeroTurno1.render(str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
					TextoMesa1 = Mesa1.render("en la mesa numero "+str(ColaTurnosPantalla.lista[1][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[2][0] < 10:
						TextoNumeroTurno2 = NumeroTurno2.render("0"+str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno2 = NumeroTurno2.render(str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
					TextoMesa2 = Mesa2.render("en la mesa numero "+str(ColaTurnosPantalla.lista[2][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[3][0] < 10:
						TextoNumeroTurno3 = NumeroTurno3.render("0"+str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno3 = NumeroTurno3.render(str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
					TextoMesa3 = Mesa3.render("en la mesa numero "+str(ColaTurnosPantalla.lista[3][1]), True, Negro, Blanco)
			else:
				print("No hay mas turnos existentes")

		if COM4.COM.inWaiting() > 0:
			datoCOM4 = COM4.COM.read(8)
			#print("llego el dato " + str(datoCOM4) + " en COM4")
			COM4.EntroDato(datoCOM4)
			if COM4.getTurno() != 0:
				Turno = Clases.ValueTo100(COM4.getTurno())
				NumeroMesa = 1
				if Turno != 0:
					ColaTurnosPantalla.add(Turno,NumeroMesa)
					if ColaTurnosPantalla.lista[0][0] < 10:
						TextoNumeroTurno = NumeroTurno.render("0"+str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno = NumeroTurno.render(str(ColaTurnosPantalla.lista[0][0]), True, Rojo, Blanco)
					TextoMesa = Mesa.render("en la mesa numero "+str(ColaTurnosPantalla.lista[0][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[1][0] < 10:
						TextoNumeroTurno1 = NumeroTurno1.render("0"+str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno1 = NumeroTurno1.render(str(ColaTurnosPantalla.lista[1][0]), True, Rojo, Blanco)
					TextoMesa1 = Mesa1.render("en la mesa numero "+str(ColaTurnosPantalla.lista[1][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[2][0] < 10:
						TextoNumeroTurno2 = NumeroTurno2.render("0"+str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno2 = NumeroTurno2.render(str(ColaTurnosPantalla.lista[2][0]), True, Rojo, Blanco)
					TextoMesa2 = Mesa2.render("en la mesa numero "+str(ColaTurnosPantalla.lista[2][1]), True, Negro, Blanco)
					#-------------------------------------------------------------------
					if ColaTurnosPantalla.lista[3][0] < 10:
						TextoNumeroTurno3 = NumeroTurno3.render("0"+str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
					else:
						TextoNumeroTurno3 = NumeroTurno3.render(str(ColaTurnosPantalla.lista[3][0]), True, Rojo, Blanco)
					TextoMesa3 = Mesa3.render("en la mesa numero "+str(ColaTurnosPantalla.lista[3][1]), True, Negro, Blanco)
			else:
				print("No hay mas turnos existentes")
		'''