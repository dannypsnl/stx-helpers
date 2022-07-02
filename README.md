# syntax-extension

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
