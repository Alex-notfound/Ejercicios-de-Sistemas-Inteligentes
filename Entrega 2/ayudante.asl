// Agent ayudante in project adivinoNacimiento.mas2j

/* Initial beliefs and rules */
crearDescartados(L):-
	.concat([ayudante],[adivino],L).
tanda1(Publico) :-
	.all_names(Agentes) & 
	.my_name(Self) & 
	.delete(Self, Agentes, Ag)&
	.delete(adivino, Ag, Ag2)&
	.shuffle(Ag2, Ag3)& 
	.length(Ag3,Lenght)&
	.delete(0,Lenght-10,Ag3,Publico).

tanda2(Publico, Res) :-
	.shuffle(Publico, Ag) &
	.length(Ag,Lenght)&
	.delete(0,Lenght-5,Ag,Res).

tanda3(Publico,Res2) :-
	.shuffle(Publico, Ag) &
	.member(Res2, Ag).
	
seleccionarSiguiente(Publico) :-
	.all_names(Agentes)&
	descartados(L)&
	.difference(Agentes, L, Ag)&
	.shuffle(Ag, Ag2) &
	.member (Publico, Ag2)&
	.concat(L,[Publico],X)&
	.abolish(descartados(_)) &
	.asserta(descartados(X)).

/* Initial goals */

!start.

/* Plans */

+!start : crearDescartados(L) <- +descartados(L).

+escenario(2)[source(Ag)] : tanda1(Publico) & tanda2(Publico, Res) & tanda3(Res,Res2) <- .print("La victima sera ", Res2); .send(Ag,tell,adivinar2(Res2)).
+escenario(3)[source(Ag)] : seleccionarSiguiente(Publico) <- .print("La siguiente victima sera ", Publico); .send(Ag,tell,adivinar3(Publico)); .abolish(Percepts[source(Ag)]).
