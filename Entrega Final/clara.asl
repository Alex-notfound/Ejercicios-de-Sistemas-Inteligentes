// Agent clara in project GreetingSimple.mas2j

/* Initial beliefs and rules */

calcular(0).
queja("Estoy cansada, vamonos ...").
queja("Tengo hambre y quiero un helado").
burla("Brlllllll ...").
burla("Cara mapache dejanos en paz").
answer(jose, "Que tal en la escuela, Clara?", "Muy bien!"):-
	.print("Muy bien!").
answer(pepe, String, "Entro"):-
	procesa(String) &
	.print("Acabe de procesar").
	
procesa(String) :- calcular(1) &
	leerOperaciones(String, ListaOp) &
	.print("Entro a realizar Operaciones") &
	realizaOperaciones(ListaOp) &
	.print("Salgo de realizar operaciones").

leerOperaciones("", []).	
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
/*
leerOperaciones(String, RestoOp) :-
	.delete(0,1,String,RestoString) &
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
	.substring("Suma ", String, Pos) &
	.length("Suma ", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
suma(String, add(N), RestoString) :-
	.substring("Sumale ", String, Pos) &
	.length("Sumale ", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
suma(String, add(N), RestoString) :-
	.substring("suma ", String, Pos) &
	.length("suma ", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
suma(String, add(N), RestoString) :-
	.substring("sumale ", String, Pos) &
	.length("sumale ", Length) &
	.delete(0, Pos+Length, String, RestString) &
	valor(RestString, N, RestoString).
	
valor(String, N, RestoString):-
	.substring("edad", String, Pos) &
	.length("edad", Length) &
	.delete(0, Pos+Length, String, RestoString) &
	edad(N).
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

realizaOperaciones([]).
realizaOperaciones([piensa(N,Ndos)|Tl]):-
	Random = Ndos-N &
	.print("Pienso un numero entre ", N, " y ", Ndos) &
	.abolish(resultado(_)) &
	.asserta(resultado(math.round(math.random(Random))+N)) &
	realizaOperaciones(Tl).
	
realizaOperaciones([add(numero(N))|Tl]):-
	.abolish(numero(_)) &
	.asserta(numero(N)) &
	realizaOperaciones(Tl).
realizaOperaciones([add(N)|Tl]):-
	resultado(Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(N+Res)) &
	realizaOperaciones(Tl).
realizaOperaciones([prod(N)|Tl]):-
	numero(Res) &
	.abolish(resultado(_)) &
	.asserta(resultado(N*Res)) &
	realizaOperaciones(Tl).
	
/* Initial goals */

/* Plans */

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
