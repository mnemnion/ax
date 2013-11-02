#Commentary on the Ax spec.

## Preface

There are 720 valid [Nock machines](http://www.urbit.org/2013/08/22/Chapter-2-nock.html), defined as any 
cellar automaton which provides a mapping from the Nock rewrite rules to any one of every digit of set {0..5}. Since
one of them is actually called Nock, let's call the permutation group Conk. 

2 of them are Ax machines, or would be, minus the `fz` operation. That is, there are 2 Conks which 
have the same mappings for `0`, `1`, `2`, and `3`. There are actually 6 Ax machines, 2 of which have the
same axioms as Nock machines; we may consider those two as Nock equivalent, by permuting `fz` above the Nock 
(proper) threshold of 10. By the same simple mathematics, there are 5040 possible Conk-compliant machines
computationally equivalent to Ax, Nock not among them. We will call this permutation group Xa, for what
other choice do we have? 

6 is a small enough number to consider in entirety. The only bit that is arbirary is the range on sigma,
which is only arbirary if you're not an extant silicon computer. 

I am convinced Ax α is the best possible choice among the 6. I hope to demonstrate that here. 

There are an infinite number of cellular automata. Conk machines are a class. Ax machines are an interesting
subclass, disjoint by one member. 

## Rationale.

Ax is even weirder than Nock, because it never terminates. In order to calculate Ax, you must use a certain amount of judgement. 

Ax is recursively self defined. Absolutely every valid rewrite may be performed, in a metacircular fashion, and the expansions are defined in terms of each other as well as the reduction. As in Go, you must apply the Ko rule to infinite loops: if you may continue to play, you should continue to play.

A trivial loop, such as Ξ [a] -> Ξ [a], is like a game where the only remaining moves are Ko. The polite thing is to pass and count the board. In Ax, as in Nock, this is our only form of error. 

Note that detecting all cases of Ko without arbitrary calculation is of course the halting problem. In practice, an Ax interpreter may be made into a Nock interpreter by dispatching on a subset of the operators. 

Since you need the idioms, particularly `if`, to define many of the fundamental operators, the expansions are the second set of statements, after the definition. The definition says what the operators do, the expansions say how they could do it, given the available operators, and the ability to decide when you're tired and quit. 

It would be nice, and is probably inevitable, if all the non-trivial operations are visited within an expansion of 0. That way, you can type [0 0 0] into the reference Ax machine and it will not only run forever but repeatedly visit all definitions in doing so. 

Since a decent definition of 0 would could be Ξ [a 0 b] -> Ξ [[b a] 2 2] we should be good to go.

Oh the reference implementation? Scheme, of course. It is incapable of returning, though you're welcome to make a few changes if you want to see it do something. It does this in the best continuation passing style! Not that it exists. Instead, we have a demo machine in Lua.

## The Preamble

Compared to the Nock spec, this is enormous and pedantic. Compared to a representative work in the genre, it is haiku.

Xa space being a permutative superset of Conk space, the Ax preamble contains the Nock preamble, in its entirety, without modification.

Which is a marvel, by the way. Every time I've sniffed out an ambiguity or source of confusion, I have been wrong. Even lines six and seven may not be made to malfunction, despite strict operator overloading. Try it.

It is overloading, however. [1 + a] would be [[1] +*[a]], and *a crashes. But it doesn't say [1 + a], does it.

Arguably, our symbol definitions, despite being English, are equivalent to the pseudocode. And indeed our generalized rules, being only one reduction longer, are shorter, line for line,  than the pseudocode plus the reductions. Not counting brackets, Nock uses seven symbols, overloads one, and has four variables. We use six symbols, no overloading, five variables, and need an extra symbol to define our extra operator. 

We also have the expansions, or will. Which I feel add a certain esprit to the spec. 

It is a little confusing, if conventional, that 'a' is either an atom or a cell, while 'n' is definitely an atom and definitely not the other sort of noun. I trust the reader to follow along, and using "a" for atom and "b c d e", while cool, would add impedence to both understanding the Ax spec per se and comparing it to the Nock spec. 

It's not so bad, really. We also need an additional clarification that partial expansions of a line are not allowed. 

##Mythos.

So here's how you read Ax. You've been captivated by alien intelligence, who have sat you down in front of something suspiciously resembling a vintage VT100 terminal. You receive the preamble, and the term. The cursor blinks.

There doesn't appear to be any way out of this...pod, Tardis, what have you. Though it is made up in a somewhat surreal and misguided parody of human habitation, you're not sure that the fruit is edible, and don't want to find out. 

Well, what would you type? You're not a chump, if they wanted to use your letters they'd speak your language. Plus, they just told you "numbers". Practically shouted it. 

So you type zero, and get an infinite loop. Let's try a cell of zeros: nope, crashes. Well, a cell can be composed into two cells and ok, we have a zero back.

Which one did it return? You could just bang away at the keys but this is a delicate operation. [0 1 0] is an infinite loop, [1 0 0] produces 0, [0 0 1] produces..one. Can we do anything else coherent with ones and zeroes? 

It appears we can: [0 1 0 0] produces 1 also, but for what reason? A bit of experimentation discovers that [0 1 0 1] produces the all important 2. We can in principle make any number now, which is nice, but still feels a bit like cheating, because we're using the command line, not the computer. [0 1 0 1 0 1] is a syntax error, but [1 0 1 0] produces... [1 0]. Interesting, but reductive, though serving to
confirm what we might already suspect. 

On a hunch, you type [2 1 2 1]. The screen fills with endless columns of cellular numeric data, prettily colored, and looping in a way that looks alarmingly like a refutation of the problem with halting. It then halts, executes an impressive screen fade quite impossible on a real VT100, and then helpfully types [2 1 2 1] for you once more. This time, it simply returns 3.

Everything else you need to know is in the guts of the core dump. Congratulations, space cadet. <3 <3 !

You may notice that in Ax, trees are built up from numbers. The feeling is one of open-ended discovery. The computation
branches out fractally, resolves itself in some mysterious way at the limit, and returns a form. A fundamental axiom guarantees 
non-deterministic behavior. In Nock, numbers are derived from nouns, choices are absolute, and your result is either error or 
truth.

##Axioms

### Zero

`0` is the identity operator, `is`. There are two operations that are closed over the monoid of the natural numbers, addition and multiplication. Of them, multiplication is consequent. In the operation of addition, 0 returns the identity. If you have any number, you may now return it. You now have `0`, and may return it: Ξ [0 0 0] -> 0

### One

`1` is the increment operator, `up`, as premised in the preamble. If you have a number, and you now have 0, you may increment it. 
Ξ [0 0 1 0] -> 1

### Two

`2` is the branch operator, `br`. I like slot, but we normally call those branches, and I count six English pronunciations for `slt`, one of them distasteful. You need `0`, `1`, `2` and `3` to define `br`, but you can use `1` and `2` to produce 3. `mod` being explicitly provided, we may write an expansion that actualy runs quite servicably. The Nock spec provides no way to factor `a` into `a + a`, nor to determine which of lines 15 or 16 to apply. This does not detract from its correctnesss, these are very ordinary operations on the `natural number`s.

Branch *selects* a branch, it does not *cause* one. Branch/forking happens in the same two ways in Ax as in Nock, because Ax is a Nock machine. Note that `br` on branch `0` (to apply `br` is to 'graft' the subject and return a branch from it) is not a syntax error, but rather, undefined. It may be a syntax error if you wish, or produce a noun, which is a common anticipated use. It may even produce an effect, but that would be crazy. The spec doesn't say, though; grafting on zero means your code is not deterministic. Crashing is the best idea if you don't know what else to do. 

Note that so far, we have halting rules and trivial crashes only. Next comes the distribution rule, which gets us most of the way there,
and then the explicit recursion rule, `ax`. These **cause** branches, and composing that ability with `br` raises the bar. 

How many operators does it take to write an infinite loop? I am curious, without the time to explore the question. I predict the set will be low ordered with respect to Ax. Consequently it will be composed of the operators 0..4, inclusive, likely without 4. We'll see. 

### Three

`3` is the ax operator, `ax`, which Nocks a noun apart and evals it. The symbol `nck` is also reserved for this operator, en homage. Why 3? Well, that's a digression, while I'll gloss over. 

Consider that there are two ways to index: by zero, and by one. What if you want to contain the damage? Well, you could count (0|1) (1|2) (2|3) 4 5 6, or (0|1) (0|1) (2|3) (3|4) 4, 5, 6. The latter is taxing on our already strained resources. 

In certain circles this difficulty is referred to as the "Abyss". My solution to this difficulty is suggested by ancient texts but the interpretation is to my knowledge completely original. We are all fairly certain the mystery involves both 3 and 11. Let's leave it at that for now. 

`ax` could be 2, but `br` could not be 3, or we would have [2 1 3 1], and where did that three come from? Also, branch on address 3 is not defined in the reductions. 

Note that both the distributive property and `ax` may safely be made parallel once the cell to calculate both branches is composed. Indeterminate, mutually dependant behavior may be arranged only through abuse of the `0` branch and the `put` operator, in the usual fashion. 

### Four

`4` is the `eq` operator, which returns 0 if the evaluated cons(subject,object) is equal and 1 if it is not, crashing on an atom. 

Why is four `eq`? Well, it's our first non-prime operator, if you accept the case that 0 and 1 are neither prime nor non prime. They have a special relationship with multiplication that makes that case plausible; certainly I was taught the primality of one, though the field would appear to have changed its mind. 

It could be `cel`, but as we'll see, `cel` should not be 4. `eq`'s expansion may be thought of as having an 'even' test or a 'double even' test, that is, it `if`s on `cel` (though of course, the reduction does not). If 'odd', test atomic equality, if 'even', apply `cel`. 
Note that all even-numbered operators and idioms have exactly two expansions, that is, they are higher order branching. Even `put` is capable of branching, depending on implementation.

### Five

`5` is the `fz` operator, one of the raisons d'etre for Ax versus Nock. 

Note that in Plan Ax from Conk Space, 5 is `cel`. 

Fully qualified Ax machines are not deterministic, because they aren't colorblind. In addition to Black and White bits, Ax machines must supply Red bits, which are completely different because they come from an actual, high quality source of entropy. Note that, while weird, this is just as well formed as saying "an actual, high quality source of numeric computations", in that you can just hop on the Internet and buy one. Ax machines must have both.

This is why `fz` must be an operator, not a lemma. The Second Law of Thermodynamics is taken as axiomatic for our purposes; within the specification, the method of selecting on the range is deliberately left unspecified.

The demonstration Ax machine uses Pink bits, which are only pseudorandom. This is strictly not compliant, for the purposes of a reference implementation, but I'm in a hurry. Feel free to use Pink bits if you're just futzing around, but consider making or buying a gig or two of entropy, or picking up an entropy machine. Cheap stuff, entropy, these days. Remember to throw it away as soon as you're done with it: the first rule of handling entropy is: any operation whatsoever upon it render it **and any copies** no longer entropic. 

Because we have a term, not just a preamble and definition, there are an infinite number of possible Ax machines, even Ax α machines. Ours is Ax α 256, aka Ax Byte. The beautiful, Schemish Ax is Ax Bit, of course, but it may easily be emulated with modulo 128, whereas simulating the reverse transition is particularly tedious. 

A ternary machine would draw on nine trits of entropy, or whatever. Ax is meant to be used. 

`5` has several expansions, for, among other reasons, compatibility with Hoon. Any Conk runs find on a Xa, but for safety, we have 
an Ax rule that that takes a `fz` result and `puts` it away, `is` ing a 0 instead, and then using the 0 to `is` the subject. Turning it into a no-op. Anything `fz` `mul` `is 0` will return 0, another convenient way of ignoring entropy. Lastly, one may expand `fz` by checking `br 0` for `1` or `0`, discarding the result in the former case; this may easily be implemented as an on-off switch for an 
indeterminate function.

Lastly, note that randomness is not mentioned in the spec. It is actually perfectly valid for `fz` to return any number in the range: you may rewind Ax and play it again, or feed it nothing but 128 in all cases, or 0, or anything else you'd like. The treatment of `5` and `br 0` distinguishes the actual semantics of an Ax machine, as they introduce indeterminacy into the result. 

Why 5? Zod, where else would you put it? 

Note that we may generate 6 with Ξ [4 5 [2 3]]. Eventually, or immediately, depending on the Ax machine. This is considered beneath demonstration.

### Six

`6` is the cell operator, `cel`. It returns 0 for a cell and 1 for an atom, as you might expect. Symbols are inspected in this case to see what kind of noun they represent. 

Why six? Well, there are two important kinds of cells in Ax, [a b] and [a b c], as defined in the preamble. There are two groupings of six, [[1 1] [1 1] [1 1]] and [[1 1 1] [1 1 1]]. If you immediately recognize those are syntax errors, you're doing great. Happily, Ax is blessed with exactly three relevant data structures, as shown by the first three lines of the reduction: atoms and two cells, which may not be Axed, and 3 cells, which are n cells, and which may be Axed in some cases. 

Those are the axioms. I am totally convinced of 0, 1, 2, and 3, which define Ax space within Conk space. I am pretty sold on 4, 5, and 6, and on the benefits of Xa space and the `a br 0` reduction of 2. 

The reasoning behind the order of the idioms is basically Kabbalistic. Surprise surprise, that is the reasoning behind Ax space too. It just **happens** to look like a Page from the Book, as Erdős Pál would say. 

## Idioms

Nock calls these macros, and defines them as such, though we are advised by the Crash Course that there's no reason to implement them this way. In Ax we call them idioms, indicating that they may be expanded as macros containing only the axioms. For the reduction, sometimes we do, sometimes we don't, whatever's cleanest. Since we have expansion rewrites as well as reductions, anything may be written as a macro, as long as you're not in a hurry to halt. 

`7` is `cmp`, which composes functions, and which, through happenstance, ended up in the same place as in Nock. We're in Netzach, if you're paying attention.

`8` is `if`, `9` is `cnk`, `10` is `put` and `11` is `arm`. `if`, `cnk` and `arm` work like 6, 8 and 9 from Nock, because they're identical except for the necessary permutations. `put` has the same syntax as the other `10`, and identical semantics: the results are undefined, other than that evaluation must happen if a cell is provided. We don't plan on using this for hinting, but if we're running Hoon 191, what other option do we have? 

`put` fits nicely in `10`, because it's `0` all over again, having the same meaning for the purposes of the Arc of code under evaluation. The interaction between `put` and `br 0` is envisioned as a crucial mechanism in the larger Arcitecture. 

I could make a firm case for `dec` as consonant to `inc` and `arm` as consonant to `br`, giving an opposite mapping. But the lemmas come after the idioms, and `dec` is clearly a lemma, and that is that. Certainly, the Nock tutorial shows that `dec` may be (somewhat) compactly specified in terms of the axioms.

##Lemmas 

Ax comes equipped with the operations you'll need to have a reasonable Big O on integer algorithms.

You're welcome.

##Distinctions between Nock and Ax.

There are four changes between Nock and Ax: the permutation of the operations, the addition of `fz`, `br 0`, and the `put` operator, to list them in order of seriousness. I have made the case, I believe, that the permutations put the jewel in the heart of the lotus. Perhaps we merely gild the lily. This is a matter of taste, not semantics, but without taste, Nock is pointless. I have devoted a number of paragraphs to `fz` already. Let's discuss `br 0` and `put`.

`br 0` provides for a very simple and ordinary thing: a number that comes from Outside, that we can only determine if we go and look. A port, say, or a sensor. I don't know how Hoon deals with this, but I know that Nock does not handle it at all. Ax does: you can hook a very simple piece of Ax up to a sensor and do things with the numbers. I consider this a virtue in a toy computer, and the zero branch was just sitting there being undefined. 

I suggest a pleasant detour over to [Undefined Intimacy With the Machine](http://thoughtmesh.net/publish/367.php). It is not only a product of the Cathedral, it is from a field of **critical studies**, called code studies, of course. This guy is right out on the bleeding edge, my friends. 

Not all code talks to Outside, but most code comes from Somewhere, and sometimes Somewhere might want to drop a noun or two into the mix. I gather this isn't what you do with Nock, and again, I bet Hoon provides it. The thing is that Ax machines make no assumption that the whole system is going to be running on one core, in fact they're decidedly more comfortable if that is *not* the case. 

Could we run Ax machines on a ColorForth array? Zod man, what else are they good for? The Parallela is a less exotic target; if you know any OpenCL, the interaction between `br 0` and `put` might be putting you in mind of a "kernel". Excellent! We're on the same page. 

Why do we need `fz` though, with all this Undefined Intimacy going around? Well, because of the Rules of the Red Bit, basically. An undefined number is going to be some combination of Black and White when you look at it. A Red Bit is already Black or White, but it got that way in a very special manner, and you're not allowed to look at it (though you may copy it) or it's not Red anymore. Not to mention that sealed functions that use `fz` make perfect sense and should be allowed, and a function either crashes on `br 0` or does something special with it, but not in general both. 

`fz` is axiomatic, and we kind of force you to write your code in weird ways if you absolutely want to be sure it never comes up. It's a feature! We call it guessing, and have this notion that it makes for cheap machine learning. We hope a group effort can come up with some good uses. 

What about this `put` business? Well, we like the algebraic feature of Ax a lot. We don't need hints, because it's quite normal for Ax code to come with both embedded symbols and a table containing expansions for the symbols, as well as jets for the assisted ones. In a mature environment, we scrub this of any taint of variability and anonymize everything, so your `foo` and my `foo` will be different even if they happen to be equal (minus yet another layer of abstraction!). As it stands, AxUM is a single computation and all symbols must be distinct and have singular expansions. 

We do have code with identical semantics, which seems like an odd choice if we're forsaking hints. Here's one good reason: Ax goes to great lengths to be in principle Hoon and Nock compatible. It's just respectful, and if there's to be a transition, let's ease the pain, or delay it insofar as possible.

In fact, use of `put` will also not affect the semantics of your running code. If you're in some kind of compatibility mode, you may even find that the use of opcode 10 provides pleasant jet assistance to your calculations. This is not our intended use case: `put` is the other side of `br 0`.

Without going into detail that will probably prove wrong, `br 0` and `put` define address spaces "above" and "below" the Arc of Ax code that is executing. Nock is Hermetically sealed, which is a virtue; `br 0` and `put` provide a formal, very low-level- mechanism for building plumbing between Ax vessels. 

Getting this right will be the true test of the Tree of Life on this machine. The Tree is recursive, fractal, heirarchical, and mnemnonic, among other qualities, all of which comes into play.

Importantly, this is defined at a higher level. It will be the canonical way to link Ax machines together, but is not part of the semantics of the machines themselves, on purpose. They're really quite small. 

The main reason for this is that the intricacy of these address spaces will make them in effect kernel-level abstractions. They will end up just as frozen as Ax will, but consequent to that, and with a longer annealing phase. 


##Philosophy

Well and good, and we all love an elegant mathematical structure. What's the purpose of some of this? Why an Ax machine, which is inductive, nondeterministic, and redundant, versus a Conk machine, which is crisp, deductive, and minimal?

It's not an idle question. There are two Conks with the elegance of the Ax machine, which are Ax α with operator 5 replaced with one of the two possible options. Why choose induction and expansion over deduction and reduction? Why even offer the choice? Usually, 
we choose computers that are known to halt on problems which are known to halt. 

Well, Ax isn't quite that bad. It has a Ko rule, after all. There are two cases to be made, one from elegance and another from utility.

Without expansions, one may not generate the full set of possible operations from a seed. This is a beautiful property in a system, if you're me, and since the expansion Ξ [0 0 0] -> Ξ [0 2 1] may yield (I am convinced) the other operators, it is a beautiful seed for a beautiful system. This is sufficient justification for the automaton; what is mathematics if not elegance, nor elegance if not a species of beauty? 

Utility is perhaps harder to see, but imagine an aging computer in a hostile environment. Though it has megas of cores, many are infected and firewalled, others punctured by radiation or otherwise deranged and useless. The ability to expand a failed reduction may save a calculation, and that's no minor thing. A failed or malfunctioning jet may be similarly unit tested against its expansion, fractally and repeatedly, and substitutes checked for correctness in the same way. 

So that's the Ax machine. Maxwell's equations build each on the others, as Euclid's Axioms, as the Laws of Motion and Thermodynamics. With the Ax ordering of Nock, the operators produce their own sequence. Quod Erat Demonstrandum.
