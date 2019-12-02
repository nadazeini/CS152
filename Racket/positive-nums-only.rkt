#lang racket

(provide positive-nums-only)

(define (positive-nums-only lst)
   (cond [(null? lst) '()] ;or null instead of '()
         ;2 recursive cases
        [(positive? (car lst)) (cons (car lst) (positive-nums-only (cdr lst)))]
        [else (positive-nums-only (cdr lst))]
  )
          
  )
;(>(car lst) 0)
