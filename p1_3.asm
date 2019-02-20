;comentarios 
   processor 16f877A
   include <p16f877A.inc>

I  equ H'20'   ;Inicial (1)
K  equ H'21'   ;Constante (80H)
T  equ H'22'   ;Temporal
AC equ H'31'   ;Acumulado (secuencia)
   org 0
   goto inicio
   org 5
inicio:
   movf   I,w    ; w=I 
loop:
   movwf  AC     ; AC=w
   addwf  AC,w   ; w=w+AC
   movwf  T      ; T=w (guarda temporalmente el valor de w en T)
   xorlw  K      ; w=w xor K
   movf   T,w    ; w=T (regresa el valor de T a w)
   btfss  STATUS,2 ;si Z=1, salta
   goto   loop
   goto   inicio
   end