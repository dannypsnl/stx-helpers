#lang racket
(provide make-eval)
(require racket/sandbox)

(define (make-eval mod-datum)
  (parameterize ([sandbox-output 'string]
                 [sandbox-error-output 'string])
    (make-module-evaluator `(module m racket/base
                              (require ,mod-datum)))))
