// Agent jose in project GreetingSimple.mas2j

/* Initial beliefs and rules */

answer(pepe, "Hola don Jose", "Paso usted por mi casa?"):-
	.print("Jose: Paso usted por mi casa?").
answer(pepe, "Por su casa yo pase", "Vio usted a mi abuela?"):-
	.print("Jose: Vio usted a mi abuela?").
answer(pepe, "A su abuela yo la vi", "Adios don Pepito"):-
	.print("Jose: Adios don Pepito.").
answer(clara, "No me haces caso y se lo dire a mama", "Si que te estoy haciendo caso Clara"):- 
	.print("Si que te estoy haciendo caso Clara").
answer("Hola", "Buenas"):- 
	.print("Buenas").

/* Initial goals */

!start.

/* Plans */

+!start : .all_names(All) & .member(pepe,All) <-  //He de comenzar la conversacion
	.print("Jose: Hola don Pepito");
	.broadcast(tell, digoQue("Hola don Pepito")).
	
+!start <-
	.print("Hola a todos.").

+digoQue(Frase)[source(Sender)] 
	: answer(Sender, Frase, Answer) <-
		.broadcast(tell,digoQue(Answer)).

+digoQue("Adios don Jose")[source(pepe)] <-
	.broadcast(tell, adios);
	.abolish(Percepts[source(pepe)]).
	
+digoQue("Hola") : answer("Hola", Answer) <- 
	.broadcast(tell, digoQue(Answer)).  

+queja(Frase)[source(Sender)]: answer(Sender, Frase, Answer) <- .send(Sender,tell,digoQue(Answer)).
