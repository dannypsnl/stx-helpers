#lang scribble/manual
@(require (for-label syntax/list
                     racket/base)
          "eval.rkt"
          scribble/example)
@(define eval (make-eval 'syntax/list))

@title[#:style '(toc)]{list module}

@defmodule[syntax/list]

@defproc[(stx-length [stx syntax?]) (or/c integer? #f)]{
 Get the length of syntax if it's list-like syntax, or returns @code{#f}.

 @examples[#:eval eval
           (stx-length #'(1 2 3))
           (stx-length #'(a b (c d) e))
           (stx-length #'a)
           (stx-length #'())]}

@defproc[(stx-length=? [left syntax?] [right syntax?]) boolean?]{
 Compare the length of left and right is different, and notice if one of left or right is not list-like syntax, than the result is always @code{#f}.

 @examples[#:eval eval
           (stx-length=? #'(1 2 3) #'(a b c))
           (stx-length=? #'(1 2 3) #'())
           (stx-length=? #'(1 2 3) #'a)
           (stx-length=? #'a #'b)]}

@defproc[(stx-length<=? [left syntax?] [right syntax?]) boolean?]{
 Just like @code{stx-length=?} but for @code{<=} relation.

 @examples[#:eval eval
           (stx-length<=? #'(1) #'(a b c))
           (stx-length<=? #'(1 2 3) #'())]
}
@defproc[(stx-length>=? [left syntax?] [right syntax?]) boolean?]{
 Just like @code{stx-length=?} but for @code{>=} relation.

 @examples[#:eval eval
           (stx-length>=? #'(1) #'(a b c))
           (stx-length>=? #'(1 2 3) #'())]
}
