#lang racket
(provide sumofsquares1 sumofsquares2)

;; Given a list of numbers, produce the sum of their squares. 
;; Use foldr, not recursion.
(define (sumofsquares1 lst)
  (foldr (λ (x b) (+ (* x x) b)) 0 lst)
)

;; Repeat with foldl
(define (sumofsquares2 lst)
  (foldl (λ (x b) (+ (* x x) b)) 0 lst)
)