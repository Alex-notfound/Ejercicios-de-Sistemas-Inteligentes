// Agent clara in project GreetingSimple.mas2j

/* Initial beliefs and rules */

queja("Estoy cansada, vamonos ...").
queja("Tengo hambre y quiero un helado").
queja("No me haces caso y se lo dire a mama").
	
burla("Brlllllll ...").
burla("Cara mapache dejanos en paz").
burla("Gaznapiro, bocachancla, callate .....").

answer(clara, "No me haces caso y se lo dire a mama", "Si que te estoy haciendo caso Clara"):- 
	.print("Si que te estoy haciendo caso Clara").
	
answer(jose, "Que tal en la escuela, Clara?", "Muy bien!"):-
	.print("Muy bien!").
	
/* Initial goals */

/* Plans */

+!digoQue(Frase)[source(Sender)] : answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) <-
		.broadcast(achieve,digoQue(Answer)).

+!digoQue(Frase)[source(pepe)] : .all_names(Agents) & .member(jose,Agents) & .member(pepe,Agents) & queja(Q) 
	<- .print(Q);.broadcast(achieve,queja(Q));  -queja(Q).

+!digoQue(Frase)[source(pepe)] : .count(queja(_),0) & .all_names(Agents) & .member(jose,Agents) & .member(pepe,Agents) & burla(B) 
	<- .print(B);.broadcast(achieve,burla(B));  -burla(B).
	
+!digoQue(Frase):true.

+!interrupt: .all_names(Agents) <- .abolish(Percepts[Agents]).

+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").	
