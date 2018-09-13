# Ax


> Whence it is that the ultimate laws of Logic are mathematical in their
> form; why they are, except in a single point, identical with the general
> laws of Number; and why in that particular point they differ;– are questions
> upon which it might not be very remote from presumption to endeavour to
> pronounce a positive judgment.  Probably they lie beyond the reach of our
> limited faculties.  It may, perhaps, be permitted to the mind to attain a
> knowledge of the laws to which it is itself subject, without its being also
> given to it to understand their ground and origin, or even, except in a very
> limited degree, to comprehend their fitness for their end, as compared with
> other and conceivable systems of law.
>
>   -- George Boole, _An Investigation of the Laws of Thought_


We concern ourselves today with this question: what is the most suitable representation for a computation? Does one such exist? If so, how would we know if we had found it?

I do not claim to have found it. That is a strong claim, here I make a weaker claim: that there is a property, which I will call consonance or sometimes clarity, that allows us to weakly order computing engines, and that by that property, Ax is the most consonant system of computation of which I am aware.

Ax extensively derives its formal structure from [Nock](http://urbit.org/docs/nock/). Nock is a formidable work of mathematics, put forth as a piece of system software; much as a caryatid may succeed both as art and as architecture, Nock succeeds in being both.

cgy (this is an honorific style in our culture) is [suspicious of mathematics](https://unqualifiedreservations.wordpress.com/2007/08/02/whats-wrong-with-cs-research/). This is an understandable error, but error it remains. We had the good fortune to be born just in time for the great wave of microprocessor technology to wash over our civilization. Part and parcel of this was that the really juicy, good and useful mathematics was done by engineers with graphite on their sleeves, slide rules, and great fanfold sheets of printed code.

This is not to denigrate the [Bourbakis](https://en.wikipedia.org/wiki/Nicolas_Bourbaki) of the world. No doubt when things calm down a bit, we can sift through postwar mathematics looking for the nuggets of insight. They retreated into a private language, and I'm willing to grant that may have been necessary for their work.

Will any of it ever have the impact on human civilization as, say, Dijkstra's pathfinding algorithm? I would wager it will not.

Dijkstra himself was emphatically a mathematician. Would we say the same of Ken Thompson and Rob Pike? Of course not, they are engineers. Yet the [UTF-8 encoding](https://en.wikipedia.org/wiki/UTF-8#History) is poised to be the very substance of human language for as long as our civilization lasts. The great work of unifying all systems of writing, undoing at least one small fraction of the disaster at Babel, or, if you prefer historicity to metaphor, succeeding for the first time in this great cause; if this is not mathematics, what then *is* mathematics? If you don't see a [Page from the Book](https://en.wikipedia.org/wiki/Erdős_Pál) in the encoding diagram for UTF-8, dear Reader, venture elsewhere. You're not going to like the rest of this.

The actual encoding of Unicode onto the bits and bytes is fairly good engineering, all things considered. Like all engineering, it is riddled with compromise, partial backwards compatibility, rancorous dispute, and all manner of path-dependent weirdness. As a glance at the Wiki will show, the 6-byte UTF-8 is the true UTF-8, and we are presently burdened with a paltry 21 bits of encoding for [no good reason at all](http://unicode.org/). That this is a mistake, when designing a living standard with a one-way ratchet which admits mappings but cannot expel them, is a point I consider evident.

To return to our topic, Nock is presented as foundational system software, [Urbit](https://urbit.org) as an existence proof of its fitness to purpose. Very well, but [EBCDIC](https://en.wikipedia.org/wiki/EBCDIC) was fit to IBM's purpose also. Is Nock an EBCDIC or is it the real-deal UTF-8?

Where the success of Urbit is concerned, cgy is a pig and I am a chicken. You see, one day the chicken said to the pig, "Let's open up a diner. We can call it Ham and Eggs". The pig said "Ehhh, I don't know about that. Sounds like you're just invested, but I'm committed". I wasn't the chicken in the anecdote, don't know which Tlön investor was, regardless, I have laid my egg, and received my Dukedom, in the form of the [carrier](https://en.wikipedia.org/wiki/Aircraft_carrier) Emperor [Constantine](https://en.wikipedia.org/wiki/Constantine_(disambiguation)), now transformed into seat 12 on the [Galactic](https://urbit.org/~~/posts/constitution/) [Senate](https://en.wikipedia.org/wiki/Roman_Senate), all of which appeals to my roleplaying sensibilities. Curtis is all in; one senses he feels the fate of the world may rest on his shoulders, and who is to say it doesn't. In any case, he must either bring home the bacon, or become it.

I find myself in this peculiar position because I was promised [Maxwell's Laws of Software](https://moronlab.blogspot.com/), the firm foundation on which we may at last rest a computational edifice which actually makes sense. The better comparison is to the [Elements of Geometry](https://en.wikipedia.org/wiki/Euclid%27s_Elements), four axiomatic propositions which remain true, and one which remains good, thousands of years after their release into the wild.

Curtis finds himself here because he believes he has found them. I believe he came very close. A confession: until I actually visited Tlön in late 2013, I harbored a suspicion that Curtis had permuted the operators of Nock as a test. At the time he was awarding Dukedoms as prizes for implementing decrement in Nock, and it seemed at least possible he was playing his cards close to the vest, to see if anyone else would notice. Perhaps he published a hash of the true Nock to a blockchain, as a reveal that he had priority.

This is still possible; due to the loobean nature of Nock (which reminds me of nothing so much as Pig Latin), and Ax's faithful attempt to remain compatible with it, the structure of Ax can perhaps admit of further improvement[*]. It's not the sense I'm getting, and I'll proceed as though Tlön in general considers Nock to admit no further improvement, and is building Urbit upon it on that basis. This is all complicated by the urgency a startup must feel to bring its product to market, and certainly I share their sense of mission. But the Laws of Software!

So I will make the case for Ax as clearly as I am able. I will make no great effort to separate that which Nock and Ax have in common from that which is distinct to Ax alone, though there will be the occasional discursion to discuss points of divergence. Anyone with the interest to examine them both will realize the great debt Ax owes Nock, and get a sense of the relative difficulty of the two achievements. Dig deeper, and you will find it's giants upon giants, all the way down.

[*] This realignment of Ax with the [Boolean logic](https://barpub-tarber.urbit.org/maths/boolean/) has been performed, and this decision is reflected in the rest of this document.


## Ax


Ax is a computational automaton, based upon a formalism called a `noun`. Automaton, meaning its reductions are mechanical; we simply go down the list of reductions, in order, performing the first one we are able, and do this repeatedly until we either have a noun that admits no further reduction, or until we find ourselves in a trivial loop and grow weary, or until the Universe runs out of syntropy with which to drive the mechanics further. Or we get bored. Whichever comes first.

It has a [specification](https://github.com/mnemnion/ax/blob/master/ax%20spec.md). What then of the genus, what is a computational automaton?

Computational because Ax exhibits a property called [Turing Completeness](https://en.wikipedia.org/wiki/Turing_completeness), meaning that in a certain important sense it is just as good as any other system with this property at performing all of the subset of mathematics called finite, or discrete. This is a useful subset, as it can be used through further abstraction to perform, or at least represent, any mathematical formalism at all. We now know that certain properties, particularly the logical consistency of those mappings in all cases, may not be proved; yet this fact has proven less devastating to the mathematical project than it first appeared.

Now, there are many automata which exhibit Turing Completeness, a further result we call [Turing Equivalence](https://en.wikipedia.org/wiki/Turing_equivalence). Properly speaking this means each of these systems may simulate any other, thus their power is in one important sense equivalent.

They are not in fact equal. Mathematical pranksters of a certain bent delight in designing [esoteric](https://esolangs.org/wiki/Ax) Turing Machines which may be, with great difficulty, compelled to perform computations. This is great sport, but we don't use these machines for practical purposes, because they have a tendency to be slow, and are difficult to reason about by design. The latter is by far the greater flaw; as we will show, if we can reason about a slow computation, and be confident in our reasoning, we may often [replace it with a fast one](https://en.wikipedia.org/wiki/Rewriting), and no one the wiser.

Another way in which they differ is in their danger to the user. Wouldn't you know it, Alan Turing again: these systems have a property called [undecidability](https://en.wikipedia.org/wiki/Undecidable_problem), meaning in principle, and often enough in practice, you must run a computation to achieve its result. Many machines in this class are all too easy to undermine, presenting by subterfuge a computation which appears to want one result, but which in fact produces quite another; the exposure of your private key, for example.

There is a simple automaton, which, as hackers are nothing if not whimsical, we commonly refer to through a [vulgar combination](https://en.wikipedia.org/wiki/Brainfuck) of the organ of thought and act of generation. I will call it T, short for [Turing Tape](https://en.wikipedia.org/wiki/Turing_machine). T has an advantage over, say, the lambda calculus: it uses a flat array (the tape) containing a finite number of symbols, represented by natural numbers.

This last quality is important. From [Shannon](https://en.wikipedia.org/wiki/Claude_Shannon), we know that signal, at its most basic level, is either absent or present, and arrives in a specific order. These properties inexorably lead to a [mapping](https://en.wikipedia.org/wiki/Bijection) between the natural numbers and the symbols so transmitted, brushing aside questions of endianness, word boundaries, encoding and the like. The lambda calculus leaves us with no obvious basis to send and receive it. T gives us a sharp nudge in the right direction.

There is a further and deeper virtue in the use of natural numbers to stand in for the elements of computation. This virtue, and its proper expression, are the primary concerns of this treatise. We will introduce this aspect in the next section, because we will need it before we reach the demonstrations and reductions of Ax.

The trouble with T is that flat tape. It means the distinction between data and code is not structural. While it is possible in principle to write an abstraction over flat data space which is not subject to subversion, in practice, any mistake however mere is likely to open up an avenue for pwnage.

This is part of why we use a noun. The encapsulation has properties which make mistakes harder, more local. What we receive from the network is always flat, and what we emit may as well be. Requiring that it be acted upon only if it is a noun, and only as a noun, gives us a first layer of sanity, and a structure upon which to impose the next.

Ax does this without detracting from the simplicity of T. We gain elegance, we don't lose it. While the formal power is equivalent, the expressive power is of a higher order. A reasonable T may be written with eight instructions; Ax has 19, of which it requires six or seven. I prefer to construe it in the latter sense, for reason I will discuss in section five. Let us call it optional; it is certainly opinionated.

Which reminds me of a not-knock joke:

Knock, Knock.

Who's there?

Egg

Egg who?

C'mon lemme in

No, I value the contents

I don't get the yolk

Nope


## On the Nature of Number


The nature of computation is elusive. It has its origin in calculation, an ancient series of discovered rules for working with numbers. What distinguishes computation from mere calculation?

The natural numbers have three cases, three essential senses in which they are meant. The first case is the cardinal case, which we learn from pebbles and blocks as children. When we count pebbles, we start with one. Calculation shares a root with chalk.

The second case is the ordinal case, where we say, "this is the first", second, and so on. Note that we use a different set of words here, but they are so strongly linked semantically as to seem like tenses of a single term, one and first, second and two, three and third. Only the last, and those that follow, track with their sounds the meaning of the cardinal.

Zero is the correct first.

One is the correct second.

And so on. This was not evident, to put it mildly. In the Occident, until comparatively recent times, Zero was unknown as a cardinal quantity, as decimal representation was similarly unknown. Its place as the origin of the natural numbers was not fully elucidated until the nineteenth century, and the zero-index remains a stumbling block for every student of computation. Who among us has not committed a fencepost error?

Zero's position as the first ordinal established, it has a cardinality also, denoting absence, but an absence which may be specific, as one may have no pebbles rather than nothing at all. This narrowing from Zero in the infinite to the original sense is evident from a glance at the hyperbolic graph. It is due to Zero's originality, that is, its use as the origin point of coordinate systems, that it was accepted as a natural number, and the prime ordinal.

The third case is the nominal. When boys go out afield, we put numbers on their backs to stand in for their names. Little Jeremy is every bit as 27 as his hero, and there is joy in Mudville.

It is this nominal property with which we are typically concerned in a computation. Each character of this treatise is represented as a number, and while these were cleverly chosen they are as arbitrary as can be.

I think it is fair to say, also, that purpose distinguishes computation from calculation. We might sum either bushels of fruit grown or coins spent, wishing all the while that the first was larger and the second smaller. In general computation is done to a purpose, by or for a person, and calculation is the mechanical, or automatic, or algorithmic, aspect of a computation. This distinguishing quality we refer to as semantics, or meaning.

The Caananites invented the [connection](https://en.wikipedia.org/wiki/Alphabet) between marks and phonemes; they used these same marks, in a style adopted wholesale by the Greeks, to represent number. This style included no mark for nullity or void, and this absence of absence leaves traces in our minds and tongues. Yet [Zero is a most natural number](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html), and it is the first.

The trick of computation is in the nominal case. Yet the natural numbers retain their virtues proper to their ordering, and their cardinal virtues also. If we are to enumerate reductions upon a noun, let us make these reductions consonant to those virtues. That which is prior must precede that which comes after.


## The Noun


> A noun is either an atom or a cell.
>
> An atom is any natural number.
>
> A cell is an ordered pair of nouns.

This is the simplest possible data structure, which is also [recursive](https://barpub-tarber.urbit.org/maths/ax/).

This is how you know it is correct.

It is also [acyclic](https://en.wikipedia.org/wiki/Recursion), which is a good property to have.


## Loops


> Ξ [0]  →  Ξ [0]
>
> Ξ [0 0]  →  Ξ [0 0]

These are the identity atom and the identity cell.

Neither is reducible. Both loop endlessly on their own self.

Pretty. But not calculation.


## Identity


> Ξ [0 0 0]        →   0

Zero has, as one of its cardinal properties, which are, again, those inherent to its being, the property of [identity](https://en.wikipedia.org/wiki/Identity_function) in addition. To add zero to any atom results in precisely that atom, neither more nor less.

Additionally, Zero has the property of [annihilation](https://en.wikipedia.org/wiki/Absorbing_element) under multiplication. Zero, multiplied with any atom, results always and only in Zero.

0, or **is**, is the identity operator of the Ax automaton. It annihilates the left noun, returning the rightmost without further change.

This nomination is *consonant* with Zero's properties, considered in itself. This nomination allows the minimal triple to reduce to 0, which is cardinal 1 of the natural numbers, a gentle mind... [bend](https://en.wikipedia.org/wiki/Euphemism) called [Zeration](https://en.wikipedia.org/wiki/Successor_function).

Zeration is weird. I will grant you this. It is also necessary, and introduces our next ability, adding elements to a set in succession.

This **up** operation may be combined feasibly with **is**, thus:

> Ξ [0 1 0 0]      →   1

In our first demonstration, the Zero which emerges from the reduction is the *same* Zero as found in the rightmost place of the left hand noun. In this our *second* demonstration, the One which is returned is *not* the One found in the left hand term, but the ultimate Zero, acted upon by the penultimate Zero and incremented through the **up** operator, whose effect is, to increase by One the result of Axing upon the left and right nouns. The Zero in the origin, head, or left position plays no role beyond the structural.

We clarify this with our third demonstration.

> Ξ [0 1 0 1]      →   2

The Zero that became One is now One, and so that One is Two.

That One is *consonant* with the quality of adding itself to things, is evident. Incrementation is the foundation of the natural numbers; the rest is induction. One is the identity of multiplication, yet it is the annihilation of nothing; we must *Ax* the left and right together, and increment upon the result.

Let us observe, also, these consonances:

**0**: A noun is either an atom or a cell.

**1**: An atom is any natural number.

**2**:


## Branch


The study of recursive structure is called grammar. It is also of [Indian invention](https://en.wikipedia.org/wiki/P%C4%81%E1%B9%87ini). cgy's choice to call the noun the noun, was inspired, graceful. Calling the branch slot, was not.

cgy grew up poor, and thinks of [words](https://en.wikipedia.org/wiki/Word_(disambiguation)) in terms of the cost to represent them in a computation. Five letters is profligate by this standard. Be that as it may, slot is fugly. Recursive slot-in-slot, is not a thing. I saved four letters with **is** and **up**; I will now burn one to get five letters, for the best word for the job.

I believe the most important space to save is in the human mind. Branch is the [more frequent word](https://books.google.com/ngrams/graph?content=branch%2Cslot&year_start=1800&year_end=2000&corpus=15&smoothing=3), and would be lower-ordered in a dictionary compression based on Zipf's Law.

Such different creatures as the deer, trees, and coral reefs, have elements we call branches. These bifurcate recursively.

> 2: A cell is an ordered pair of nouns.

**branch** is the first operation to require the properties of a subjective cell, in the sense that the subject must be a cell for four of the reductions to succeed. The Zero operation requires nothing at all but a noun of phrasal structure, and the status of the subject is irrelevant. One requires that the result of Axing upon the subject and object succeed, and return an atom for incrementation, but the subject may be atomic, and the returned value must be.

**branch** also establishes the sense in which a pair of nouns is ordered.

We now progress in our representation. Having the ability to generate all of the natural numbers, we pat our pockets, looking for a place to put them. Thing is, they get cumbersome if we just accumulate marks. The space is linear, we would prefer logarithmic, it's more compact. Binary is the simplest scheme after unary, this is why we use it.

We will be treating repeatedly upon triple cells, which we should call a phrase. The root phrase, Ξ [0 0 0], gives 0; here Zero is the Subject, Verb, and Object of the root phrase. The **branch** operation *selects* from within the Subject, as indicated by the Object.

Which brings us to the next demonstration:

> Ξ [2 1 2 1]      →   3

In which we **up** Ξ [2 2 1], in which Two selects Two, the whole (One) of the Subject. Yielding Three, thus.

We see from this that One is the identity of the Two operation, returning the whole of the Subject. Is Zero, then, the annihilation of Two?

It is precisely the inverse, and so, undefined.

Novelty is sexy. Novelty is humble. A calculation is a machine, a vessel of definite size and shape existing over a span of moments. What is above the subject, enclosing it as the subject encloses its branches?

Well, plausibly the whole of the noun, which, do what thou wilt shall be. Which is a stack overflow, basically. Or at least a no-op. So if maybe we *skip* that layer we might find something not *interior* to the noun and *interiorize* it. If you thought of this as an *[input](https://en.wikipedia.org/wiki/Pseudopodia)* I wouldn't think the less of you.

This perfectly ordinary, almost biological function, needn't be fig-leaved over by some scheme of wandering in an [infinite hall of mirrors](https://en.wikipedia.org/wiki/The_Library_of_Babel) in which new nouns are sort of *discovered* to be already within the noun's recursive depths.

I grant this is an *option* yet it is one that leaves Two without a meaningful Zero Object. It seems wasteful, is all.

We like our reductions to be compact. Consonant. Aesthetic.


### Digression: The Nature of the Demonstrations


It is said of the ancient game [Wei Ch'i](https://en.wikipedia.org/wiki/Go_(game)) that, if we encounter alien intelligence, it will know Wei Ch'i, because the logic of the game is that pure, relentless, simple. [Chess](https://en.wikipedia.org/wiki/Chess) is clearly but one of the many chesses, as evidenced by its [Asian variants](https://en.wikipedia.org/wiki/Shogi), and yet, we *were* those alien intelligences, and here by 'we' I temporarily mean the English-speaking peoples, and we didn't know Wei Ch'i for really a remarkably long time. It's a fact of history I find difficult to account for, that Chess reached the Western lands and Wei Chi did not.

The rules of the Ax automaton do not require that the demonstrations be present. They are intended as concrete expressions of the underlying clarity of logic and form, speaking of the *inevitability* of Ax, given natural numbers, and a desire for a universal computation.

It may be we will one day encounter alien intelligence, or at least, signals from alien intelligence. It may be we will not. If we are able to construct an automaton that is inevitable, and could be constructed in a way that grows its own complexity, we may find that this construction is more universal than DNA.

Or we may need to stay satisfied in our own achievements. In which case, the elegance of expressing computation with an automaton that exhibits these properties may be its own reward. The [mnemonic weight](https://en.wikipedia.org/wiki/Method_of_loci) of each numbering being consonant with the cardinal properties of the number, and the well-ordered nature of combining each element, starting from absolute minimal complexity, matching and complementing the ordinal nature of the natural numbers.

There is a third possibility: we may create another intelligence equal to our own. If analogous progress in computation is any guide, that intelligence will rapidly [exceed our own in power](http://slatestarcodex.com/2015/05/22/ai-researchers-on-ai-risk/). Such an intelligence would have a keen interest in computational automata, as it would in some important sense be one.

If it is able to follow the same chain of reasoning, with respect to building upon a minimal-recursive structuring of the natural numbers, if it is able to agree with us on the mnemonic utility of the operative assignments, the intellectually pleasing well-ordered formation of the machine, well. Perhaps it will respect us, perhaps it will be more inclined to think such respect is mutual. You never know.

I have designed, or discovered, a game in the Wei Ch'i family, called Chakra. It is played upon a field of intersecting rings, each intersection having four neighbors. Because of this lack of liberty-constrained sides and corners, it is feasible to introduce a movement rule after placement of the stone, the liberties counted twice, once after placement and once after movement, both such moves being optional.

Would an alien intelligence also possess this game? It is simple enough to imagine so, yes. Surely they would understand it. Yet it was invented in the 21st century, actually in the year which is ambiguously of either millennium.

Accepting that Ax is correct, not merely functional, might require expanding our standards of correctness for a mathematical demonstration. We are normally afforded a gap between the semantics of a symbol and its mark, the symbol considered as itself. Why is Π represented with that symbol? Tradition, nothing more. It is useful if they have a mnemonic relationship with the semantics, even if that relationship is quite complex, as Cantor's choice of [א](https://en.wikipedia.org/wiki/Aleph_number) to represent kinds of infinity.

To my own taste, I'm a [Tauist](https://tauday.com/) on Π, thinking "a bit more than six and a quarter" has a nice ring to it, where circularity is concerned. As for [Cantor](https://en.wikipedia.org/wiki/Georg_Cantor), if I didn't like that song, I wouldn't have hummed it.

But when we represent a basic set of operations on the natural numbers, using the natural numbers themselves, more is required of us. Games such as Wei Chi are pleasing to the mathematical mind, because they unfold in a deterministic and complex way from simple, obvious rules. The ordering of its axioms is not particularly important (I assume there is a best one), nor the precise way in which they are stated.

The natural numbers have an order, as well as the properties particular to each. We show with the demonstrations that the Ax ordering follows the natural order, and we make the case here for the consonance between the cardinal properties of the natural numbers and their action as operators in Ax.

It is left to the Reader to decide if these properties are valuable, and if so, how best to make use of them.

And so we come to the Rules, in which the demonstrations are abstracted and generalized. These are the only necessary reductions. The demonstrations are special cases, presented because they are special.

## Rules

> Ξ [a 0 b]        →   b

This states the general case of the **is** identity operator. Of which no more need be said.

> Ξ [a 1 0 n]      →   n + 1

This line is part demonstration, part rule. I believe that a concrete demonstration of the order of operation in reducing an Ax string is useful, as the pattern of first Axing the subject and object before operating upon the result is not obvious upon first appraisal.

This line is optional, a luxury, an aid to understanding.

> Ξ [a 1 b]        →   Ξ [a b]   →   n   →   n + 1

Here we have the statement of the **up** operator. Which should be by this point straightforward. Note the generic character of the two signifiers `a` and `b,` and the progressive specification of `n,` which must be atomic.

> Ξ [a 2 0]        →   ?

Now at last we have returned from this excursion, to explanation.

As discussed, the reduction of **branch** 0 is undefined. This is one of the more philosophically weighty decisions in the Ax automaton, and bears further reflection.

The property of operator 2 is that of *selection*. Normally this is from within the depths of the subject, which must contain all phrases necessary for the completion of the reductions specified in the object noun.

1 is chosen to represent the whole of the subject. I will here switch to the binary radix. The 10 operator, the first we express with two symbols, uses the value 1 for the whole subject, 10 for the left member, and 11 for the right. This pattern then continues, recursively, into the subject noun. We take a binary string, and consume it from the big end. When we encounter a 0, we take the left branch, when we encounter a 1, the right.

This is obviously the correct pattern. What could be changed about it? Each mark, be it zero or one, is a selection, and we call one left and the other right. In what sense is this meaningful?

In the sense that text flows from left to right in Latin writing. If this were in Arabic, I would hope the translator would have the good sense to call them instead right and left. We are saying 'left member' and 'right member' but we truly mean the order of sense, in which the symbols are encountered, as though we are passing through time. We might also call them the negative and positive, respectively; although Zero is not in fact negative, it is distinctive among the natural numbers for being not positive, at least, and for being as close to the negative numbers as a whole number gets. Negative and positive also are used in the sense of charge, and insofar as the 'no' and 'yes' senses of those words correspond to Boolean truth, we find the terms satisfactory on that basis.

(The proton and electron, as it happens, take on opposite symbols of charge from the intuitive. The proton being the [origin](https://en.wikipedia.org/wiki/Origin_(mathematics)) of an atom, it should carry the term for zero as its charge nomination. There is absolutely nothing I can do about this other than complain about it. It comes from aspects, of the group behavior of electrons, which, being larger, were observed first. It's also a bit out of scope).

Note that we *prefer* left and right, as being legible.

This pattern, in which each bit of an atom, represented in binary and consumed from the big end, with each successive bit representing the next tier of the noun, serves as explanation for why 1 is the symbol of the topmost tier of the subject, with which **branch** is ordinarily concerned. Were it otherwise, 1 and 10 would share a tier, and that is unsatisfactory.

What then of Zero? Do we not need it? Why then do we number the operators from Zero in the first place?

Because it is primary, first of order. It is the innovation which allows us to use this binary representation, which is the minimal numeric representation which has the logarithmic properties which are sufficient to further calculation, unary being linear, which is unfeasibly wasteful in a physical calculator.

To not allow a **branch** reduction by zero, to specify that this must be an infinite loop, and state of error, is disrespectful in two ways. The first is structural; it leaves a gap, refusing to define a branch greater than itself nor fulfill its obligation to treat the natural numbers consistently. There is either a Zero or there is not, and there is.

The second is philosophical, and grounded in the concretion of *an* Ax automaton. There is *the* Ax automaton, which we are considering, but in our reality, there would be many, and each with its particular state.

It is a fact of that reality that we may wish to introduce *new information* into this computation, placed as the subject of further reduction. We have here a choice: we may represent this as undefined behavior, and instantiate the new noun from whatever source we've retrieved it, perhaps enumerating it into the subject of further computation, perhaps merely incorporating it into the object of calculation directly.

Or we may 'discover' such new information within the subject itself, through sleight-of-hand. Such an automaton would be structured as embracing all knowledge within itself. Though this may be made to work, it is solipsistic, and we are concerned here with 10; inside and outside is an important duality, and here, the key one.

> Ξ [a 2 1]        →   a
>
> Ξ [[a b] 2 2]    →   a
>
> Ξ [[a b] 2 3]    →   b
>
> Ξ [a 2 (b + b)]      →   Ξ [Ξ [a 2 b] 2 2]
>
> Ξ [a 2 (b + b + 1)]  →   Ξ [Ξ [a 2 b] 2 3]
>
> Ξ [a 2 b]        →   Ξ [a 2 b]

The remaining six reductions follow this recursive, fractal pattern of selection to its logical conclusion. The crash default is an important reduction, as it is trivial to provide **branch** with a level of detail greater than the subject contains.

Zero cannot fail. It cannot be an operator unless in the verb position of a phrase, that accomplished, it will return the object, period.

One can fail in the sense that the Axing of subject and object may not produce an atom. But this failure is in the first recursion, not in the operation of One in itself. One may be inapplicable, but given a correct reduction, it will increment the atom.

Two may fail inherently. This is worth marking with its own crash default. It is a distinctive mode of failure, much like an index error.

If the [2 1 2 1] demonstration were instead [2 1 2 2], it would fail exactly in this way, by failing to reduce [2 2 2], which would loop infinitely. In principle.

This first multiple reduction takes seven forms, and there are seven axiomatic operators in total. This symmetry is pleasing, and constitutes its own argument for the specific crash default and the inclusion of an undefined Zero branch.

The two recursive reductions, each singly recursive, would occur in the tail position, amenable to representation as a simple loop. Its complexity is O(log(n)), formally, with the expectation that much of this can be traced away, replaced with a jump directly to the pointer for the selection within the subject.



## Distribution


The 11 operator, which we will interchangeably refer to as 3, distributes the subject among the various objects of the computation.

This is the structural insight to which we owe Curtis Guy Yarvin our deepest respect and congratulations. I will interchangeably refer to this as the **Ax** or **Nock** operator. I trust this ambiguity will not be unduly confusing.

The insight that the concept of the 'environment' in Lisp was a harmful impediment to imposing a proper type system and *functional* computation is to be deeply respected. It is what enables this automaton to perform persistence and coordination of state in a repeatable, plausible fashion.

Note that 11 is consonant with the operation of taking the 1 **branch**, which is the whole of the subject, and distributing it twice across the two members of the object.

Also, as an odd number, it takes a singular reduction. Lastly, it is concerned with three nouns, a, b, and c. We meet the first two of these these participants in the Zero reduction, one vanishing without a trace, the other carried forward. They are Axed together for the reduction of One.

The **branch** operator is concerned with a single, atomic object, which renders the choice within the subject, while the **Ax** operator concerns itself with the subject and a dual object, which is rendered into two pairings with the subject and calculated separately. Thus 11, or 3.

The next demonstration:

> Ξ [3 3 [[2 1] [1 2 1]] [0 2 1]]   →   [3 4]

Combines the implicit and explicit forms of the distributive operation, splitting the atomic 3 object and incrementing the right half of this cell to produce [3 4].

This is the seed of falsehood.

We will discuss its significance in the next section, under equality.

When you understand, in detail, the reduction of this last demonstration, you are well on your way to understanding Ax.

Let us continue with this distributive operation, which also has a structural form, in another quiet touch of sheer brilliance.

> Ξ [a [b c] d]    →   [Ξ [a b c] Ξ [a d]]

with

> Ξ [a 3 b c]      →   Ξ [Ξ [a b] Ξ [a c]]

Jointly manage state by consuming a chain of objects against the same context. This is the property which allows for the stack-heap duality approach to reducing by Nock a phrase, and operationally, for consistence of state along a chain of conditional operations, computation per se.

This should also render the series of operations amenable to tracing, as an optimization best applied early. Though I will note that I'm aware of no serious proposal to write one.


## The Forth


The test of equality is doubly recursive.

The base case of inequality between two atoms could be represented [0 1]. That is how I would do it. [3 4] has these interesting properties: it is grown, as it were, from Three, through the application of lower-ordered verbs, and contains Four, while providing a base case for the Four operation.

The base case is false, because a test of equality is concerning itself with either falsehood, or its equal and opposite, truth. As Zero is our signifier of falsehood, and is prior, the false base case is preferred.

That is, if we have two unequal atoms, this is case Zero, and reduces to Zero.

This is the 0 case.

The One case is the equality of two atoms. It returns One, our symbol for Truth.

Then, if we have a cell and an atom, it is definitionally false. Case 10.

Then we must consider two cells. Recursively, by comparing the left of the left and the left of the right, and the right of the right and the right of the left, respectively. Case 11. Closed.

We well note that Four, being even, has two reductions.

There is a trivial optimization available, if the Ax is represented using shared structure. If two pointers to cells are equal, those cells will be equal. Ax doesn't have this concept of shared structure, and inequality or equality may in any case prevail over two different pointers. It is the structure and contents of two cells, not details of their representation in memory, that are the final test.

The worst case in time complexity is O(n) the size of the subjects under comparison, which can be expensive; where shared structure can be chosen, it generally should be.

## The Fifth.

The power of probability in computation is irrefutable. It is [paradigmatic](http://Isayso.com) that it exists, in the form of novelty, a mysterious quality which influxes from the future. This stream of living energy, also called entropy, is a necessary part of computation. It is the inverse of the syntropic force necessary to physically power computation and life.

Reality itself exhibits this quality, in the form we refer to as quantum collapse. It is necessary to simulate this in a reproducible, bit-identical calculation, to model and abstract over calculations we believe to be efficient emulations of processes critical to life and intelligence.

We represent luck with the number 5. It is a coin flip, a toss of the die, a short or long straw.

In short, it is necessary to fair gambling, and other conditions when an event's total contribution to a computation is to be distributed but not harmonically.

This [Shrödinger's Bit](https://en.wikipedia.org/wiki/Erwin_Schr%C3%B6dinger), we call Red. A difference between **branch** 0 and the **flip** operation is that the former may return anything at all, hopefully well-formed, while the latter must return either 0 or 1. Deriving this bit from a high-quality physical source of entropy cannot be compelled. It is highly recommended.

In cryptography, Red bits derive their value from being unknown outside the computation. The simplest cryptographic scheme, the one-time pad, is simply shared entropy, XORed across the secret, consuming the entropy by contaminating it with a pattern. Although I have a question about that last part, which keeps me up at night. It should be the subject of another, shorter, and later, thesis.

For probabilistic programming generally, it is the quality of being unpredictable that is valued. Both of these can be obtained, because the physical world allows for processes which are chaotic, unpredictable even across a short term.

It is important to stress that the quality of novelty is particular and exists precisely in its unpredictable nature. If a computation is to be repeated, the choice must be made to either follow the path laid down by the previous ingression of novelty, or to discard it, in favor of a new path, perhaps more pleasing in some quality. Perhaps not.

It is certainly possible to choose to represent only deterministic calculations, or worse, to treat entropy as a class of discovered information, delivered on a card like anything else. This underestimates its importance. It is Axiomatic that a 5 will return a fair toss, an implementation that cannot provide this feature on command is a failing case of an Ax machine. /dev/random is not optional. You can, of course, dummy it up and/or replay it, as long as you know what you're doing. It's your Ax, dude, jam on it.

The engineers building immense tensor math rigs for various forms of machine learning are basically taking a GPU (this works because the math needed to simulate reality is, the math needed to simulate reality) and attaching an entropic firehose to it. They might be beefing it up with some pseudorandom tumbling scheme, I consider this bad engineering but I could get talked out of the insistence on just setting up a circuit with good noisy properties and listening in.

I don't know about the rest of you, but if I'm going to employ probabilistic inference to ride some kind of [Stephensonesque](https://en.wikipedia.org/wiki/The_Diamond_Age) articulated chevalier, I'd like the activation thresholds to actually be driven by physically-generated randomness. Not that I have concrete plans, I'd just like to, eventually. Batteries are only getting smarter.

I did spend a few months insisting that **flip**, until very recently **fuzz**, be based on atomic decay, entirely, and was talked down. I do try to listen when others are speaking.

Five's cardinal connection with this action is best inferred by contemplating coordinates as zero in the identity/origin position, 1 as extension, 2 as rotation, and 3 and 4 as the repetition of extension and rotation. The group produced in this manner is thus far deterministic, in that one would call in all cases the positive and negative vectors of the extensions positive and negative, and the rotations deosil and widdershins, or dextro- and laevo-, or what have you, understanding that the head is the positive terminal; but upon reaching the fifth, third extension, which creates space as generally experienced, we are impelled to make a choice. One choice of positivity creates a right-handed structure of coordination, the other, left-handed. This chirality is therefore associated with choice, and choice's cousin, luck.

A coin flip is a forced choice, distinguished from a free choice, which is more normal when benefits and costs are clear.

We place the Red bit in the 11 position of the subject, in consonance with the odd nature of these two numbers. Also in our belief that the senseward side corresponds with the future, as novelty does as well.

There remains, axiomatically, one operation, corresponding to the third, and last possible, rotation in space.


## Cell


Cell is a simple enough operation. One simply is or one isn't. Our reality exhibits cellularity at several scales, including several at the seductively and subjectively interesting biological level.

To sketch those which make up a human, there are the subatomic, atomic, molecular, nuclear, cellular, organic, and personal, each exhibiting the common property of compactness and containment around a center.

After that, the extended phyla or clades of our biological kingdom have, despite surprising amounts of lateral transfer, a basically tree-like structure, with more general common ancestors encompassing more specific and more recent beings. As family is both the description for the most differentiated and specific multi-person entity, and a word used higher in the tree for a much more extensive grouping, I would call these cellular groupings familial.

I say our kingdom, and observe the plant kingdom shares our proclivities, while the Archaea, Procaryotes, Eucaryotes, and Fungi seem more web-like in their association. Fungal reproduction is particularly... weird in that regard. Intricate, would be a good word, rhyme's with Indra's Net. Virally-mediated lateral transfer is resisted by our kingdom, but so is polyploidy, and both happen from time to time.

We are unique among our kingdom for having almost a second form of life, certainly a secondary identity, which is ultimately linguistic in setting the boundaries of cellularity, which might be summed as the shibboleths of shared understanding. The tribes, clubs or parties, egregores, corporations, cultures, and nations, formed by this common association, often form among those kindred of ancestry, but also often, divide us differently from the forms of our physical inheritance.

Surely we may count above those the planet we inhabit, its Solar System, our Galaxy, and, multicellular and irregular in shape though they be, the galactic cluster, followed, ultimately as far as we know, by the Universe.

We represent the test for this quality with the number Six.

Six is the smallest number which is [perfect](https://en.wikipedia.org/wiki/Perfect_number).

Six has the pleasing property of being composable as 2 by 3, or 3 by 2. These representing the interesting classes of cells, which we could call the structural and the phrasal. Geometrically, six circles fit tangent to each other around a seventh circle of the same size, these numbers being twelve and thirteenth in the case of spheres.

Let me stress that those pairs of numbers, the cardinal latter a double of the cardinal first, are the same member expressed cardinally and ordinarily.

The sixfold harmony of the circle around itself has been associated with the angel Metatron since Antiquity. It is basic to our experience of geometry as living beings, as Buckminster Fuller extensively and with great idiom discusses in Synergetics. That circularity is suggestive of cellularity I take as an evident fact.

Note that, once more, an even rule has two reductions.

This is not a coincidence, because nothing is ever a coincidence.

With this, the seventh of the axiomatic operations, numbered Six, we have a total; these are the operations collectively *necessary* to a well-formed automaton. Upon these we may rest a further foundation.


## Idioms


I didn't know quite what to call these. In some sense they're macros, but I think of them as having personality of their own. They serve to structure and condition the use of the axiomatic phrases, and otherwise retain some of the quality possessed by the axioms, of consonance between assignment of order and the resulting behavior.

I will consider the Idioms in the ordinary order. I was inclined to discuss first even, then odd, as the odds are of a character, but I think this way is more legible.


## Compose


cgy wrote the idioms. I've adopted them, as sensible extensions. In this instance, our assignment of number is identical.

> Ξ [a 7 b c]        →    Ξ [a 3 b 0 c]

This uses the **Nock** operation to distribute the subject across an object, b, subsequently providing this reduction as the subject of another phrase.

As an odd reduction, there is only the one way to do it. Let's look again at the last demonstration:

> Ξ [3 3 [[2 1] [1 2 1]] [0 2 1]]   →   [3 4]

Turns out that's already using this trick.

Function composition is inevitable in the Ax automaton, but worthwhile of marking, as higher operations are assuredly built upon it. We actually intend to follow this basic scheme well past the lemmas, through dictionary compression, assignment of an ordinal, and compilation of the elided strings. The result is simply run in its complex form, enriched with information we can extract during compilation.

Which may still be optimized further through tracing. Giving distinct operations distinct identities, assigning verbs in a useful order, can only aid this operation, which consists in its essence of eliminating any step in a reduction which doesn't advance a mutation present in the final state.


## If


It is canonical to test for the truth of a condition, performing the left or first portion of a calculation if it succeeds, the right otherwise.

Though it can't affect correctness, it is a waste of energy to calculate the unchosen path. This requires **if** to be a 'special form' in Lisp dialects, which have the additional problem of side effects, making this a requirement, not just a good idea.. In Ax it can be written as a simple term rewrite, with the unchosen condition discarded by **branching** on the choice of c or d.  Instead I have chosen to incorporate this object annihilation as a direct reduction.

> Ξ [a 8 b c d]      →    Ξ [a b] → 1 → Ξ [a c]
>
> Ξ [a 8 b c d]      →    Ξ [a b] → 0 → Ξ [a d]

Eight is 2 raised to the 3rd power. It is in that sense, selective distribution across only one of two objects, the other annihilated.

The decision to use a true Boolean, refusing to reduce an 8 which does not resolve Ξ [a b] as either a 1 or 0, was ultimately guided by the low-ordering instinct. We don't yet have a test of relative atomic order, and when we do, it's not a hard problem to make that itself return 0 or 1.

The other Idioms are written in the macro form, simply because this is the more eloquent way to express their action. Writing a macro for 8 is good exercise for the interested Reader.


### On Truth


The keen-eyed reader may notice that a reduction that is True, resulting in 1, is always written before a reduction that is False, resulting in 0. This does invert an order we have been studious and insistent in following otherwise.

This is out of our preference for truth, and greater clarity of explanation,  since the sense of the operation is to test for equality, cellularity, and now, truth itself. It's not that inequality and atomicity aren't interesting, but equality is single, inequality multiple, the same is true of the atom and the cell, and the result of a test must be binary if it is a test of the truth of a matter.

It is, in a way, a trick of the scroll. These two reductions are branches, in each case, only one of the two may be performed. One must come first, and that is the truth, out of respect for the writer of programs, who is generally following a trail of truth, where possible, and should be encouraged.

Until recently, Ax followed the frankly absurd fad of using 0 to represent Truth, and 1 for Falsehood. This was inherited from Nock, which, incredibly, still does it. cgy has expressed his regrets. A bout of soul-searching, and some reading of George Boole in the original Queen's English, resulted in bringing the automaton in alignment with [logic, custom, and common practice](http://barpub-tarber.urbit.org/maths/boolean/).

The familiar Algolic statement of the prime conditional is "if this is true, then do this thing. else, do this other thing". Lisp and Forth use this structure also, Forth doing its usual permutation of the structure to postfix the `then`. The true path in each written before the false one.

We take the nigh-universal nature of this decision as evidence that it is normal to look for truths, and use them to guide our computations down the happy path.

Let us note with great gentleness, but conviction nonetheless, that the left-hand path is the true path, and the right-hand path false.

This is despite of the ordering of c and d, which, were they subjects, would be 10 and 11. But they are not, they are objects, what Nock calls the formula, a powerful synonym. Perhaps we should imagine a reflection across the verb, making them instead 11 and 10. It will us do no harm to, as **branch** can't access the objective side of the phrase.

This reflection is peculiar to 8 as with the Ax operation the object is consumed head-to-tail, or left-to-right, or senseward, and we have seen that matches the enumeration of the branches of the subject. One may imagine another intelligence who simply chooses the base case to be false in this idiom. A good reason to consider it Idiomatic.

It might be quite a bit easier, and is harmless, to simply grant that this is how this thing is done around here.

If, and only If.


## Extend


Again the name was chosen by cgy, who identified the pattern. The tenth operation, represented as 9, this can also be written as a macro:

> Ξ [a 9 b c]          →    Ξ [a 7 [[7 [2 1] b] 2 1] c]

To quote literally from the author "8[sic] is 7, except that the subject for c is not simply the product of b, but the ordered pair of the product of b and the original subject."

> Ξ [3 3 [[2 1] [1 2 1]] [0 2 1]]   →   [3 4]

Does not emulate this precisely, but the effect is much the same. I'm not sure I like the placement of the intermediate product at 2 and the subject at 3. It feels backwards, insofar as the subject already existed and its new addition was just created, left is temporally before right when these words are used in their senseward, rather than their chiral, senses. So we should prefer an order.

I'm leaving it in this Nock-compatible form, for now. The more I think about it, the more I'm likely to reverse those. Might be a slightly longer macro.


## Ten


This is a set of two expansions which do nothing, each in its own way.

The Nock automaton takes a firm stance that neither input nor output are to be handled at the bottom layer. Ultimately this is because down that road lies [Monads](https://wiki.haskell.org/Monad), and if you don't fear and distrust [monads](https://en.wikipedia.org/wiki/Monad) in 2017 I wish I shared your jaunty mein.

This means that information is discovered within the subject on 'cards', acted upon, and then cards are 'released' into the wild, exiting the computation. The Ten operation, which shares its place in Nock and Ax, is not there used for this later 'releasing'. Instead it is used for 'hinting', a peculiar custom relating to jetting, which is not, peculiar that is, when you realize it's the familiar foreign function interface with a requirement that you write the entire library in the slow language as well. Jit and Jet are also caught by the [pin-pen merger](https://en.wikipedia.org/wiki/Phonological_history_of_English_high_front_vowels#Pin.E2.80.93pen_merger), which is droll. Which rhy

It is the hinting itself I deem unnecessary, if we simply continue the pattern which is becoming clear in the Idioms and is spelled out more explicitly in the Lemmas. That is ordinary dictionary compression; we proceed to assign natural numbers to particular nouns we encounter during compilation, save those nouns as the contents of the dictionary, and design and run the compressed Ax code directly, without bothering to consult the dictionary as to the definitive meaning, just a jump table (you knew it was a vtable). The dictionary itself, that is its structural representation as an Ax noun, could be as simple as an ordered list, if we wish it to be compact, or we could construct a balanced representation if we find ourselves consulting it frequently.

A custom of using such a dictionary is somewhat metacircular, as you'd build it in the higher-level language, thereby establishing structural requirements for decoding the dictionary itself. But this is necessary anyway in establishing the next layer of abstraction. It does not increase the complexity of the Ax spec, following its spirit as well as its letter by simply continuing to build operations in the now familiar way.

These cannot be universal, or maybe they can be; for my part, I view the Lemmas as sharing some of the inevitable nature of correspondence, but not so much that I would want to continue down that path further. I'll return to this theme at the proper time.

What then do we wish for Ten? Let us view it:

> Ξ [a 10 b c]       →    Ξ [a c]
>
> Ξ [a 10 [b c] d]   →    Ξ [a 9 c 7 [2 3] d]

We see that the first just annihilates b. It's like the reverse of 0, which is pleasant, as the second place in the decimal system where the Zero appears. In binary it is 1010, which is pretty neat actually, it's like 10 is O-10, if a Japanese-'Arabic' (Hindu) construction may be indulged. Oh-ten-sei.

As is proper to any operation ending in 0, it has two reductions. The second does Ξ [b c] and discards it, moving on to  Ξ [a d]. So what's useful about this? This could cause a side-effect, like printing a variable, or whatever.

I would think it more proper to make more use of Ten, the **toss** operator. In particular I might want b in the first reduction to resolve undefined behavior along branch 0 of another Ax computation, building thereby an Axtor model of cooperative behavior between small, well-defined, predictable computers.

The 10th Sephiroth is Malkuth, the Kingdom. This is where another, denser layer of reality begins in the ladder-like Tree of Life. I think this reflects the Phoenecian/Caananite/Hebrew (these terms are somewhat but not completely interchangeable) alphabet, where the first nine marks are 1-9, the next ten are 10-90, and then we get some number of marks in the 100 series as well.

The radix we use in everyday life is 10. Our fingers? I mean of course our fingers. It does have some kind of virtue as the lowest even number containing an additional prime factor that isn't three; but what virtue is that precisely?

Babylonians attempted to solve this with an odd system that's basically base-60, and yeah I can kinda see that. Still works for clocks.

But yo I *still* count on my fingers. Humans gonna human.


## Invocation


Hail Muse! Be merciful

In bending our arc toward beauty.

The 11 operator describes what Hoon calls a 'core'.

> Ξ [a 11 b c]       →    Ξ [a 7 c 3 [2 1] 2 b]

Now I think this is a pretty macro, with that 3 2 1 streak in it.

Are we still in the realm of inevitability?

The cardinal properties of numbers become more complex, as a rule, as they get further from the origin. For instance a number with many prime factors has qualities specific to each of those factors, and each of their combinations. This can get out of hand, let us say. It's less than clear how to paint a total picture, past a point.

Eleven has the virtue of being prime, at least. It is the last of our five Idioms; after this we will briefly discuss the Lemmas, and leave you with some musings on implementation.

cgy stops counting at 10, leaving him with 11 operations in total. Thanks to our lucky **flip** operation, we have 12 total, which must enumerate to 11, sure as you're born.

I picked cardinal 12 as my number, nominating my seat on the Senate and what have you. The Senate has an order, this is structurally inevitable, but it is membership in the set 1-255 inclusive which is distinctive. ~zod being the primus inter process, but not pares, as a sitting Senate will not have a speaker for ~zod. Curtis Guy Yarvin and Galen Wolfe-Pauley are the consuls, who serve on behalf of the Senate and the Urbit, not ~zod per se. The numbers are strictly nominal, sort of. Certainly the @p phonemic mappings encourage thinking in those terms.

I chose the Carrier Emperor Constantine for nominal reasons, but am content with its cardinality also. I also applaud the transition from naval warfare to astronomy as the source of metaphor. Perhaps ~wep shall be the Constantine Cluster. Or the Greater Constellanic Cloud.

I'll just say it's unclear what's inevitable. I'm pretty sure 9's backward and it may get stuck that way. 11 is even harder to make a case for, I guess, but trace it, it's a good reduction.


## Lemmas


The Lemmas are *optional* from where I sit. If you came to me and said "Sam, I just want a bunch of bitwise to come after the Idioms, it's what makes sense to me" I'd understand that impulse.

The Lemmas are provided as a fulfillment of the definition of atoms as 'natural numbers'. They don't provide all the properties of the natural numbers we call arithmetic, but they provide the core properties.

Or do they? Increment is of course special, is decrement? I think so, I start with decrement because the **up** operator is the only axiomatic way to do arithmetic on an atom and decrement is its complement. Also we're at 12, cardinally, and that suggests two reductions; since one cannot decrement 0, that fits.

But is modulus really more important than exponentiation? Like, which is more Seventeeny, man? \[*takes deep hit of spliff*\] Thing is, at some point I don't want to play that game. Or I want to relax the rules a bit. These assignments are nominal, not cardinal; it provides clarity, consonance, to make the associations in alignment with the cardinal and ordinal virtues of number, but those get harder to cleanly explicate the larger the numbers get.

I don't want to get in arguments about which of 17 and 19 is modulus and which is power. I just don't, who has time for that? Do we include factorial or just force junior developers to implement it in interviews?

There are those among you who will always feel this whole treatise is just exactly that argument. To which I reply: this is why 17 and 18 is defined on one abstraction layer and 19 on the other. I will stand firmly for the axiomatic set of operations and the order I've provided them in, am open to exploration on the Idioms, consider the Lemmas a reasonable effort, and then think our attention is more fruitfully directed elsewhere.

I include the Lemmas for two reasons. The first is to provide for the operations on natural numbers I consider basic. The cell is of much more recent innovation, and being protean and multiple, of an entirely different order of complexity, at least to a human mind. The two words 'natural numbers' bring in a huge amount of prior art, and this assuredly includes things like comparison and division, and yes, I consider modulus more basic than power, which compounds through repetition an operation that is already compounded thorough repetition, while cyclic arithmetic is the basis of everything recurrent in a regular or harmonic way. It belongs after division, which must have two reductions to forbid zero, because modulus completes division by providing the remainder.

The second is to indicate the path forward. Ax as a compiler target with a dictionary assembled from foreign function interfaces written in a language which expects to be represented on an Ax-class automaton. Multiplication being 15, 31 might be a nice spot on the shelf for power, might not. At some point we want to start organizing by common utility, in the familiar library pattern.

That's Hoon, basically. At first, and rebuilt utterly below C level.


### Second Layer: an Afterword.


I have written some Hoon, now. These small modifications of a talkbot to serve bar at the ~barpub, taught me... a bit.

This is a discussion of Ax, not Hoon, Urbit, or Nock. I think Hoon is a plausible candidate to target Ax. This is, in a sense, the same box of pencils, just lined up right.

The actual *doing* of it might be dicey. But would it absolutely have to be? Organizing pencil boxes has happened before. It's a breach, sure, but so was Wednesday.

Let us imagine Tlön was swimming in cash and wanted Urbit to be really fast. The turn to me and say "Ok Sam, what would you do in our position?".  Once I was flying back from Asia and woke up and I saw Kauai. It was the most spectacular thing, I had it confused with my destination, Maui, because I was disoriented. I'd get a place near the beach with six, seven offices, common area with a kitchen. I'd call Mike Pall with photos, an offer.

What Usain Bolt is to moving extremely fast over short distances, Mike Pall is to tracing. Tracing is a technique from the Lisp and Smalltalk side of the go-fast community, designed to solve problems they have because 'lists' and 'object's, like 'nouns', are basically all pointer-chasing, and we want to trace the chase in turn and reduce the calories of the state transition. You can think of this in time, me my batteries run down a lot.

There is no special reason for the beach, other than that I personally do my best work in a setting where there's little else to do but relax, which is alternately mandatory and boring in comparison to working. Perhaps for Mike Pall this is a Bhutanese Dzong.

There aren't that many humans who can do this at all. Only one of them is Mike Pall. The rest work in large teams on the JVM or CLR or LLVM, Mike Pall wrote LuaJit. This jiu-jitsu absolutely saws through the various indirections and book-keeping typical of dynamic languages. Maintaining forward-inferred type information, as in Hoon, can only help, especially with doing it ahead of time.

This is the cool-down lap anyway. Let's just take a break and read up on the [four color garbage collector](http://wiki.luajit.org/New-Garbage-Collector) he hasn't had opportunity to write.

That is magnificent design, dear Reader. Mike Pall could get it done. He might even want to.

Plan B, lower by a head and shoulders, would be to get merely *very good* tracers, maybe one from CLR and one from LLVM. Who would spend three months meditating on LuaJit, and then move onto fast Hoon on Ax.

Or Nock. It's quite possible to draw with out-of-order pencils and who is to say colors have an order anyway, I did this all the time when I drew with pencils. Either way I feel as though go-fastitude is some combination of dictionary compression and tracing, during compilation and runtime, and that hints are a compile-time feature that doesn't need representation in the runtime code.

For all I know that's what Curtis has been locked in the basement doing. Let us imagine a small rosewood nook with Mike Pall's picture, a candle burning the while, spilling wax on a lucky fanfold. Whatever, it's intended to make Urbit fast, and I have great confidence in Curtis's abilities. He's the Usain Bolt of something, and I prefer to leave him leeway in defining what that might be.

Nor is Hoon the only imaginable system for which Ax could be a satisfactory target. Anthony DiFranco's Fifth project may find Axtors as a suitable intersubjective framework for his probabilistic pursuits. I am grateful for his friendship, and also, for his observation that the power of Forth (the language) is exactly in dictionary compression, indeed it is the only sugar you get, but enough to get as far as you need to.


### Acknowledgements


My Mother is an avid knitter. She is also Jewish, has broken and repaired her own computer since the 1980s, and once had a knitting *machine* (this was also the 80s), that ran on some combination of punch cards and flip switches.

It is really a very odd and specific kind of calculational verbal fluency, deeply recursive and complex. I'd see her pick apart rows because after ten iterations of intricate patterns, one stitch was off ten back, causing two lines to meet but not mesh. She would debug that, eventually making a shawl or sweater or what have you, that part always mattered less, it's the knitting she likes.

My Father was a scholar in the field of Descriptive Psychology. This was founded by Peter Ossorio at University of Colorado, Boulder, in the 1960s, and deserves to be better known. His extended family includes many mechanics spread out across the West from Texas to Colorado, so spacial rotation runs in the family, though I've always felt mine should somehow be better.

This may be because my handedness, visual dominance, and leading footstep are all left-handed, a state experienced by around one in ten humans. It can be an impediment to using objects designed by the right handed, particularly locks, where I supinate when you pronate, or did until I taught myself to use my right hand with my keys.

I want to thank my parents for embodying me with these abilities, and others it would be tedious and prideful to mention in full. This work is dedicated in particular to my Father, Dr. Anthony O. Putman, who left this world after a brief battle with cancer, last fall. He was an author, a scholar, a spiritual practitioner, and though I feel his presence often, I shall miss him for as long as I remain here.

This is not the place for a full treatise on the history of discrete mathematics. Or rather, it is exactly that place, in that I would dearly like to write one, and would link it, say, here. To date I have not.

It is important to thank some individuals we cannot name, notably, the discoverer of the I Ching, the person who radically simplified the hieroglyphics of the Egyptians into a combined phoneme and number system, and the discoverer of the abacus, which appears to be co-extant with the use of a positional 0 sigil. The latter innovation, being conceptual, was slower to spread than the calculating automaton, a physical object.

I am sure these men have traditional names, but just as sure my Latin letters are but a rough fit for them. I mean I know how I'd call the middle one.

Douglas Hofstadter's Gödel, Escher, Bach was my introduction to our topic. His concept of a 'strange loop', knitting back on a second level or layer of reference, aided me in understanding the ordinal/cardinal shift operation, and its connection to Zeration, and successor functions generally.

Edsger Dijkstra's [Why numbering should start at zero](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD08xx/EWD831.html) is definitive, and was a model for the simplicity without terseness I hoped to bring to this topic. This is quite a bit longer, but then, there was more to cover.

Dr. Knuth has the distinction of being the only one I intend to pester with a paper copy of this treatise. I gather he doesn't *do* the Internet, which must be nice. I hope he likes it.

Completing this would have been unimaginable without the prior work of Christopher Alexander, whose Nature of Order identifies properties with which to carry forward the mathematical project into the understanding and nurturing of living systems. His work was also invaluable in designing Phon, whose properties, particularly those of the shape groups, have non-trivial relationships to Ax. I hope to be able to invent upon and elaborate this connection in future work.

I have to thank cgy for the pencils, and apologize.

Now, calling a Jewish man, or even the son of one, a pig, is the kind of behavior that historically could get you killed. Or him. I am no chicken, either, and mean nothing mean by it. It's just a good story, is all.

In fact there may not be a context on Earth in which that could be construed politely. Except this one, if I may beg a specific exception to an old and general rule.

Senses of humor not being lacking among either party, I think we're ok. This interlude is because there are always those who do.

Thanks to Daniel Cappy for his good stewardship, bringing the Chakra project to fruition, and for reviewing an early draft of the axiomatic sections. He shall have to stand in for a much wider group of people who have shown me friendship and care over the years, for now. All those people deserve my profound and lasting thanks also.

The spec has its own thanks section:

> This work would be impossible without the monumental efforts of Curtis Guy
> Yarvin. In turn, his work cannot be imagined without that of three Johns: von
> Neumann, Conway, and McCarthy. I will thank John Nash also, for personal
> reasons.
>
> I would like to thank Josh Lauffer, my teacher in the Kabbalah, who instilled
> a lifelong interest in the inherent properties of natural numbers.
>
> A special shout-out to Al, to whom much credit must incur, indeed.

៚


