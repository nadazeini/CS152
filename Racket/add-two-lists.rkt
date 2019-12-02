#lang racket

(provide add-two-lists)

(define (add-two-lists lst1 lst2)
 (cond
  [(null? lst1) lst2]
  [(null? lst2) lst1]
  [else (cons(+ (car lst1) (car lst2)) (add-two-lists (cdr lst1) (cdr lst2)))]
  
  )
  )
(add-two-lists '(1000 1) '(90 21 1))
;Correction
;(define (add-two-lists lst1 lst2)
  ;(cond
    ;[(empty? lst1) lst2]
   ; [empty? lst2] lst1)
 ; [else (cons
           ;(+ (car lst) (car lst2))
           ;(add-two-lists (cdr lst1) (cdr lst2)))]
  ;)