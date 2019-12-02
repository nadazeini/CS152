#lang racket
 
(define (multiply-big-int big int carry)
   (cond
    [(= 0 (length big))  (cons carry '())]
    [(and (= 1 (length big)) (< (* (car big) int) 1000)) (cons (* (car big) int) '())]
    
    [(= 0 int) '(0)]
    
    [(= 0 (car big)) (cons (+ carry (car big)) (multiply-big-int (cdr big) int 0))]
    
    [ (> (+ (exact-floor (log (* (car  big) int) 10)) 1) (+ (exact-floor (log (max (car big) int) 10)) 1))

      
       (cons
             (remainder (+ carry (* (car big) int)) (expt 10 (+ (exact-floor (log (max (car big) int) 10)) 1)))
             (multiply-big-int (cdr big) int
                               (exact-floor (/ (* (car big) int) (expt 10 (+ (exact-floor (log (max (car big) int) 10)) 1))))))]
    
    [else (cons (+ carry (* (car big) int)) (multiply-big-int (cdr big) int 0))]))



(multiply-big-int '(111 1) 999 0)

