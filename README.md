# stx-helpers

A helper collection of syntax.

### Installation & Usage

```shell
raco pkg install --auto stx-helpers
```

Example code

```racket
(require syntax/identfier)

(identifer->string #'abc) ; "abc"
```
