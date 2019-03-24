// Agent clara in project GreetingSimple.mas2j

/* Initial beliefs and rules */
queja("Tio estoy cansada, vamonos ...").
queja("Tengo hambre y quiero un helado").
queja("No me haces caso y se lo dire a mama").
	
burla("Brlllllll ...").
burla("Cara mapache dejanos en paz").
burla("Gaznapiro, bocachancla, callate .....").
	
/* Initial goals */

!interrupt.

/* Plans */

+!interrupt : .all_names(Agents) & .member(jose,Agents) & queja(Q) 
	<- .wait(500); .send(jose,tell,queja(Q)); .print(Q ); -queja(Q); !interrupt.

+!interrupt : .all_names(Agents) & .member(pepe,Agents) & burla(B) 
	<- .wait(300); .send(jose,tell,burla(B)); .print(B); -burla(B); !interrupt.
