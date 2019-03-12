// Agent publico in project adivinoNacimiento.mas2j

/* Initial beliefs and rules */
creaMes(Mes) :- 
	Mes = math.round(math.random(11))+1.

creaEdad(Edad) :-
	Edad = math.round(math.random(99)).
	
convertirMes(enero,1).
convertirMes(febrero,2).
convertirMes(marzo,3).
convertirMes(abril,4).
convertirMes(mayo,5).
convertirMes(junio,6).
convertirMes(julio,7).
convertirMes(agosto,8).
convertirMes(septiembre,9).
convertirMes(octubre,10).
convertirMes(noviembre,11).
convertirMes(diciembre,12).

procesa(String) :-
	leerOperaciones(String, ListaOp) &
	realizaOperaciones(ListaOp).

leerOperaciones("", []).	
	
leerOperaciones(String, [Op|RestoOp]) :-
	producto(String, Op, RestoString) &
	leerOperaciones(RestoString, RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	memoriza(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	suma(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	reparte(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	resta(String, Op, RestoString) &
	leerOperaciones(RestoString,RestoOp).
leerOperaciones(String, [Op|RestoOp]) :-
	decir(String, Op, RestoString) & resultado(N) & resultadoFinal(N) & .send(adivino,tell,fin(N)).

producto(String, prod(N), RestoString) :-
	.substring("Multiplica ", String, Pos) &
	.length("Multiplica ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("Multiplicale", String, Pos) &
	.length("Multiplicale", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("Multiplicalo por ", String, Pos) &
	.length("Multiplicalo por ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("multiplica ", String, Pos) &
	.length("multiplica ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("multiplicale ", String, Pos) &
	.length("multiplicale ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
	valor(SufixString, N, RestoString).
producto(String, prod(N), RestoString) :-
	.substring("multiplicalo por ", String, Pos) &
	.length("multiplicalo por ", Length) &
	.delete(0, Pos+Length, String, SufixString) &
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
+!start : creaMes(Mes) & convertirMes(Nombre,Mes) & creaEdad(Edad) 
	<- +edad(Edad) ; +naciEn(Mes) ; +resultado(Mes).
	
+solicitud(String) : procesa(String) & resultado(Y) <- .print("Realizado: ",String, " | Total: ", Y).

+dime(S)[source(Ag)] : resultado(N) <- .send(Ag,tell,fin(N)); .print("El numero es ", N).	

+tuMesEdad(Mes,Edad)[source(Ag)] : edad(Edad) & naciEn(Mes) <-
	.send(Ag,tell,hasAcertado(Edad,Mes)).
	
+tuMesEdad(Mes,Edad)[source(Ag)] : not edad(Edad) | not naciEn(Mes) <- 
	.send(Ag,tell,hasErrado);
	.print(Mes, " no es mi mes de nacimiento y no tengo ", Edad," años.").
