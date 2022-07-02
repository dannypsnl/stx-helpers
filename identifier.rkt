#lang racket/base
(provide identifier->string
         string->identifier
         identifier-append)

(define (identifier->string stx)
  (symbol->string (syntax->datum stx)))

(define (string->identifier str #:srcloc [srcloc #f])
  (datum->syntax #'#f (string->symbol str) srcloc))

(define (identifier-append #:srcloc [srcloc #f] . id*)
  (string->identifier #:srcloc srcloc
                      (apply string-append (map identifier->string id*))))

(module+ test
  (require rackunit
           racket/syntax-srcloc)
  (define-binary-check (check-identifier-equal? actual expected)
    (free-identifier=? actual expected))
  (define-binary-check (check-identifier-strict-equal? actual expected)
    (and (equal? (syntax-srcloc actual) (syntax-srcloc expected))
         (free-identifier=? actual expected)))

  (test-case "convert identifier to string"
             (check-equal? (identifier->string #'abc) "abc")
             (check-equal? (identifier->string #'abc2) "abc2")
             (check-equal? (identifier->string #'+-*/~!@$#%^&*) "+-*/~!@$#%^&*")
             (check-equal? (identifier->string #'| |) " "))
  (test-case "convert string to identifier"
             (check-identifier-equal? (string->identifier "abc") #'abc)
             (define stx #'def)
             (check-identifier-strict-equal? (string->identifier "def"
                                                                 #:srcloc stx)
                                             stx))
  (test-case "concat identifiers"
             (check-identifier-equal? (identifier-append #'a #'bc) #'abc)
             (define stx #'hello-world)
             (check-identifier-strict-equal? (identifier-append #'hello #'-world
                                                                #:srcloc stx)
                                             stx)))
