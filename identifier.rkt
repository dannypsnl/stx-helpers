#lang racket/base
(provide identifier->symbol symbol->identifier
         identifier->string string->identifier
         identifier-append)

(define (identifier->symbol id)
  (syntax->datum id))
(define (symbol->identifier sym [srcloc #f])
  (datum->syntax (if (syntax? srcloc) srcloc #f)
                 sym srcloc))

(define (identifier->string id)
  (symbol->string (identifier->symbol id)))
(define (string->identifier str [srcloc #f])
  (symbol->identifier (string->symbol str) srcloc))

(define (identifier-append #:srcloc [srcloc #f] . id*)
  (string->identifier (apply string-append (map identifier->string id*))
                      srcloc))

(module+ test
  (require rackunit
           racket/syntax-srcloc)
  (define-binary-check (check-identifier-equal? actual expected)
    (free-identifier=? actual expected))
  (define-binary-check (check-identifier-strict-equal? actual expected)
    (and (equal? (syntax-srcloc actual) (syntax-srcloc expected))
         (free-identifier=? actual expected)))

  (check-identifier-equal? (symbol->identifier 'abc) #'abc)

  (test-case "convert identifier to string"
             (check-equal? (identifier->string #'abc) "abc")
             (check-equal? (identifier->string #'abc2) "abc2")
             (check-equal? (identifier->string #'+-*/~!@$#%^&*) "+-*/~!@$#%^&*")
             (check-equal? (identifier->string #'| |) " "))
  (test-case "convert string to identifier"
             (check-identifier-equal? (string->identifier "abc") #'abc)
             (define stx #'def)
             (check-identifier-strict-equal? (string->identifier "def" stx)
                                             stx))
  (test-case "concat identifiers"
             (check-identifier-equal? (identifier-append #'a #'bc) #'abc)
             (define stx #'hello-world)
             (check-identifier-strict-equal? (identifier-append #'hello #'-world
                                                                #:srcloc stx)
                                             stx)))
