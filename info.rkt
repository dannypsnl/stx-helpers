#lang info
(define collection "syntax")
(define deps '("base"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"
                                    "sandbox-lib"))
(define scribblings '(("scribblings/syntax-extension.scrbl" (multi-page))))
(define pkg-desc "Description Here")
(define version "0.0")
(define pkg-authors '(dannypsnl))
(define license '(Apache-2.0 OR MIT))
