;comentarios 
   processor 16f877A
   include <p16f877A.inc>

;K1 equ H'20'   ;Constante (1H)
;K6 equ H'21'   ;Constante (6H)
;F1 equ H'22'   ;Comparación (20d=14H)
;F2 equ H'23'   ;Comparación (Ah)
T  equ H'24'   ;Temporal
SW equ H'30'   ;Secuencia
   org 0
   goto inicio
   org 5
inicio:
   clrw            ;w=00h
suma:
   movwf  SW        ;SW=w
   addlw  0x01       ;w=w+1
   movwf  T        ;T=w  (guarda temporalmente w en T)
   xorlw  0x19       ;w=w xor F1
   btfsc  STATUS,2 ;si Z=0, salta
   goto   veinte
   movf   T,w      ;w=T (regresa el valor de T a w)
   xorlw  0x0A       ;w=w xor F2
   btfsc  STATUS,2 ;si Z=0, salta
   goto   suma2
   movf   T,w      ;w=T (regresa el valor de T a w)
   goto   suma
suma2:
   movf   T,w      ;w=T (regresa el valor de T a w)
   addlw  0x06       ;w=w+6
   goto   suma
veinte:
   movlw  0x20
   movwf  SW        ;SW=w
   goto   inicio
   end