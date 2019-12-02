#lang racket

(provide reverse)

(define (reverse lst)
    (if (null? lst)
        lst ;correction '() > if empty return '()
        (append (reverse (cdr lst)) (list (car lst)))))
;car lst would give an error
;should be a list
; if not> using cons:
; (cons (car lst) null) instead of  (list (car lst)
; null in scheme means the empty list 