// Agent clara in project GreetingSimple.mas2j

/* Initial beliefs and rules */

calcular(0).
listaResultado([]).
queja("Estoy cansada, vamonos ...").
queja("Tengo hambre y quiero un helado").
burla("Brlllllll ...").
burla("Cara mapache dejanos en paz").
answer(jose, "Que tal en la escuela, Clara?", "Muy bien!"):-
	.print("Muy bien!").
answer(pepe, String, "Entro"):-
	procesa(String) &
	.print("Acabe de procesar").
	
procesa(String) :- 
	calcular(1) &
	leerOperaciones(String, ListaOp) &
	.print("Entro a realizar Operaciones") &
	realizaOperaciones(ListaOp) &
	.print("Salgo de realizar operaciones").

leerOperaciones("", []).
leerOperaciones(" ", []).
leerOperaciones(String, [Op|RestoOp]) :-
	piensa(String, Op, RestoString) &
	.print("Lei piensa y devuelve: ", RestoString) &
	leerOperaciones(RestoString, RestoOp).	
leerOperaciones(String, [Op|RestoOp]) :-
	.print("Lei... Paso a producto con: ", String) &
	producto(String, Op, RestoString) &
	leerOperaciones(RestoString, RestoOp).

leerOperaciones(String, [Op|RestoOp]) :-
	suma(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	resta(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
	
/*leerOperaciones(String, [Op|RestoOp]) :-
	decir(String, Op, RestoString) & resultado(N) & resultadoFinal(N) & .send(adivino,tell,fin(N)).*/

piensa(String, piensa(N,Ndos), RestoString2) :-
	.substring("piensa un número entre ", String, Pos) &
	.length("piensa un número entre ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString) &
	.substring(" y ", RestoString, Pos2) &
	.length(" y ", Length2) &
	.delete(0, Pos2+Length2, RestoString, SufixString2)&
	valor(SufixString2, Ndos, RestoString2) &
	.print("PIENSA - RestoString: ", RestoString2, " N: ", N, " Ndos: ", Ndos).

producto(String, prod(N), RestoString) :-
	.substring("multiplícalo por ", String, Pos) &
	.length("multiplícalo por ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString) &
	.print("PRODUCTO - RestoString: ", RestoString, " N: ", N).

suma(String, add(N), RestoString) :-
	.substring("sumaselo a", String, Pos) &
	.length("sumaselo a", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
	
valor(String, N, RestoString):-
	.substring("resultado anterior", String, Pos) &
	.length("resultado anterior", Length) &
	.delete(0, Pos+Length, String, RestoString) &
	resultado(N).
valor(String, N, RestoString):-
	extraeNumero(String, Numero) &
	.length(Numero, Length) &
	Length > 0 &
	.delete(0, Length, String, RestoString) &
	.term2string(N, Numero).
	
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

addResultado(N,L,[N|L]).
cogerResultado([N2|N1], N2).

realizaOperaciones([]).
realizaOperaciones([piensa(N,Ndos)|Tl]) :-
	Random = Ndos-N &
	.print("Pienso un numero entre ", N, " y ", Ndos) &
	listaResultado(L) &
	NumeroPensado=math.round(math.random(Random))+N &
	addResultado(NumeroPensado,L,LFinal) &
	.abolish(listaResultado(_)) &
	.asserta(listaResultado(LFinal)) &
	.print("ALEATORIO ES: ", NumeroPensado)&
	realizaOperaciones(Tl).
realizaOperaciones([prod(N)|Tl]):-
	listaResultado(L) &
	cogerResultado(L,Res) &
	.print("Hago producto de ", Res, " y ", N) &
	.abolish(resultado(_)) &
	.asserta(resultado(N*Res)) &
	.print("PRODUCTO ES: ", N*Res)&
	realizaOperaciones(Tl).
	
realizaOperaciones([add(N)|Tl]):-
	resultado(Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(N+Res)) &
	realizaOperaciones(Tl).
realizaOperaciones([resta(N)|Tl]):-
	resultado(Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(N-Res)) &
	realizaOperaciones(Tl).
	
/* Initial goals */

/* Plans */

+!digoQue(Frase)[source(Sender)] : answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) <-
		.broadcast(achieve,digoQue(Answer)).

+!digoQue(Frase)[source(pepe)] : .all_names(Agents) & .member(jose,Agents) & .member(pepe,Agents) & queja(Q) 
	<- .print(Q);.broadcast(achieve,queja(Q));  -queja(Q).

+!digoQue(Frase)[source(pepe)] : .count(queja(_),0) & .all_names(Agents) & .member(jose,Agents) & .member(pepe,Agents) & burla(B) 
	<- .print(B);.broadcast(achieve,burla(B));  -burla(B).

+!digoQue(Frase)[source(pepe)] : calcular(1) & answer(pepe, Frase, Answer) & .all_names(All) & .member(pepe,All) <-
		.send(pepe,achieve,digoQue(Answer)).

+!digoQue("calcular")[source(pepe)] <- -calcular(0); +calcular(1).

+!digoQue(Frase):true.
+!impedir(Frase):true.
+!interrupt: .all_names(Agents) <- .abolish(Percepts[Agents]).

+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").	
