// Agent jose in project GreetingSimple.mas2j

/* Initial beliefs and rules */

answer(pepe, "Hola don Jose", "Paso usted por mi casa?"):-
	.print("Jose: Paso usted por mi casa?").
answer(pepe, "Por su casa yo pase", "Vio usted a mi abuela?"):-
	.print("Jose: Vio usted a mi abuela?").
answer(pepe, "A su abuela yo la vi", "Adios don Pepito"):-
	.print("Jose: Adios don Pepito.").
answer(blanca, "Hace buen tiempo", "La verdad es que si"):- 
	.print("La verdad es que si").
answer(blanca,"Saca todo dieces","Me alegro") :- 
	.print("Me alegro").

/* Initial goals */

!start.

/* Plans */

+!start : .all_names(All) & .member(blanca,All) & .member(clara,All)<- 
	.print("Que tal en la escuela, Clara?");
	.send(clara,achieve,digoQue("Que tal en la escuela, Clara?"));
	.wait(500);
	!saludarAPepe.
	
+!saludarAPepe : .all_names(All) & .member(pepe,All) <-
	.print("Jose: Hola don Pepito");
	.broadcast(achieve,digoQue("Hola don Pepito")).
	
+!digoQue(Frase)[source(Sender)] : answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All)<-
	.wait(500);
	.broadcast(achieve,digoQue(Answer)).
	
+!digoQue("Adios don Jose")[source(pepe)]: .all_names(All) & .member(pepe,All) <-
	.send(pepe,achieve,adios).

+!digoQue(Frase):true.
+!burla(Frase) <- .suspend(digoQue(S)); .wait({+!impedir(X)}); .resume(digoQue(S)).
+!queja(Frase) <- .suspend(digoQue(S)); .wait({+!impedir(X)}); .resume(digoQue(S)).
+!impedir(Frase):true.
+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").		
