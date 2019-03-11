// Agent publico in project adivinoNacimiento.mas2j

/* Initial beliefs and rules */
creaMes(Mes) :- 
	Mes = math.round(math.random(11))+1.

creaEdad(Edad) :-
	Edad = math.round(math.random(99)).
	
convierteMes(enero,1).
convierteMes(febrero,2).
convierteMes(marzo,3).
convierteMes(abril,4).
convierteMes(mayo,5).
convierteMes(junio,6).
convierteMes(julio,7).
convierteMes(agosto,8).
convierteMes(septiembre,9).
convierteMes(octubre,10).
convierteMes(noviembre,11).
convierteMes(diciembre,12).

procesa(String) :-
	identificaOperaciones(String, ListaOp) &
	realizaOperaciones(ListaOp).

identificaOperaciones("", []).	
	
identificaOperaciones(String, [Op|RestoOp]) :-
	producto(String, Op, RestoString) &
	identificaOperaciones(RestoString, RestoOp).
identificaOperaciones(String, [Op|RestoOp]) :-
	memoriza(String, Op, RestoString) &
	identificaOperaciones(RestoString,RestoOp).
identificaOperaciones(String, [Op|RestoOp]) :-
	suma(String, Op, RestoString) &
	identificaOperaciones(RestoString,RestoOp).
identificaOperaciones(String, [Op|RestoOp]) :-
	reparte(String, Op, RestoString) &
	identificaOperaciones(RestoString,RestoOp).
identificaOperaciones(String, [Op|RestoOp]) :-
	resta(String, Op, RestoString) &
	identificaOperaciones(RestoString,RestoOp).
identificaOperaciones(String, [Op|RestoOp]) :-
	decir(String, Op, RestoString) & resultado(N) & resultadoFinal(N) & .send(adivino,tell,fin(N)).

producto(String, prod(N), RestoString) :-
	.substring("Multiplica ", String, Pos) &
	.length("Multiplica ", Length) &
	.delete(Pos, Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("multiplica ", String, Pos) &
	.length("multiplica ", Length) &
	.delete(Pos, Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("multiplica por ", String, Pos) &
	.length("multiplica por ", Length) &
	.delete(Pos, Length, String, SufixString) &
	valor(SufixString, N, RestoString).

memoriza(String, add(numero(N)), "") :-
	.substring("Memoriza ", String) &
	resultado(N).
memoriza(String, add(numero(N)), "") :-
	.substring("memoriza ", String) &
	resultado(N).
memoriza(String, add(numero(N)), "") :-
	.substring("Memorizalo", String) &
	resultado(N).
memoriza(String, add(numero(N)), "") :-
	.substring("memorizalo", String) &
	resultado(N).
suma(String, add(N), RestoString) :-
	.substring("Suma ", String, Pos) &
	.length("Suma ", Length) &
	.delete(Pos, Length, String, RestString) &
	valor(RestString, N, RestoString).
suma(String, add(N), RestoString) :-
	.substring("suma ", String, Pos1) &
	.length("suma ", Length) &
	.delete(Pos, Length, String, RestString) &
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

!start.

/* Plans */
+!start : creaMes(Mes) & convierteMes(Nombre,Mes) & creaEdad(Edad) 
	<- +edad(Edad) ; +naciEn(Mes) ; +resultado(Mes).
	
+solicitud(String) : procesa(String) & resultado(Y) <- .print("Realizado: ",String, " | Total: ", Y).

+dime(S)[source(Ag)] : resultado(N) <- .send(Ag,tell,fin(N)); .print("El numero es ", N).	

+tuMesEdad(Mes,Edad)[source(Ag)] : edad(Edad) & naciEn(Mes) <-
	.send(Ag,tell,hasAcertado(Edad,Mes)).
	
+tuMesEdad(Mes,Edad)[source(Ag)] : not edad(Edad) | not naciEn(Mes) <- 
	.send(Ag,tell,hasErrado);
	.print(Mes, " no es mi mes de nacimiento y no tengo ", Edad," años.").
