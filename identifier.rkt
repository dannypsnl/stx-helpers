#lang racket/base
(provide identifier->string)

(define (identifier->string stx)
  (symbol->string (syntax->datum stx)))
