--[[   The Ax Ur Machine

	         being

	 A Ready Demonstration

	   and  *Unit Test*

	     for the Soul

   	       of a New
 
	        Machine

	          or

	 A Nominative Ordering

	      of Cardinal

	        {Conk}

	      Based  Upon

           the Tree

	          of

	         Life
]]

--[[Preliminaries]]

require "ansi"

---[[ LoL (lisp '(on lua))

-- Aka The Greenspun Preamble

function atom_p(noun) 
	if ("string" == type(noun) or "number" == type(noun)) then
		return true
	end
	return false
end

function cell_p(noun)
	if ("table" == type(noun)) then
		return true
	end
	return false
end

function num_p(noun)
	if ("number" == type(noun)) then
		return true
	end
	return false
end

function sym_p(noun)
	if ("string" == type(noun)) then
		return true
	end
	return false
end


function car(noun) 
	if cell_p(noun) then
		for key,_ in pairs(noun) do 
			return (key)
		end
	else 
		return nil
	end
end

function cdr(noun)
	if cell_p(noun) then
		for _, val in pairs(noun) do
			return (val)
		end
	else
		return nil
	end
end

function cons(key, val)
	if (not val or not key) then
		print "bad cons"
		print("val",val)
		print("key",key)
		return "![,]"
	end
	return {[key] = val}
end

function cns(key,val)
	if (not val or not key) then
		return nil
	else
		return {[key] = val}
	end
end

function caar (noun)
	return car(car(noun))
end

function cadr (noun)
	return car(cdr(noun))
end

function cdar (noun)
	return cdr(car(noun))
end

function cddr (noun)
	return cdr(cdr(noun))
end

function janus (table) --what's cool about a janus table?
	for key, val in pairs(table) do -- if face and face are different types...
		table[val] = key --there can be no collision!
		return table 
	end
end

function depth_eq(left, right)
	local count = 0
	local carl = car(left)
	local carr = car(right)
	local cdrl = cdr(left)
	local cdrr = cdr(right)
	if (cell_p(carl) and cell_p(cdrl)) then
		--print "cells:"
		count = count + depth_eq(carl,cdrl) + depth_eq(carr,cdrr)
		--print ("eq count "..tostring(count))
		if (count > 0) then
			return 1
		else
			return 0
		end
	elseif (carl ~= cdrl) then
		--print "unequal left"
		count = count + 1
	elseif (carr ~= cdrr) then
		--print "unequal right"
		count = count + 1
	end
	if (count > 0) then
		return 1
	else 
		return 0
	end
end



function bite(noun_string) 
	if (noun_string == "") then return nil end
	if (noun_string == nil) then
		print "bite error: nil"
		return nil, noun_string
	end
	local index,cursor = string.find(noun_string, "%s")
	if (index == 1) then
		local tok, string = bite(noun_string:sub(cursor+1,-1))
		return tok, string
	end
	index, cursor = string.find(noun_string, "[[]") -- read as "["
	if (index == 1) then
		return noun_string:sub(index,cursor), noun_string:sub(cursor+1,-1) 
	end
	index, cursor = string.find(noun_string,"]")
	if (index == 1) then
		return noun_string:sub(index,cursor), noun_string:sub(cursor+1,-1)
	end
	index, cursor = string.find(noun_string, "%d+")
	if (index == 1) then
		return tonumber(noun_string:sub(index,cursor)), noun_string:sub(cursor+1,-1)
	end
	index, cursor = string.find(noun_string, "%a+")
	if (index == 1) then
		return noun_string:sub(index,cursor), noun_string:sub(cursor+1,-1)
	end
	print("error parsing while chewing", noun_string)
	return noun_string
end

function chew(str) 
	local cursor, rest = bite(str)
	if (cursor == nil) then
		return nil, rest
	end
	local head, tail = {}
	if ("[" == cursor) then
		 head, rest = chew(rest)
		 tail, rest = chew(rest)
		if (tail == nil) then
			return head, rest
		else
			return cons(head,tail), rest
		end
	elseif ("]" == cursor) then
		return nil, rest
	elseif atom_p(cursor) then
	    tail, rest = chew(rest)
		if (tail == nil) then
			return cursor, rest
		else
			return cons(cursor,tail), rest
		end
	end
	print "malformed input"
	return 1, rest
end

function digest(consume, str)
	local brack, rest = bite(str)
	if ("[" == brack) then
		noun, rest = consume(str)
	end
	if (rest ~= nil) then
		print "didn't eat it all"
		return noun, rest
	end
	return noun
end

function read(noun_string)
	return digest(chew, noun_string)
end

-- End Read]]

--- [[ Noun Printing

colors = {op         = "red",
		 subject     = "green",
		 object      = "cyan",
		 clear       = "clear",
		 err         = "magenta",
		 cell        = "cyan",
		 noun        = "clear",
		 atom        = "white",
		 nock        = "nock",
		 ax          = "nock", --more or less
		 argument    = "blue",
		 ["black"]   = ansi.black,
		 ["white"]   = ansi.white,
		 ["red"]     = ansi.red,
		 ["green"]   = ansi.green,
		 ["yellow"]  = ansi.yellow,
		 ["blue"]    = ansi.blue,
		 ["magenta"] = ansi.magenta,
		 ["cyan"]    = ansi.cyan,
		 ["white"]   = ansi.white,
		 ["clear"]   = ansi.clear,
		 ["reverse"] = ansi.reverse }

maxdepth = 6


function pr (noun, depth)
	if (nil == depth) then
		print (ansi.reverse.."set depth for print call!"..ansi.clear)
		depth = 1
	end
	if (depth < maxdepth) then
		if (nil == noun) then
			return "!pr", trace
		end
		if cell_p(noun) then
			for key, val in pairs(noun) do
				return "["..pr(key,depth+1)..":"..pr(val,depth+1).."]"
			end
		elseif atom_p(noun) then
			return noun
		end
	elseif atom_p(noun) then
			return noun
	elseif cell_p(noun) then
		return ".."
	else
		print "pr: bad noun"
		return noun
	end
end



function prt(noun)
	return pr(noun,0)
end

--[[]]

function prt_as (noun, color)
	if (colors[color] == "nock") then
		return prtax(noun)
	else
		color = colors[color]
		return (color..pr(noun,0)..colors["clear"])
	end
end

function prtax(noun)
	--print "a"
	if atom_p(noun) then
		--print "b"
		--print "good branch"
		return colors[colors.cell]..noun..colors["clear"]
	else 
		if (nil == car(noun) or nil == cdr(noun)) then
			--print "that was weird"
			return nil, noun
		elseif   (atom_p(car(noun)) and atom_p(cdr(noun))) then
			return (colors[colors.cell]..pr(noun, 1)..colors["clear"])
		else 
			--print "d"
			local phrase = "[" .. prt_as(car(noun),colors.subject) ..
						   ":" .. prt_as(cadr(noun),colors.op)     ..
						   ":" .. prt_as(cddr(noun),colors.object)    ..
						    colors["clear"] .. "]"
			return phrase
		end
	end
end

function pprt(noun)
	return prtax(noun)
end


function rep(str)
	noun = prtax(eval(read(str)))
	if (nil == noun) then
		noun = ""
	end
	print ("  "..noun)
end


function prn(noun)
	print(prt(noun))
end

function prnax(noun)
	print(prtax(noun))
end



fold_table = 	{[8] = "𝍢",
                 [16] = "𝍥",
                 [32] = "𝍦",
                 [64] = "𝍧",
                 [128] = "𝍨",
                 [256] = "𝍨",
                 [512] = "𝍩",
                 [1024] = "𝍪",
                 [2048] = "𝍫",
                 [4096] = "𝍬",
                 [8192] = "𝍮",
                 [16384] = "𝍯",
                 [32768] = "𝍰",
                 [65536] = "𝍱"}

fold_table = janus(fold_table)

function report(trace, report, noun, color) -- part of tracer
	print (trace.."  "..report.."  "..prt_as(noun,color))
end

-- End Noun Printing]]  

--- [[ Unit Tests

Boot = { "[0]",
		 "[0 0]",
		 "[0 0 0]",
	     "[0 1 0 0]",
	 	 "[0 1 0 1]",
	 	 "[2 1 2 1]",
	 	 "[3 3 [[2 1] [1 2 1]] [0 2 1]]",
	 	 "[[3 4] [1 2 2] [1 2 3]]"} -- Ok

SymBoot = {"[0 is 0]",
		   "[0 up is 0]",
		   "[0 up is 1]",
		   "[2 up br 1]",
		   "[[2 3] ax [[up br 2] [up br 3]] [is br 1]]",
		   "[[3 4] [up br 2] [up br 3]]"}

Fail = { "[4 5] [1 2 1 2]",
		 "[45 108 54]",
		 "[23 42] [1 0 2 1]",
		 "[2 1 2 2]",
	     "[0 2 1 1]",
		 "[[6 5] 4 2 1]"}

Win = {  "[77 [3 [0 42] [0 0 153 218]]]",
	     "[5 6 2 1]",
	 	 "[[6 6] 6 [2 1]]",
		 "[6 6 [2 1]]",
		 "[[[4 4] [4 4]] 4 [2 1]]",
		 "[[[4 5] [6 7]] 4 [2 1]]",
		 "[[[[8 8][8 8]] [[8 8] [8 8]]] 4 [2 1]]",
		 "[6 7 [1 2 1] [1 2 1]]",
	     "[6 3 [1 2 1] 0 [1 2 1]]",
   		 "[42 [8 [0 0] [1 2 1] [0 233]]]",
   		 "[42 [8 [0 1] [1 2 1] [0 233]]]",
   		 "[42 [9 [1 2 1] [2 1]]]",
   		 "[42 [9 [1 2 1] [1 2 3]]]",
		 "[[42 1 2 2] 7 [2 1] 3 [2 1] [2 3]]",
		 "[[42 1 2 2] 11 3 [2 1]]",
		 "[2 [9 [0 0] [9 [0 [8 [4 [2 7] [1 2 6]] [2 6] [11 2 [[2 2] [1 2 6] [2 7]]]]] [11 2 2 1]]]]"} 

SymWin = {"[2 [cnk [is 0] [cnk [is loop] [arm 2 br 1]]]]"}

True = {"[0 0 0]", "[0 2 1]"}

False = {"[0 1 0]", "[1 2 1]"}

function tst (tablet)
	for key, val in pairs(tablet) do
		 rep(val)
	end
	print "✔"
	return 0
end

function test()
	tst(Boot)
	tst(SymBoot)
	tst(Win)
	tst(False)
	tst(True)
	print"✔✔"
	return 0
end
--- End Tests ]]



-- [[ Ax Machine

-- Axioms

function is (counterweight, identity, trace)
	trace = trace.."-0-"
	report(trace," is:",identity,colors.nock)
	return identity, trace
end

function up(subject, argument, trace)
	trace = trace.."-1-"
	print (trace.." up:")
	sequent = ev(cons(subject, argument), trace)
	report (trace,"ret:",sequent,colors.noun)
	if atom_p(sequent) then
		report(trace,"sequent:",sequent+1, colors.noun)
		return sequent + 1, trace
	else 
		report(trace,"bad inc", sequent, colors.err) -- add trace, err
		local err = "!++"
		trace = address -- "add to trace table"
		return err, trace
	end
end

function me(me) return me end -- lxxkl <3

function brZero(subject,trace)
	print "not implemented!"
	return "!br0", trace
end

slt = {me,car,cdr,caar,cdar,cadr,cddr}
slt[0] = brZero
	
function br(subject, address, trace) -- nil crash on failure
	if (trace == nil) then
		trace = "!@#$%@$#%"
	end
	trace = trace.."-2-"
	print (trace.."   br:")
	print (trace.."   adr:  "..pprt(address))
	print (trace.."   of noun:  "..pprt(address))
	if cell_p(address) then
		report(trace,"bad adr:",address,colors.err)
		return "!@"	, trace
	end	
	if (address < 8) then
		print (trace.."   cell found:  "..pprt(subject))
		local graft = slt[address](subject)
		if (nil == graft) then
			print(trace.."bad branch!")
			local err = "!<"
			return err, trace
		else
			report(trace,"br: grafting",graft,colors.nock)
			return graft, trace
		end
	elseif (0 == address % 2) then
		return car(br(subject,(address / 4),trace)), trace
	else 
		return cdr(br(subject,((address -1) / 4),trace)), trace
	end
end


function ax(subject, argument, trace)
	trace = trace.."-3-"
	print  (trace.."     ax:")
	if cell_p(argument) then
		report(trace,"subj:",subject,colors.subject)
		report(trace,"args:",car(argument),colors.object)
		report(trace,"    :",cdr(argument),colors.object)
		print (trace.." eval head")
		local head = ev(cons(subject,car(argument)),trace)
		report(trace,"head:",head,colors.ax)
		print (trace.." eval tail")
		local tail = ev(cons(subject,cdr(argument)),trace)
		report(trace,"tail:",tail, colors.ax)
		report(trace," consing:",cons(head,tail),colors.ax)
		return ev(cons(head,tail),trace)
	else
		print "crashed on atomic ax"
		local err = "!Ξ"
		return err, trace
	end
end

function eq(subject, argument, trace)
	trace = trace.."-4-"
	print (trace.."  eq:  "..pprt(cons(subject,argument)))
	local noun = ev(cons(subject,argument),trace)
	print (trace.."  eq return:  "..pprt(noun))
	if atom_p(noun) then
		print "bad same!"
		return "!=", (cons(subject,argument))
	end
	if (atom_p(car(noun)) and atom_p(cdr(noun))) then
		if (car(noun) == cdr(noun)) then
			return 0
		else
			return 1
		end
	elseif (0 == depth_eq(noun)) then
		return 0
	else
		return 1
	end
end

function fz(subject, argument, trace)
	trace = trace.."-5-"
	local weight = cons(subject,math.random(256))
	local guess  = ev(cons(weight, argument),trace)
	report(trace,"weight:",weight,colors.cell)
	return guess, trace
end

function cel(subject, argument, trace)
	trace = trace.."-6-"
	report(trace,"cel:",cons(subject,argument),colors.ax)
	noun = ev(cons(subject,argument), trace)
	print (trace.."  is cell?  "..pprt(noun))
	if cell_p(noun) then
		return 0, trace
	else
		return 1, trace
	end
end

--Idioms

function cmp(subject, argument, trace)
	trace = trace.."-7-"
	local head = car(argument)
	local tail = cdr(argument)
	print(trace.." cmp:  "..pprt(head)..pprt(tail))
	return ev(cons(ev(cons(subject,head),trace),tail),trace)
end

function iff(subject, argument, trace)
	trace = trace.."-8-"
	report(trace,"if:",cons(subject,car(argument)),colors.ax)
	local test = ev(cons(subject,car(argument)),trace)
	print (trace.." aORb:"..pprt(test))
	if (0 == test) then
		print(trace.." if0: exec  "..pprt(cons(subject,cadr(argument))))
		return ev(cons(subject,cadr(argument)),trace)
	elseif (1 == test) then
		print(trace.." if1: exec  "..pprt(cons(subject,cddr(argument))))
		return ev(cons(subject,cddr(argument)),trace)
	else
		print "bad conditional"
		return "!?"
	end
end

function cnk(subject, argument, trace)
	trace = trace.."-9-"
	local thunk = ev(cons(subject,car(argument)),trace)
	print(trace.." thunk:  "..pprt(thunk))
	chunk = ev(cons(cons(thunk,subject),cdr(argument)),trace)
	print(trace.."  chunk:  "..pprt(chunk))
	return chunk,trace
end
 
function cnkk(subject, argument, trace) --Macro Edition
	trace = trace.."-9-"
	local a = subject
	local b = car(argument)
	local c = cdr(argument)
	local p = cons(7,cons(cons(2,1),b))
	local compose = cons(p,cons(2,1))
	local chunk = cons(compose,c)
	local total = cons (a,cons(7,chunk))
	return ev(total,trace),trace
end

function put(subject,argument,trace)
	trace = trace.."10-"
	local comm = car(argument)
	if cell_p(comm) then
		report(trace,"put: calc",comm,colors.ax)
		local catcher = ev(cons(subject,cdr(comm)))
		report(trace,"putting",catcher,colors.ax)
		report(trace,"lifting:",car(comm),colors.ax)
		return ev(cons(subject,cdr(argument)),trace)
	else
		report(trace,"put: lift",comm, colors.ax)
		return ev(cons(subject,cdr(argument)), trace)
	end
end

function arm(subject, argument, trace) -- sort out 'br' macros, select direct
	trace = trace.."11-"
	local branch = car(argument)
	local selecta = cdr(argument)
	local core = subject
	print(trace.."  arm:")
	report(trace,"core:",core,colors.ax)
	report(trace,"selecta:",selecta,colors.ax)
	report(trace,"arming:",cons(core,selecta),colors.ax)
	local arm = ev(cons(core,selecta),trace)
	report(trace,"armed:",arm,colors.ax)
	local call = cons(arm,cons("ax",cons(cons("br",1),cons("br",branch))))
	report(trace,"fire on:",call,colors.ax)

	report(trace,"fire",call,colors.ax)
	return ev(call,trace)
end


function armm(subject,argument,trace) -- macro edition
	trace = trace.."11-"
	print(trace.."  arm:")
	local a = subject
	local b = car(argument)
	local c = cdr(argument)
	local addrs = cons(cons("br",1),cons("br",b))
	local axrs = cons("ax",addrs)
	local selecta = cons(7, cons(c,axrs))
	return ev(cons(a,selecta),trace)
end

-- Lemmas

function dec(subject, argument, trace)
	trace = trace.."12-"
	print (trace.." dec:")
	prior = ev(cons(subject, argument), trace)
	report (trace,"ret:",prior,colors.noun)
	if atom_p(prior) then
		report(trace,"prior:",prior-1, colors.noun)
		return prior - 1, trace
	else 
		report(trace,"bad dec", prior, colors.err) -- add trace, err
		local err = "!--"
		trace = address -- "add to trace table"
		return err, trace
	end
end

function add(subject,argument,trace)
	trace = trace.."13-"
	print (trace.." add:")
	addends = ev(cons(subject,argument),trace)
	if (num_p(car(addends)) and num_p(cdr(addends))) then
		report (trace,"adding:",addends,colors.noun)
		return car(addends) + cdr (addends)
	else
		print "add fail"
		return "!+", trace
	end
end

function sub(subject,argument,trace)
	trace = trace.."14-"
	print (trace.." sub:")
	minuets = ev(cons(subject,argument),trace)
	if (num_p(car(minuets)) and num_p(cdr(minuets))) then
		if car(minuets) < cdr(minuets) then
			print "no negative atoms"
			return "!-", trace
		else 
			report (trace,"subtract:",minuets,colors.noun)
			return car(minuets) - cdr (minuets)
		end
	else
		print "sub fail"
		return "!-", trace
	end
end

function mul(subject,argument,trace)
	trace = trace.."15-"
	print (trace.." mul:")
	multiples = ev(cons(subject,argument),trace)
	if (num_p(car(multiples)) and num_p(cdr(multiples))) then
		report (trace,"multiply:",multiples,colors.noun)
		return car(multiples) * cdr (multiples)
	else
		print "mul fail"
		return "!*", trace
	end
end

function div(subject,argument,trace)
	trace = trace.."16-"
	print (trace.." div:")
	dividers = ev(cons(subject,argument),trace)
	if (num_p(car(dividers)) and num_p(cdr(dividers))) then
		if (0 == cdr(dividers)) then
			print "n/0!"
			return "!/", trace
		else 
			report (trace,"divide:",dividers,colors.noun)
			return math.floor(car(dividers) / cdr (dividers))
		end
	else
		print "div fail"
		return "!/", trace
	end
end

function mod(subject,argument,trace)
	trace = trace.."17-"
	print (trace.." mod:")
	modulands = ev(cons(subject,argument),trace)
	if (num_p(car(modulands)) and num_p(cdr(modulands))) then
		report (trace,"modulus:",modulands,colors.noun)
		return car(modulands) % cdr (modulands)
	else
		print "mod fail"
		return "!%", trace
	end
end

function grt(subject,argument,trace)
	trace = trace .."18-"
	print (trace.." grt:")
	comparators = ev(cons(subject,argument),trace)
	if (num_p(car(comparators)) and num_p(cdr(comparators))) then
		report (trace,">? :",comparators,colors.noun)
		if (car(comparators) > cdr(comparators)) then
			return 0
		else 
			return 1
		end
	else
		print "grt fail"
		return "!>", trace
	end
end


	
axops     =    {up,
		  		br,
				ax,
				eq,
				fz,
				cel,
				cmp,
				iff,
				cnk,
				put,
				arm,
				dec,
				add,
				sub,
				mul,
				div,
				mod,
				grt}
axops [0] =  is -- placement courtesy Lua

nockops = {is,
		   ax,
		   cel,
			up,
			eq,
			iff,
			cmp,
			cnk,
			arm}

nockops [0] = br

nockops = janus(nockops)

axops = janus(axops)

ax_table = {["is"]  =  0,
			["up"]  =  1,
			["br"]  =  2,
		    ["ax"]  =  3,
		    ["eq"]  =  4,
			["fz"]  =  5,
			["cel"] =  6,
		    ["cmp"] =  7,
		    ["if"]  =  8,
		    ["cnk"] =  9,
		    ["put"] = 10,
		    ["arm"] = 11 }

ax_table = janus(ax_table)

ops = axops

syms = ax_table

--maxtrace = 512

op_level = 20

noun_table = {["fortytwo"] = 42,
			  ["loop"] = read "[if [eq [br 7] [up br 6]] [br 6] [arm 2 [[br 2] [up br 6] [br 7]]]]",
			["slotTwo"] = 2}

nouns = janus(noun_table)



function hone(noun, trace)
	local function unwrap(symbol) 
		if nouns[symbol] then
				return nouns[symbol], trace
		else
				print(trace.."no noun in table for "..symbol)
				return "!$", trace
		end
	end
	if (nil == trace) then
		trace = "?"
	end
	trace = trace..":"
	report(trace,"    eval:",noun,colors.nock)
	if atom_p(noun) then
		print ("infinite loop? on", noun)
		return noun, trace
	else 
		local subject = car(noun)
		local argument = cdr(noun)
		if sym_p(subject) then
			print(trace.."symbolic subject")
			subject = unwrap(subject)
			report(trace,"unwrapping:",subject,colors.ax)
		elseif sym_p(argument) then
			print(trace.."symbolic argument")
			argument = unwrap(argument)
			report(trace,"unwrapping:",argument,colors.ax)
		end
		local op = car(argument)
		local object = cdr(argument)
		if (op == nil or subject == nil) then
			report(trace,"badly formed noun",argument,colors.ax)
			return "!@", trace
		elseif sym_p(object) then
			print(trace.."symbolic object")
			object = unwrap(object)
			report(trace,"unwrapping:",object,colors.ax)		
		end
		report(trace,"      op:",op,colors.op)
		report(trace," subject:",subject,colors.subject)
		report(trace,"  object:",object,colors.object)
		if (num_p(op) and (op < op_level)) then
			return ops[op](subject,object,trace)
		elseif sym_p(op) then
			print(trace.."symbol detected")
			if (ops[syms[op]]) then
				print(trace.."executing "..colors[colors.op]..op..colors["clear"])
				return ops[syms[op]](subject,object,trace)
			else
				print "bad opsym!"
				return "!$", trace
			end
		elseif cell_p(op) then 
			print(trace.."fork")
			print(trace.."eval head")
			local head = ev(cons(subject,op),trace)
			report(trace,"branch head:",head,colors.nock)
			print (trace.."eval tail")
			local tail = ev(cons(subject,object),trace)
			report(trace,"branch tail:",head,colors.nock)
			report(trace,"head cons tail:",cons(head,tail),colors.nock)
			return cons(head,tail), trace
		end	
	end
	print "bad eval"
	return "!^", trace
end

function catch(noun,trace)
	if not trace then
		trace = ""
	elseif sym_p(noun) then
		if ("!" == string.sub(noun,1,1)) then
			print(trace.."error:"..noun)
			return noun,trace
		else
			print(trace.."weird symbol"..noun)
			return noun,trace
		end
	else
		return noun, trace
	end
end

ev = hone

function eval(noun) 
 	return ev(noun," ")
end



function rl()
	dofile "axum.lua"
end

tst(Boot)
tst(SymBoot)
