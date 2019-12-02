#lang racket
(define (big-add x y)
  (big-add1 x y 0)
  
  )

(define (big-add1 x y co)
  (define (add-two-lists lst1 lst2)
 (cond
  [(null? lst1) lst2]
  [(null? lst2) lst1]
  [else (cons(+ (car lst1) (car lst2)) (add-two-lists (cdr lst1) (cdr lst2)))]
  
  ))
  (cond
    ;; If both lists are empty, the return value is either 0 or the caryover value.
    [(and (= 0 (length x)) (= 0 (length y)))
      (if (= co 0) '() (list co))]
    [(= 0 (length x))  (big-add1 (list co) y 0)]
    [(= 0 (length y))  (big-add1 x (list co) 0)]
    [else
       ;;
       ;; --- YOUR CODE HERE ---
       ;;

     
  )
  )