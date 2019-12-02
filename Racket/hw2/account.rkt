#lang racket

(require racket/contract)

(struct account (balance))

(provide new-account balance withdraw deposit account)

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
          [withdraw (->i ([acc account?]
                          [to-withdraw (acc) (and/c  number? positive? (withdraw? acc))])
                          [result account?])]
                          
          [deposit (-> account? (and/c number? positive?) account?)]))
(define (withdraw? a)
  (λ (b) (if (> b (account-balance a))
                #f
                #t)))