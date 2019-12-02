 #lang racket

(require racket/contract)

(struct account (balance))

;(provide new-account balance withdraw deposit account)

;; A new, empty account
(define new-account (account 0))

;; Get the current balance
(define (balance acc)
(account-balance acc))

;; Withdraw funds from an account
(define (withdraw acc amt)
(account (- (account-balance acc) amt)))

;; Add funds to an account
(define (deposit acc amt)
(account (+ (account-balance acc) amt)))

(provide (contract-out
[new-account account?]
[balance (-> account? number?)]
[withdraw (->i ([acc account?] ;i interdependency between the 2
[to-withdraw (acc) (and/c number? positive? (withdraw? acc))])
[result account?])]

[deposit (-> account? (and/c number? positive?) account?)]))
(define (withdraw? a)
(λ (b) (if (> b (account-balance a))
#f
#t)))




;; correction
(define (empty-account? acc)
  ( match acc
     [(account 0) #t]
     [_           #f]
     ))

(provide (contract-out
          [new-account empty-account?]
          [balance (-> account? number?)]
          [deposit (-> account? positive? account?)]
          [withdraw (->i ([the-account account?]
                          [the-account (the-account)
                                       (and/c positive?
                                              (sufficient-funds the-account))])
                         (updated-account account?))]))

(define (sufficient-funds acc)
  (lambda (withdraw-amt)
    (>=(account-balance acc)
       withdraw-amt)))

                                               
                                       