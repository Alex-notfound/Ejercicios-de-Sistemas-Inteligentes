// Agent jose in project GreetingSimple.mas2j

/* Initial beliefs and rules */

answer(pepe, "Hola don Jose", "Paso usted por mi casa?"):-
	.print("Jose: Paso usted por mi casa?").
answer(pepe, "Por su casa yo pase", "Vio usted a mi abuela?"):-
	.print("Jose: Vio usted a mi abuela?").
answer(pepe, "A su abuela yo la vi", "Adios don Pepito"):-
	.print("Jose: Adios don Pepito.").

/* Initial goals */

!start.

/* Plans */

+!start //: true <- 
	: .all_names(All) & .member(pepe,All) <-  //He de comenzar la conversacion
	.print("Jose: Hola don Pepito");
	.send(pepe, tell, saludos("Hola don Pepito")).
	
+!start <-
	.print("Hola a todos.").

+saludos(Frase)[source(Sender)] 
	: answer(Sender, Frase, Answer) <-
		.send(Sender,tell,saludos(Answer)).

+saludos("Adios don Jose")[source(pepe)] <-
	.send(pepe, tell, adios);
	.abolish(Percepts[source(pepe)]);
	.print("Elimino la conversación de Pepe").
	
+hello[source(pepe)]: true <- 
	.print("Paso usted por mi casa?"). // Completar a partir de aqui
	
/*

La conversación entera es:

jose: Hola D. Pepito
pepe: Hola D. Jose
jose: Paso usted por mi casa?
pepe: Por su casa yo pase
jose: Vio usted a mi abuela
pepe: A su abuela yo la vi
jose: Adios D. Pepito
pepe: Adios D. Jose

*/

