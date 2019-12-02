#lang racket
(provide sumofsquares1 sumofsquares2 join-strings make-html-tags)

;; Given a list of numbers, produce the sum of their squares. 
;; Use foldr, not recursion.
(define (sumofsquares1 lst)
(foldr (lambda (square add) (+ (* square square) add)) 0 lst))
  

;; Repeat with foldl
(define (sumofsquares2 lst)
  (foldl (lambda (square add) (+ (* square square) add)) 0 lst)
  )

;; Using foldl, combine a list of strings into a single string,
;; separated by the specified separator.  Separators should only
;; appear between words
(define (join-strings list-of-strings separator)
   (cond [(empty? list-of-strings)  ""]
      [else (foldl  (lambda (x y)
         
           (cond [(equal? y "") (string-append x y)]
          [ else(string-append y separator x)]))
        (car list-of-strings) (cdr list-of-strings))])) 

;; Make matching open and close tags, using the list of tag-names
(define (make-html-tags tag-names)
  (string-append

     (foldl (lambda (x y)
         (string-append   y "<" x ">"  ))
       ""  tag-names)

   (foldr 
  (lambda (x y) (string-append  y "</"  x ">"  ))
 "" tag-names)))
