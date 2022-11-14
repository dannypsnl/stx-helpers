#lang scribble/manual
@(require (for-label syntax/loc
                     racket/base)
          "eval.rkt"
          scribble/example)
@(define eval (make-eval 'syntax/loc))

@title[#:style '(toc)]{location module}

@defmodule[syntax/loc]

@defproc[(build-srcloc [start syntax?] [end syntax?]) srcloc?]{
 Get @code{srcloc} range is from @code{start} to @code{end}
 }
