The prupose of this repo is to work out how to have games-states. I tried a few differnt files:


```sh
# all implemented in a single file
nim c -r onefile.nim

nim c -r seperatefiles/main.nim
```

Currently, onefile works, but  I get this error on seperatefiles:

```
seperatefiles/main.nim(5, 1) Error: expression 'scene' has no type (or is ambiguous)
```