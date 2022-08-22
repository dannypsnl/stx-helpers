#lang scribble/manual
@(require (for-label syntax/identifier
                     racket/base)
          "eval.rkt"
          scribble/example)
@(define eval (make-eval 'syntax/identifier))

@title[#:style '(toc)]{identifier module}

@defmodule[syntax/identifier]

@; symbol/identifier mutual conversion
@defproc[(identifier->symbol [id identifier?])
         symbol?]{
 Convert an identifier to a symbol.

 @examples[#:eval eval
           (identifier->symbol #'revise)
           (identifier->symbol #'arc+)
           (identifier->symbol #'| - |)]}
@defproc[(symbol->identifier [sym symbol?]
                             [srcloc (or/c #f syntax? srcloc?) #f])
         identifier?]{
 Convert a symbol to an identifier.

 @examples[#:eval eval
           (symbol->identifier 'abc)]

 When @racket[srcloc] is provided, the srcloc of the result will follow the given.
 @examples[#:eval eval
           (define srcloc #'id)
           (symbol->identifier 'abc srcloc)]}

@; string/identifier mutual conversion
@defproc[(identifier->string [id identifier?])
         string?]{
 Convert an identifier to a string.

 @examples[#:eval eval
           (identifier->string #'abc)
           (identifier->string #'+-*/@~*&%$)
           (identifier->string #'||)
           (identifier->string #'| - |)]}
@defproc[(string->identifier [str string?]
                             [srcloc (or/c #f syntax? srcloc?) #f])
         identifier?]{
 Convert a string to an identifier.

 @examples[#:eval eval
           (string->identifier "abc")]

 When @racket[srcloc] is provided, the srcloc of the result will follow the given.
 @examples[#:eval eval
           (define srcloc #'id)
           (string->identifier "abc" srcloc)]}

@; identifier-append
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
                              #:srcloc srcloc)]}
