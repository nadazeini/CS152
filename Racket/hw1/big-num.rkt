#lang racket

;; The big-num data structure is essentially a list of 3 digit numbers.

;; Exporting methods
(provide big-add big-subtract big-multiply big-power-of pretty-print number->bignum string->bignum)

(define MAX_BLOCK 1000)

;; Addition of two big-nums
(define (big-add x y)
  (big-add1 x y 0)
  
  )

(define (big-add1 x y co)
  (cond
    ;; If both lists are empty, the return value is either 0 or the caryover value.
    [(and (= 0 (length x)) (= 0 (length y)))
      (if (= co 0) '() (list co))]
    [(= 0 (length x))  (big-add1 (list co) y 0)]
    [(= 0 (length y))  (big-add1 x (list co) 0)]
    [else
    
       
            
          
   (cond
   ;if car lst is zero just add
     [(or (= 0 (car x)) (= 0 (car y)))   (cons (+ co (+ (car x) (car y))) (big-add1 (cdr x) (cdr y) 0))]
     
   ;compare number of digits of the sum i equal to number of dig of biggest number adding
   [(= (+ (floor (log (+ (car x) (car y)) 10)) 1) (max (+ (exact-floor (log (car x) 10)) 1) (+ (exact-floor (log (car y) 10)) 1)) )
  (cons (+ co (+ (car x) (car y))) (big-add1 (cdr x) (cdr y) 0))]
 
   [else (cons (- (+ co (+ (car x) (car y))) (expt 10   (- (+ (exact-floor (log (+ (car x) (car y)) 10)) 1) 1)))
        (big-add1 (cdr x) (cdr y) 1))])
                                                          
    ; (error "Not implemented")]
     
    ]))

;; Subtraction of two big-nums
(define (big-subtract x y)
  (let ([lst (big-subtract1 x y 0)])
    (reverse (strip-leading-zeroes (reverse lst)))
  ))

(define (strip-leading-zeroes x)
  (cond
    [(= 0 (length x)) '(0)]
    [(= 0 (car x)) (strip-leading-zeroes (cdr x))]
    [else x]
    ))

;; NOTE: there are no negative numbers with this implementation,
;; so 3 - 4 should throw an error.
(define (big-subtract1 x y borrow)

  (cond
    
    [(and (= 0 (length x)) (= 0 (length y))) '()]
    
    [(< (length x) (length y)) (error "negative")]
    [(and (and (= 1 (length x)) (= 1 (length y))) (< (car x) (car y))) (error "negative")]
    
    [(= 0 (length y))  (big-subtract1 x '(0) borrow)]
    [(and (= 0 (car x)) (= 0 (car y))) (cons 0  (big-subtract1 (cdr x) (cdr y) borrow))]
    [(= 0 (car x)) (cons (- 1000 (car y)) (big-subtract1 (cdr x) (cdr y) 1))]  
    [(< (car x) (car y))
     (cons (- (- (+ (car x) (expt 10 (+ (exact-floor (log (car x) 10)) 1)))
                            (car y)) borrow) (big-subtract1 (cdr x) (cdr y) 1))]
    [else  (cons (- (- (car x) (car y)) borrow) (big-subtract1 (cdr x) (cdr y) 0))]))

  ;(error "Not implemented"))
  
;; Returns true if two big-nums are equal
(define (big-eq x y)

  (cond
    [(and (= 0 (length x)) (= 0 (length y))) #\t]
    [(not (equal? (length x) (length y))) #\f]
    [else (and (equal? (car x) (car y)) (big-eq (cdr x) (cdr y)))]))
 ; (error "Not implemented"))


;; Decrements a big-num
(define (big-dec x)
  (big-subtract x '(1))
  )

;; Multiplies two big-nums
  (define (big-multiply x y)
  

 
(define multiply-big-int (lambda (big int carry)
   (cond
    [(= 0 (length big))  (cons carry '())]
    [(and (= 1 (length big)) (< (* (car big) int) 1000)) (cons (* (car big) int) '())]
    
    [(= 0 int) '(0)]
    
    [(= 0 (car big)) (cons (+ carry (car big)) (multiply-big-int (cdr big) int 0))]
    
    [ (> (+ (exact-floor (log (* (car (reverse big)) int) 10)) 1) (+ (exact-floor (log (max (car big) int) 10)) 1))

      
       (cons
             (remainder (+ carry (* (car big) int)) (expt 10 (+ (exact-floor (log (max (car big) int) 10)) 1)))
             (multiply-big-int (cdr big) int
                               (exact-floor (/ (* (car big) int) (expt 10 (+ (exact-floor (log (max (car big) int) 10)) 1))))))]
    
    [else (cons (+ carry (* (car big) int)) (multiply-big-int (cdr big) int 0))])))


(cond
  [(or (equal? '(0) x) (equal? '(0) y)) '(0)]
  [(= 1 (length x)) (multiply-big-int y (car x) 0)]
  [(= 1 (length y)) (multiply-big-int x (car y) 0)]
  [else (big-add (multiply-big-int (multiply-big-int x (car y) 0) (expt 10 (index-of y (car (cdr y)))) 0)
       (big-multiply x (cdr y)))]))

  
  
  ;; Follow the same approach that you learned in
  ;; grade school for multiplying numbers, except=
  ;; that a "block" is 0-999, instead of 0-9.
  ;; Consider creating a helper function that multiplies
  ;; a big-number with a integer in the range of 0-999.
  ;; Once you have that working, you can use it in your
  ;; solution here.
  ;(error "Not implemented"))

;; Raise x to the power of y
(define (big-power-of x y)
  ;;
  ;; --- YOUR CODE HERE ---
  ;;
  
  ;; Solve this function in terms of big-multiply. 
  (error "Not implemented"))

;; Dispaly a big-num in an easy to read format
(define (pretty-print x)
  (let ([lst (reverse x)])
    (string-append
     (number->string (car lst))
     (pretty-print1 (cdr lst))
     )))

(define (pretty-print1 x)
  (cond
    [(= 0 (length x))  ""]
    [else
     (string-append (pretty-print-block (car x)) (pretty-print1 (cdr x)))]
    ))

(define (pretty-print-block x)
  (string-append
   ","
   (cond
     [(< x 10) "00"]
     [(< x 100) "0"]
     [else ""])
   (number->string x)))

;; Convert a number to a bignum
(define (number->bignum n)
  (cond
    [(< n MAX_BLOCK) (list n)]
    [else
     (let ([block (modulo n MAX_BLOCK)]
           [rest (floor (/ n MAX_BLOCK))])
       (cons block (number->bignum rest)))]))

;; Convert a string to a bignum
(define (string->bignum s)
  (let ([n (string->number s)])
    (number->bignum n)))
(mul