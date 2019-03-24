// Agent Pepe in project GreetingSimple.mas2j

/* Initial beliefs and rules */

answer(jose, "Hola don Pepito", "Hola don Jose"):-
	.print("Pepito: Hola don Jose").
answer(jose, "Paso usted por mi casa?", "Por su casa yo pase"):-
	.print("Pepito: Por su casa yo pase").
answer(jose, "Vio usted a mi abuela?", "A su abuela yo la vi"):-
	.print("Pepito: A su abuela yo la vi").
answer(jose, "Adios don Pepito", "Adios don Jose"):-
	.print("Pepito: Adios don Jose.").

/* Initial goals */

/* Plans */

+!digoQue(Frase)[source(Sender)] : answer(Sender,Frase,Answer) & .all_names(All) & .member(Sender,All)<-
		.wait(1000);
		.broadcast(achieve,digoQue(Answer)).

+!adios[source(jose)]: true <- 
	.abolish(Percepts[source(jose)]).
	
+!queja(Frase):true.

+!burla(Frase):true.
