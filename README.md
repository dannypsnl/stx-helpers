# syntax-extension

[![CI](https://github.com/racket-tw/syntax-extension/actions/workflows/ci.yml/badge.svg)](https://github.com/racket-tw/syntax-extension/actions/workflows/ci.yml)
[![Coverage Status](https://badgen.net/https/racket-tw.github.io/syntax-extension/coverage/badge.json)](https://racket-tw.github.io/syntax-extension/coverage)

An extension of `syntax` module.

### Installation & Usage

```shell
raco pkg install --auto syntax-extension
```

Example code

```racket
(require syntax/identfier)

(identifer->string #'abc) ; "abc"
```
