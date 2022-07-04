# syntax-extension

[![CI](https://github.com/racket-tw/syntax-extension/actions/workflows/ci.yml/badge.svg)](https://github.com/racket-tw/syntax-extension/actions/workflows/ci.yml)
[![Coverage](https://badgen.net/https/racket-tw.github.io/syntax-extension/coverage/badge.json)](https://racket-tw.github.io/syntax-extension/coverage)
[![Doc](https://badgen.net/badge/doc/published/blue)](https://docs.racket-lang.org/syntax-extension)

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
