// Agent clara in project GreetingSimple.mas2j

/* Initial beliefs and rules */

calcular(0).
listaResultado([]).
addResultado(N,L,[N|L]).
cogerResultado([N2|N1], N2).
queja("Estoy cansada, vamonos ...").
queja("Tengo hambre y quiero un helado").
burla("Brlllllll ...").
burla("Cara mapache dejanos en paz").
answer(jose, "Que tal en la escuela, Clara?", "Muy bien!"):- .print("Muy bien!").
answer(pepe, String, Respuesta):-
	procesa(String) &
	respuesta(Respuesta).
	
respuesta("Bravo, bravo, más, más. Mama, tio Jose habeis visto lo que ha hecho") :- 
	adivino(1) & 
	.print("Bravo, bravo, más, más. Mama, tio Jose habeis visto lo que ha hecho") &
	.abolish(adivino(_)) &
	.asserta(adivino(0)).
respuesta(Answer) :-
	decir(1) & 
	resultado(Answer) & 
	.print("El resultado es ", Answer) & 
	.abolish(decir(1)).
respuesta("").

procesa(String) :- 
	calcular(1) &
	leerOperaciones(String, ListaOp) &
	realizaOperaciones(ListaOp).

leerOperaciones("", []).
leerOperaciones(String, []) :-
	adivina(String).
leerOperaciones(String, [Op|RestoOp]) :-
	piensa(String, Op, RestoString) &
	leerOperaciones(RestoString, RestoOp).	
leerOperaciones(String, [Op|RestoOp]) :-
	producto(String, Op, RestoString) &
	leerOperaciones(RestoString, RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	suma(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	resta(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, []) :- 
	dime(String) & 
	.abolish(decir(_)) &
	.asserta(decir(1)).
leerOperaciones(String, []).

comprobar(N1,N2) :-
	listaResultado(L) &
	cogerResultado(L,TestN2) &
	TestN2 == N2 &
	.delete(0,L,L2) &
	cogerResultado(L2,TestN1) &
	TestN1 == N1 &
	.abolish(adivino(_)) &
	.asserta(adivino(1)).
comprobar(N1,N2) :-
	.abolish(adivino(_)) &
	.asserta(adivino(0)).
	
adivina(String) :-
	.substring("primer numero que pensaste es ", String, Pos) &
	.length("primer numero que pensaste es ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString) &
	.substring(" y el segundo ", RestoString, Pos2) &
	.length(" y el segundo ", Length2) &
	.delete(0, Pos2+Length2, RestoString, SufixString2)&
	valor(SufixString2, Ndos, RestoString2) &
	comprobar(N,Ndos).
piensa(String, piensa(N,Ndos), RestoString2) :-
	.substring("piensa un número entre ", String, Pos) &
	.length("piensa un número entre ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString) &
	.substring(" y ", RestoString, Pos2) &
	.length(" y ", Length2) &
	.delete(0, Pos2+Length2, RestoString, SufixString2)&
	valor(SufixString2, Ndos, RestoString2).
producto(String, prod(N), RestoString) :-
	.substring("multiplícalo por ", String, Pos) &
	.length("multiplícalo por ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString).
suma(String, add(N), RestoString) :-
	.substring("suma", String, Pos) &
	.length("suma", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
resta(String, resta(N), RestoString) :-
	.substring(" resta ", String, Pos) &
	.length(" resta ", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
dime(String) :-
	.substring("dime el resultado", String, Pos).
	
valor(String, N, RestoString):-
	extraeNumero(String, Numero) &
	.length(Numero, Length) &
	Length > 0 &
	.delete(0, Length, String, RestoString) &
	.term2string(N, Numero).
	
valor(String, N, RestoString):-
	.substring("resultado", String, Pos) &
	.length("resultado", Length) &
	.delete(0, Pos+Length, String, RestoString) &
	resultado(N).
	
extraeNumero(String, Numero) :- 
	posicionEn(0, String, Position) &
	.substring(String, RestoString, 1) &
	extraeNumero(RestoString, NuevoNumero) &
	.concat(Position, NuevoNumero, Numero).
extraeNumero(String, "").
posicionEn(N, String, Position) :-
	posicion(Position) &
	.substring(Position, String, N1) & N1 = 0.
	
posicion("0").
posicion("1").
posicion("2").
posicion("3").
posicion("4").
posicion("5").
posicion("6").
posicion("7").
posicion("8").
posicion("9").

realizaOperaciones([]).
realizaOperaciones([piensa(N,Ndos)|Tl]) :-
	Random = Ndos-N &
	listaResultado(L) &
	NumeroPensado=math.round(math.random(Random))+N &
	addResultado(NumeroPensado,L,LFinal) &
	.abolish(listaResultado(_)) &
	.asserta(listaResultado(LFinal)) &
	realizaOperaciones(Tl).
realizaOperaciones([prod(N)|Tl]):-
	listaResultado(L) &
	cogerResultado(L,Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(N*Res)) &
	realizaOperaciones(Tl).
realizaOperaciones([add(N)|Tl]):-
	listaResultado(L) &
	cogerResultado(L,Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(N+Res)) &
	realizaOperaciones(Tl).
realizaOperaciones([resta(N)|Tl]):-
	resultado(Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(Res-N)) &
	realizaOperaciones(Tl).

/* Initial goals */

/* Plans */

+!digoQue(Frase)[source(pepe)] : calcular(1) & answer(pepe, Frase, Answer) & .all_names(All) & .member(pepe,All) <-
		.broadcast(achieve,digoQue(Answer)).
+!digoQue(Frase)[source(Sender)] : answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) <-
		.broadcast(achieve,digoQue(Answer)).
		
+!digoQue(Frase)[source(pepe)] : .all_names(Agents) & .member(jose,Agents) & .member(pepe,Agents) & queja(Q) 
	<- .print(Q);.broadcast(achieve,queja(Q));  -queja(Q).
+!digoQue(Frase)[source(pepe)] : .count(queja(_),0) & .all_names(Agents) & .member(jose,Agents) & .member(pepe,Agents) & burla(B) 
	<- .print(B);.broadcast(achieve,burla(B));  -burla(B).
+!digoQue("calcular")[source(pepe)] <- -calcular(0); +calcular(1).

+!digoQue(Frase):true.
+!impedir(Frase):true.
+!interrupt: .all_names(Agents) <- .abolish(Percepts[Agents]).

+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").	
