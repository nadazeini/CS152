#lang racket
; first problem
(provide reverse)

(define (reverse lst)
    (if (null? lst)
        lst
        (append (reverse (cdr lst)) (list (car lst)))))


;second problem
(provide add-two-lists)

(define (add-two-lists lst1 lst2)

(cond
  [(null? lst1) lst2]
  [(null? lst2) lst1]
  [else (cons(+ (car lst1) (car lst2)) (add-two-lists (cdr lst1) (cdr lst2)))]
  
  )
  )
;3rd problem

(provide positive-nums-only)

(define (positive-nums-only lst)
  (cond [(null? lst) '()]
        [(positive? (car lst)) (cons (car lst) (positive-nums-only (cdr lst)))]
        [else (positive-nums-only (cdr lst))]
  )
          
  )
(positive-nums-only '(-1 -2 3 0 -9))