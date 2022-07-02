#lang racket/base
(provide identifer->string)

(define (identifer->string stx)
  (symbol->string (syntax->datum stx)))
