#lang racket
; Imprimir cada elemento de
; una lista, línea por línea:
(define (imprimeEltosL L)
 (if (not (empty? L))
     (begin
       (display (first L))
       (newline)
       (imprimeEltosL (rest L))
     )
     (newline)
  )
)

; Clasificar los elementos de una lista
; en cuatro listas de: números, cadenas,
; símbolos y carácteres.
(define (clasificar L)
  (clasificar-rec L '() '() '() '())
)
  

(define (clasificar-rec L Num Cad Car Sim)
  (if (not (empty? L))
      (cond 
        ((number? (first L)) (clasificar-rec (rest L) (append Num (list(first L))) Cad Car Sim))
        ((string? (first L)) (clasificar-rec (rest L) Num (append Cad (list (first L))) Car Sim))
        ((char?   (first L)) (clasificar-rec (rest L) Num Cad (append Car (list (first L))) Sim))
        ((symbol? (first L)) (clasificar-rec (rest L) Num Cad Car (append Sim (list (first L)))))
      )
      (values Num Cad Car Sim)
  )
)

; Dada una cadena, retornar la lista compuesta
; por los carácteres de la cadena, colocados
; en orden inverso:
(define (cad-lista-inv cad)
  (c-l-inv cad '())
)

(define (c-l-inv cad L)
  (if (not (zero? (string-length cad)))
      (c-l-inv (substring cad 1 (string-length cad)) (append (list (string-ref cad 0)) L))
      L
   )
)
