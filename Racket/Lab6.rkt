#lang racket

;;mine
(define-syntax switch
(syntax-rules ()
  [(switch a [default d]) d]
     [(switch a
             [b c]
             rest ... ) (begin (if (equal? a b) c  (switch a rest  ...)))]))
;;solution
(define-syntax switch1
(syntax-rules (default)
  {(switch c) (void)};base case 1
  {(switch c [default body]) body} ; base case 2
 { (switch c [val1 body1] rest-cases ...)
  (let ([v c])
    (if (eq? v val1)
        body1
        (switch v rest-cases ...)))}))
          
;;cooler solution

 (define-syntax switch2
(syntax-rules (default)
  {(switch c [val body] ... [default def-body])
   (let [v c]
     (cond
       [eqv? v val] body) ...
       [else def-body])}
                            
                    
     
      (define x 99)
(switch x
    [3 (displayln "x is 3")]
    [4 (displayln "x is 4")]
    [5 (displayln "x is 5")]
    [default (displayln "none of the above")])        


    
   