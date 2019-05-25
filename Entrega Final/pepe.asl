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
		//.wait(1000);
		.broadcast(achieve,digoQue(Answer)).

+!adios[source(jose)] : .all_names(All) & .member(clara,All)  <- 
		//.wait(1000);
		.send(clara,achieve,digoQue("calcular"));
		.print("Clara piensa un n�mero entre 20 y 40. Ahora multipl�calo por 100");
		.send(clara,achieve,digoQue("Clara piensa un n�mero entre 20 y 40. Ahora multipl�calo por 100")).
		//.wait(2000);
		//.print("Muy bien Clara, lo est�s haciendo muy bien. A continuaci�n piensa un n�mero entre 50 y 60 y sumaselo al resultado anterior. Lo tienes; muy bien ahora resta 101 y dime el resultado");
		//.send(clara,achieve,digoQue("Muy bien Clara, lo est�s haciendo muy bien. A continuaci�n piensa un n�mero entre 50 y 60 y sumaselo al resultado anterior. Lo tienes; muy bien ahora resta 101 y dime el resultado")).

+!digoQue(Frase):true.
+!burla(Frase) <- .suspend(digoQue(S)); .wait({+!impedir(X)}); .resume(digoQue(S)).
+!queja(Frase) <- .suspend(digoQue(S)); .wait({+!impedir(X)}); .resume(digoQue(S)).
+!impedir(Frase):true.
+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").
