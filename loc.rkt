#lang racket/base
(provide build-srcloc)
(require racket/syntax-srcloc)

(define (build-srcloc start end)
  (define start-loc (syntax-srcloc start))
  (define end-loc (syntax-srcloc end))

  (struct-copy srcloc start-loc
               [span (- (+ (srcloc-span end-loc) (srcloc-position end-loc))
                        (srcloc-position start-loc))]))

(module+ main
  (displayln (build-srcloc #'this #'that)))
