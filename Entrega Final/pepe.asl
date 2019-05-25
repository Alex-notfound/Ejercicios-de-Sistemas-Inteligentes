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
answer(clara,N,N1,N2) :- 
	resultado2(N2) & 
	resultado1(N+101-N2,N1) &
	(N1*100 + N2 - 101 == N).

resultado1(N,Toret):- 
	Toret = N div 100 &
	Toret > 19 & 
	Toret < 41.

resultado2(50).
resultado2(51).
resultado2(52).
resultado2(53).
resultado2(54).
resultado2(55).
resultado2(56).
resultado2(57).
resultado2(58).
resultado2(59).
resultado2(60).

/* Initial goals */

/* Plans */

+!digoQue(Frase)[source(Sender)] : answer(Sender,Frase,Answer) & .all_names(All) & .member(Sender,All)<-
		.wait(500);
		.broadcast(achieve,digoQue(Answer)).
		
+!adios[source(jose)] : .all_names(All) & .member(clara,All)  <- 
		.wait(500);
		.send(clara,achieve,digoQue("calcular"));
		.print("Clara piensa un número entre 20 y 40. Ahora multiplícalo por 100");
		.send(clara,achieve,digoQue("Clara piensa un número entre 20 y 40. Ahora multiplícalo por 100"))
		.wait(500);
		.print("Muy bien Clara, lo estás haciendo muy bien. A continuación piensa un número entre 50 y 60 y sumaselo al resultado anterior. Lo tienes; muy bien ahora resta 101 y dime el resultado");
		.send(clara,achieve,digoQue("Muy bien Clara, lo estás haciendo muy bien. A continuación piensa un número entre 50 y 60 y sumaselo al resultado anterior. Lo tienes; muy bien ahora resta 101 y dime el resultado"));
		+calcular(1).

+!digoQue(N)[source(clara)] : calcular(1) & answer(clara,N,N1,N2) & .all_names(All) & .member(clara,All)<- 
		-calcular(1);
		.concat("Pues verás Clara el primer numero que pensaste es ", N1," y el segundo ", N2,X);
		.print(X);
		.send(clara,achieve,digoQue(X)).
		
+!digoQue(Frase):true.
+!burla(Frase) <- .suspend(digoQue(S)); .wait({+!impedir(X)}); .resume(digoQue(S)).
+!queja(Frase) <- .suspend(digoQue(S)); .wait({+!impedir(X)}); .resume(digoQue(S)).
+!impedir(Frase):true.
+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").
