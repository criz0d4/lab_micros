;comentarios 
		processor 16f877A
		include <p16f877A.inc>

temp	equ H'28'
show	equ H'41'
	
   		org 0
   		goto inicio
   		org 5
inicio:
		movlw	H'20'	;w=20h
		movwf	FSR		;FSR=w
loop:	
		movf	INDF,w	;w=INDF
		movwf	temp	;temp=w
		incf	FSR,f	;FSR++
		movf	INDF,w	;w=INDF
		subwf	temp,w	;w=temp-w
		btfss	STATUS,0
		goto	temp_menor
		goto	comprobar_tope
temp_menor:
		movf	temp,w	;w=temp
		subwf	show,w	
		btfss	STATUS,0
		goto	comprobar_tope
		movf	temp,w	;w=temp
		movwf	show	;show=w
		goto	comprobar_tope
;temp_mayor:
;		movwf	show	;show=w
;		goto	comprobar_tope;
comprobar_tope:
		movlw	H'27'	;w=tope
		subwf	FSR,w	;w=FSR-w
		btfss	STATUS,2
		goto	loop
		goto	inicio
   		end