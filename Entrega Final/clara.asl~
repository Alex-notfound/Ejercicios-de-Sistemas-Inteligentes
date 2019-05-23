// Agent clara in project GreetingSimple.mas2j

/* Initial beliefs and rules */

queja("Tio estoy cansada, vamonos ...").
queja("Tengo hambre y quiero un helado").
queja("No me haces caso y se lo dire a mama").
	
burla("Brlllllll ...").
burla("Cara mapache dejanos en paz").
burla("Gaznapiro, bocachancla, callate .....").

answer(jose, "Si que te estoy haciendo caso Clara", "Asi me gusta"):-
	.print("Asi me gusta").
	
/* Initial goals */

/* Plans */

+!digoQue(Frase)[source(Sender)] 
	: answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) <-
		.send(Sender,achieve,digoQue(Answer)).

+!digoQue(Frase) : .all_names(Agents) & .member(jose,Agents) & queja(Q) 
	<- .print(Q);.broadcast(achieve,queja(Q));  -queja(Q).

+!digoQue(Frase) : .count(queja(_),0) & .all_names(Agents) & .member(jose,Agents) & burla(B) 
	<- .print(B);.broadcast(achieve,burla(B));  -burla(B); !interrupt.
	
+!digoQue(Frase):true.

+!interrupt: .all_names(Agents) <- .abolish(Percepts[Agents]).
