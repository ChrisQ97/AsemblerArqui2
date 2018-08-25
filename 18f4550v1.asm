list p = 18f4550
#include <p18f4550.inc>
	org					0x00
	goto				inicio
	org					0x20
	contador			EQU 0x25
inicio:
	;moveff 				STATUS, RP0; movernos a banco 0
	setf				ADCON1;
	clrf				TRISB; tris b = 0
	;movff				STATUs, RP0; movernos al banco 0
	clrf				PORTB; 
	;addcon1 sirve para la configuracion de entradas
	;0101
	;movlw 0x05
	;movsf ADCON1
	;setf addcon1
	;blink
	;piensen en numeros
bascular:
	btfsc		PORTB, 0	;SI PORTB.RB0==0 SALTA LA INSTRUCCION
	goto 		apagar		;salta a apagar en caso de portb ==1
	bsf 		PORTB, 0	;PORTB.RB0 = 1
	goto 		retardo		;salta a la etiqueta retardo
apagar:
	bcf			PORTB, 0
retardo:
	decfsz		contador,0x25	;contador-- slta al llegar a cero
	goto		retardo		;vuelve ciclicamente a retardo
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		bascular	;salta ciclicamente a bascular
	end 		