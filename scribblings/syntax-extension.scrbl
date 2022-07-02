#lang scribble/manual
@(require (for-label syntax/identifier
                     racket/base)
          racket/sandbox
          scribble/example)

@title{syntax-extension}
@author{dannypsnl}

@defmodule[syntax/identifier]
@(define eval
   (parameterize ([sandbox-output 'string]
                  [sandbox-error-output 'string])
     (make-module-evaluator '(module m racket/base
                               (require syntax/identifier)))))

@defproc[(identifier->string [id identifier?])
         string?]{
 Convert an identifier to a string.

 @examples[#:eval eval
           (identifier->string #'abc)
           (identifier->string #'+-*/@~*&%$)
           (identifier->string #'||)]
}

@defproc[(string->identifier [str string?]
                             [#:srcloc srcloc (or/c #f syntax? srcloc?) #f])
         identifier?]{
 Convert a string to an identifier.

 @examples[#:eval eval
           (string->identifier "abc")]

 When @racket[srcloc] is provided, the srcloc of the result will follow the given.
 @examples[#:eval eval
           (define srcloc #'id)
           (string->identifier "abc" #:srcloc srcloc)]
}

@defproc[(identifier-append [ids identifier?] ...
                            [#:srcloc srcloc (or/c #f syntax? srcloc?) #f])
         identifier?]{
 Concat multiple identifier into one.

 @examples[#:eval eval
           (identifier-append #'ab #'c)
           (identifier-append #'hello #'- #'world)]

 When @racket[srcloc] is provided, the srcloc of the result will follow the given.
 @examples[#:eval eval
           (define srcloc #'id)
           (identifier-append #'hello #'-world
                              #:srcloc srcloc)]
}
