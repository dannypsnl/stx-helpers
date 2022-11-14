#lang racket/base
(provide stx-andmap
         stx-ormap
         stx-length
         stx-length=?
         stx-length>=?
         stx-length<=?)
(require racket/function
         syntax/stx)

(define (stx-andmap f . stx-lst)
  (apply andmap f (map stx->list stx-lst)))
(define (stx-ormap f . stx-lst)
  (apply ormap f (map stx->list stx-lst)))

(define (maybe f)
  (λ v (if (andmap identity v)
           (apply f v)
           #f)))

(define (stx-length stx)
  ((compose (maybe length) stx->list) stx))
(define (stx-length=? stx1 stx2)
  ((maybe =) (stx-length stx1) (stx-length stx2)))
(define (stx-length>=? stx1 stx2)
  ((maybe >=) (stx-length stx1) (stx-length stx2)))
(define (stx-length<=? stx1 stx2)
  ((maybe <=) (stx-length stx1) (stx-length stx2)))

(module+ test
  (require rackunit)

  ;; success test
  (check-true (stx-length=? #'(a b c) #'(1 2 3)))
  (check-true (stx-length<=? #'(a) #'(1 2 3)))
  (check-true (stx-length>=? #'(a b c d e) #'(1 2 3)))

  (check-true (stx-andmap identifier? #'(a b c)))
  (check-true (stx-ormap identifier? #'(1 b 3)))

  ;; safe fail
  (check-false (stx-length #'a))
  (check-false (stx-length=? #'1 #'(a b c))))
