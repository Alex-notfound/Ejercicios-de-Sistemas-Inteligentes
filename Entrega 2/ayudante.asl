// Agent ayudante in project adivinoNacimiento.mas2j

/* Initial beliefs and rules */
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
	
seleccionarSiguiente(L,Publico) :-
	.shuffle(L, Ag) &
	.my_name(Self) &
	.member (Publico, Ag) & 
	not Self = Publico.
	
/* Initial goals */

/* Plans */

+escenario(1)[source(Ag)] : tanda1(Publico) & tanda2(Publico, Res) & tanda3(Res,Res2) <- .print("La victima sera ", Res2); .send(Ag,tell,adivinar2(Res2)).
+escenario(2)[source(Ag)] : .print("2").
+escenario(3)[source(Ag)] : .print("3").//seleccionarSiguiente(L,Publico) <- .send(Ag,tell,adivinar3(Publico) .
