#lang racket
; Discusion 6

; Dado un entero que representa un año, diga si es o no bisiesto.
(define (bisiesto numero)
  (if (and (= 0 (modulo numero 4)) (or (not(= 0 (modulo numero 100))) (= 0 (modulo numero 400))))
      (display "El año es bisiesto")
      (display "El año no es bisiesto")
      )
)

; Dados tres enteros positivos que representan los lados de un triángulo,
; indique si ese es equilátero, isósceles o escaleno.
(define (triangulo n1 n2 n3)
  (cond
    ( (= n1 n2 n3) (display "Triangulo Equilatero"))
    ( (or (= n1 n2) (= n1 n3) (= n2 n3)) (display "Triangulo Isosceles"))
    ( (not(= n1 n2 n3)) (display "Triangulo Escaleno"))
    )
)

;Dado un número positivo que representa el radio de una circunferencia,
;realice lo siguiente: a) si el radio es mayor que cero, calcular e indicar el
;área de la circunferencia, b) si el valor del radio es cero, indicar que se
;trata de un punto en el plano, pedir sus coordenadas e indicar la
;distancia del punto al origen.
(define (circunferencia r)
  (if (< 0 r)
      (begin
        (let ([area (* pi (expt r 2))]) (display area))
        )
      (begin
        (display "Es un punto \n")
        (let ([x1 (read)] [y1 (read)]) (display (sqrt (+ (expt x1 2) (expt y1 2)))))
        )
      )
)

; Cuadrado o Hexagono
(define (areade r n)
  (cond
    ( (= 4 n ) (let ([areaCua (* 2 (expt r 2))]) (display areaCua)))
    ( (= 6 n ) (let ([areaHex (* 6 (* (expt r 2) (/ (sqrt 3) 4)))]) (display areaHex)))
    ( else (display "No voy a hacer nada"))
    )
  )

; Imprimir A con espacios
(define (imprimirA num)
  (imprimir num 1)
)

(define (imprimir num cont)
  (if (<= cont num)
      (begin
        (imprimirAux cont 1)
        (imprimir num (+ cont 1))
      )
      (begin
        (display " ")
      )
  )
)

(define (imprimirAux num c)
  (if (< c num)
      (begin
        (display " ")
        (imprimirAux num (+ c 1))
        )
      (begin
        (display "A\n")
      )
  )
)







    