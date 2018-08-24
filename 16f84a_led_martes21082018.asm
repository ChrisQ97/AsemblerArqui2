list p =16f84a
#include <p16f84a.inc>
	org 		0x00
	goto 		inicio
	org			0x05
	contador 	EQU 0xff
inicio:						;configurar los registros
	bsf			STATUS, RP0	;salto al banco1
	clrf		TRISB		;tirsb=0
	bcf			STATUS, RP0	;salto al banco0
	clrf		PORTB		; PORTB = 0
bascular:
	btfsc		PORTB, 0	;SI PORTB.RB0==0 SALTA LA INSTRUCCION
	goto 		apagar		;salta a apagar en caso de portb ==1
	bsf 		PORTB, 0	;PORTB.RB0 = 1
	goto 		retardo		;salta a la etiqueta retardo
apagar:
	bcf			PORTB, 0	;PORTB.RB0 = 0
retardo:
	decfsz		contador,1	;contador-- slta al llegar a cero
	goto		retardo		;vuelve ciclicamente a retardo
	movlw		0xFF		;w= 0xFF
	movwf		contador	; contador = w
	goto		bascular	;salta ciclicamente a bascular
	end 


