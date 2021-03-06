# Ax spec

This text specifies Ax, a cellular automaton for general purpose computation.

It is a work of mathematics in the public domain.


## Preamble 


```
 0   A noun is either an atom or a cell. An atom is any natural number.

 1   A cell is an ordered pair of nouns.
 
 2   n refers to any atom. a, b, c, and d refer to nouns. 

 3  `Ξ` means to perform a rewrite as defined by this specification.    

 4  `→`  shows the steps of such a reduction. All must be completed.

 5  `?`  means the reduction is undefined.

 6  `:=` indicates a noun is the referent of a symbol.

 7  `+`  refers to the operation on the natural numbers, whose identity is 0.

 8  `~`  requires that n so defined be in the range (n1..n2), inclusive.

 9   [a b c] → [a [b c]]

 10  Symbols have no other semantics.
  
 11  The lemmas are reduced in ordinary arithmetic; c and d refer to atoms.
 
```


## Term


```

~(0..1) := σ 

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


### Crash default


```
Ξ [a] → Ξ [a]
```


### Lemmas


```

Ξ [a 12 b]  →  Ξ [a b]  →    n    →  n - 1

Ξ [a 12 b]  →  Ξ [a b]  →    0    →  Ξ [12]

Ξ [a 13 b]  →  Ξ [a b]  →  [c d]  →  c + d 

Ξ [a 14 b]  →  Ξ [a b]  →  [c d]  →  c - d

Ξ [a 14 b]  →  Ξ [a b]  →  [c d]  →  c < d  →  Ξ [14]

Ξ [a 15 b]  →  Ξ [a b]  →  [c d]  →  c * d

Ξ [a 16 b]  →  Ξ [a b]  →  [c d]  →  c / d

Ξ [a 16 0]  →  Ξ [a b]  →  [c d]  →  d = 0  →  Ξ [16]

Ξ [a 17 b]  →  Ξ [a b]  →  [c d]  →  c % d

Ξ [a 18 b]  →  Ξ [a b]  →  [c d]  →  c < d   →  1

Ξ [a 18 b]  →  Ξ [a b]  →  [c d]  →  c >= d  →  0

```


## Expansion


### Terms


```
7 operators

0  := is
1  := inc
2  := br
3  := ax
4  := eq
5  := fz
6  := cel

5 idioms

7  := cmp
8  := if
9  := cnk
10 := put
11 := arm

7 lemmas

12 := dec
13 := add
14 := sub
15 := mul
16 := div
17 := mod
18 := lt
```

### Expansions


```
Ξ [a 12 b]  →  Ξ [b [cnk [is 0] [cnk [is [if [eq [br 7] [up br 6]] [br 6] [arm 2 [[br 2] [up br 6] [br 7]]]]] [arm 2 br 1]]]]

etc.

```



## Afterword: Thanks


This work would be impossible without the monumental efforts of Curtis Guy
Yarvin. In turn, his work cannot be imagined without that of three
Johns: von Neumann, Conway, and McCarthy. I will thank John Nash also,
for personal reasons.

I would like to thank Josh Lauffer, my teacher in the Kabbalah, who instilled
a lifelong interest in the inherent properties of natural numbers. 

A special shout-out to Al, to whom much credit must incur, indeed.


#### Version 61K



