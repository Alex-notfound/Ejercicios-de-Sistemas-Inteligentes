// Agent blanca in project Proyecto.mas2j
/* Initial beliefs and rules */
answer(clara,"Muy bien!","Saca todo dieces") :- 
	.print("Saca todo dieces").
answer(clara,"Estoy cansada, vamonos ...","Espera un poco") :- 
	.print("Espera un poco").
answer(clara,"Tengo hambre y quiero un helado","No pidas tanto") :- 
	.print("No pidas tanto").
answer(clara,"No me haces caso y se lo dire a mama","Clara, estan hablando los mayores") :- 
	.print("Clara, estan hablando los mayores").
answer(clara,"Brlllllll ...","Deja de molestar") :- 
	.print("Deja de molestar").
answer(clara,"Cara mapache dejanos en paz","Eso no se dice!") :- 
	.print("Eso no se dice!").
answer(clara,"Gaznapiro, bocachancla, callate .....","Eres una maleducada") :- 
	.print("Eres una maleducada").

/* Initial goals */

/* Plans */

+!queja(Frase)[source(Sender)] 
	: answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) <- .broadcast(achieve,digoQue(Answer)).

+!burla(Frase)[source(Sender)] 
	: answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) <- .broadcast(achieve,digoQue(Answer)).

+!digoQue(Frase)[source(Sender)] : answer(Sender, Frase, Answer) & .all_names(All) & .member(Sender,All) & .member(jose,All) <- 
				.broadcast(achieve,digoQue(Answer)).
	
+!digoQue(Frase):true.
+!queja(Frase):true.
+!burla(Frase):true.

+Default[source(A)]: not A=self <- .print("Perdona, no te he entendido").	
