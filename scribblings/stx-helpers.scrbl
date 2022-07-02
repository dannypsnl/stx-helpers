#lang scribble/manual
@(require (for-label syntax/identifier
                     racket/base)
          racket/sandbox
          scribble/example)

@title{stx-helpers}
@author{dannypsnl}

@defmodule[syntax/identifier]
@(define eval
   (parameterize ([sandbox-output 'string]
                  [sandbox-error-output 'string])
     (make-module-evaluator '(module m racket/base
                               (require syntax/identifier)))))

@defproc[(identifier->string [id identifier?])
         string?
         ]{
 Convert an identifier to a string.

 @examples[#:eval eval
           (identifier->string #'abc)
           (identifier->string #'+-*/@~*&%$)
           (identifier->string #'||)]
}
