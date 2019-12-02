#lang racket
(provide altsum1 altsum2)
;; Given a list (a b c d e ...) of numbers, produce its alternating sum
;; a - b + c - d + e - ...
;; Use foldr, not recursion.
(define (altsum1 lst)
   (foldr (λ (index num acc)
            (define op (if (even? index)
                           + ; if range # is even, number should be added.
                           -)) ; else odd number means subtract
            (op acc num))
          0 ; accum first
          (range (length lst)) ; index: produce list of num 0 -> length
          lst) ; number to add/sub
)

;; Repeat with foldl.
;; Hint: Carry additional state into the computation.
(define (altsum2 lst)
   (foldl (λ (index num acc)
            (define op (if (even? index)
                           + ; if range # is even, number should be added.
                           -)) ; else odd number means subtract
            (op acc num))
          0 ; accum first
          (range (length lst)) ; index: produce list of num 0 -> length
          lst) ; number to add/sub
)