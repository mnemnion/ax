# Ax spec


This text specifies Ax, a cellular automaton for general purpose computation.

It is a work of mathematics in the public domain.


## Preamble 

```
  0   A noun is either an atom or a cell.
 
  1   An atom is any natural number.

  2   A cell is an ordered pair of nouns.

  3   Ξ  means to perform a rewrite as defined by this specification.    

  4   n  refers to any atom.  a, b, c, and d refer to nouns. 
 
  5   σ  refers to either 0 or 1, discovered at the moment of reduction.
 
  6   [a b c] → [a [b c]]

  7   →  shows the steps of a reduction.  All must be completed.

  8   ?  means the reduction is undefined.

  9   +  refers to the operation on the natural numbers, whose identity is 0.

 10   The lemmas are reduced in ordinary arithmetic.  m refers to any atom.

 11   Symbols have no other semantics.
```


## Reduction


### Axioms

```
Ξ [0]  →  Ξ [0]  

Ξ [0 0]  →  Ξ [0 0]

Ξ [0 0 0]        →   0

Ξ [0 1 0 0]      →   1    

Ξ [0 1 0 1]      →   2

Ξ [2 1 2 1]      →   3

Ξ [a 0 b]        →   b

Ξ [a 1 0 n]      →   n + 1 

Ξ [a 1 b]        →   Ξ [a b]   →   n   →   n + 1 

Ξ [a 2 0]        →   ?

Ξ [a 2 1]        →   a

Ξ [[a b] 2 2]    →   a

Ξ [[a b] 2 3]    →   b

Ξ [a 2 (b + b)]      →   Ξ [Ξ [a 2 b] 2 2]

Ξ [a 2 (b + b + 1)]  →   Ξ [Ξ [a 2 b] 2 3]

Ξ [a 2 b]        →   Ξ [a 2 b]

Ξ [3 3 [[2 1] [1 2 1]] [0 2 1]]   →   [3 4]

Ξ [a [b c] d]    →   [Ξ [a b c] Ξ [a d]]

Ξ [a 3 b c]      →   Ξ [Ξ [a b] Ξ [a c]]

Ξ [a 4 b]        →   Ξ [a b]   →   [c c]   →   1

Ξ [a 4 b]        →   Ξ [a b]   →   [c d]   →   0

Ξ [a 5 b]        →   Ξ [[a σ] b]  

Ξ [a 6 b]        →   Ξ [a b]   →   [c d]   →   1

Ξ [a 6 b]        →   Ξ [a b]   →     d     →   0

```


### Idioms

```
Ξ [a 7 b c]        →    Ξ [a 3 b 0 c]

Ξ [a 8 b c d]      →    Ξ [a b] → 1 → Ξ [a c]

Ξ [a 8 b c d]      →    Ξ [a b] → 0 → Ξ [a d]

Ξ [a 9 b c]          →    Ξ [a 7 [[7 [2 1] b] 2 1] c]

Ξ [a 10 b c]       →    Ξ [a c]

Ξ [a 10 [b c] d]   →    Ξ [a 9 c 7 [2 3] d]

Ξ [a 11 b c]       →    Ξ [a 7 c 3 [2 1] 2 b]

```


### Lemmas

```

Ξ [a 12 b]  →  Ξ [a b]  →    n    →  n - 1

Ξ [a 12 b]  →  Ξ [a b]  →    0    →  Ξ [12]

Ξ [a 13 b]  →  Ξ [a b]  →  [n m]  →  n + m 

Ξ [a 14 b]  →  Ξ [a b]  →  [n m]  →  n - m

Ξ [a 14 b]  →  Ξ [a b]  →  [n m]  →  n < m  →  Ξ [14]

Ξ [a 15 b]  →  Ξ [a b]  →  [n m]  →  n * d

Ξ [a 16 b]  →  Ξ [a b]  →  [n m]  →  n / m

Ξ [a 16 0]  →  Ξ [a b]  →  [n m]  →  m = 0  →  Ξ [16]

Ξ [a 17 b]  →  Ξ [a b]  →  [c d]  →  m = c + dn → m

Ξ [a 18 b]  →  Ξ [a b]  →  [n m]  →  n <= m   →  1

Ξ [a 18 b]  →  Ξ [a b]  →  [n m]  →  n > m  →  0

```


### Crash default

```
Ξ [a] → Ξ [a]
```


## Expansion

```
TBD
```



## Afterword: Thanks


This work would be impossible without the monumental efforts of Curtis Guy
Yarvin. In turn, his work cannot be imagined without that of three
Johns: von Neumann, Conway, and McCarthy. I will thank John Nash also,
for personal reasons.

I would like to thank Josh Lauffer, my teacher in the Kabbalah, who instilled
a lifelong interest in the inherent properties of natural numbers. 

A special shout-out to Al, to whom much credit must incur, indeed.


#### Version 60K



