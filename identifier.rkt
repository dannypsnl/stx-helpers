#lang racket/base
(provide identifier->string
         string->identifier
         identifier-append)

(define (identifier->string stx)
  (symbol->string (syntax->datum stx)))

(define (string->identifier str)
  (datum->syntax #'#f (string->symbol str)))

(define (identifier-append . id*)
  (string->identifier
   (apply string-append (map identifier->string id*))))

(module+ test
  (require rackunit)

  (test-case "convert identifier to string"
             (check-equal? (identifier->string #'abc) "abc")
             (check-equal? (identifier->string #'abc2) "abc2")
             (check-equal? (identifier->string #'+-*/~!@$#%^&*) "+-*/~!@$#%^&*")
             (check-equal? (identifier->string #'| |) " "))
  (test-case "convert string to identifier"
             (check-true (free-identifier=? (string->identifier "abc") #'abc)))
  (test-case "concat identifiers"
             (check-true (free-identifier=? (identifier-append #'a #'bc) #'abc))))
