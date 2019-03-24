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

//!start.

/* Plans */

+saludos(Frase)[source(Sender)] 
	: answer(Sender,Frase,Answer) <-
		.send(Sender,tell,saludos(Answer)).

+adios[source(jose)]: true <- 
	//.print("Adios don Jose");
	.abolish(Percepts[source(jose)]);
	.print("Elimino la conversación de Jose").
		
+hello[source(A)]: true <- 
	//.print("I received a 'hello' from ", A);
	.print("Hola Don Jose.");
	.send(A,tell,hello).

