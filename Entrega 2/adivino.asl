// Agent adivino in project adivinoNacimiento.mas2j

/* Initial beliefs and rules */

escoge(Publico) :-
	.all_names(Agentes) & 
	.shuffle(Agentes, Ag) &
	.my_name(Self) &
	.member (Publico, Ag) & 
	not Self = Publico.
	
calcula(N,Edad,Mes) :-
	Numero = N-250 &
	Edad = Numero mod 100 &
	Mes = Numero div 100.

seleccionaEscenario(N):-
	N = math.round(math.random(2))+1.
numAgentes(0).

/* Initial goals */
!start.

/* Plans */

+!start : seleccionaEscenario(N) <- .print("Escenario: ", N);
		if(N==1){while(numAgentes(X) & X<55){.create_agent(publico,"publico.asl");-+numAgentes(X+1);}!adivinar}
		if(N==2){while(numAgentes(X) & X<105){.create_agent(publico,"publico.asl");-+numAgentes(X+1);}.send(ayudante,tell,escenario(2))}
		if(N==3){while(numAgentes(X) & X<35){.create_agent(publico,"publico.asl");-+numAgentes(X+1);}.send(ayudante,tell,escenario(3))}.

+!adivinar : escoge(Publico) <- 
	.print("Escojo al agente ",Publico);
	.send(Publico,tell,solicitud("Memoriza el número de orden del mes de nacimiento."));
	.print("Memoriza el número de orden del mes de nacimiento.");
	.wait(400);
	.print("A continuacion multiplicalo por 2, sumale 5 y memorizalo");
	.send(Publico,tell,solicitud("A continuacion multiplicalo por 2"));
	.wait(400);
	.send(Publico,tell,solicitud("sumale 5"));
	.wait(400);
	.send(Publico,tell,solicitud("y memorizalo"));
	.wait(400);
	.print("Ahora multiplica el número memorizado por 50 y memorizalo nuevamente.");
	.send(Publico,tell,solicitud("Ahora multiplica 50 y memorizalo nuevamente."));
	.wait(400);
	.print("Suma al numero memorizado tu edad y dime el resultado");
	.send(Publico,tell,solicitud("Suma al numero memorizado tu edad"));
	.wait(400);
	.send(Publico,tell,dime("Resultado")).

+adivinar2(Publico) <- 
	.send(Publico,tell,solicitud("Memoriza el número de orden del mes de nacimiento."));
	.print("Memoriza el número de orden del mes de nacimiento.");
	.wait(400);
	.print("A continuacion multiplicalo por 2, sumale 5 y memorizalo");
	.send(Publico,tell,solicitud("A continuacion multiplicalo por 2"));
	.wait(400);
	.send(Publico,tell,solicitud("sumale 5"));
	.wait(400);
	.send(Publico,tell,solicitud("y memorizalo"));
	.wait(400);
	.print("Ahora multiplica el número memorizado por 50 y memorizalo nuevamente.");
	.send(Publico,tell,solicitud("Ahora multiplica 50 y memorizalo nuevamente."));
	.wait(400);
	.print("Suma al numero memorizado tu edad y dime el resultado");
	.send(Publico,tell,solicitud("Suma al numero memorizado tu edad"));
	.wait(400);
	.send(Publico,tell,dime("Resultado")).

+adivinar3(Publico) <- 
.send(Publico,tell,solicitud("Memoriza el número de orden del mes de nacimiento."));
	.print("Memoriza el número de orden del mes de nacimiento.");
	.wait(400);
	.print("A continuacion multiplicalo por 2, sumale 5 y memorizalo");
	.send(Publico,tell,solicitud("A continuacion multiplicalo por 2"));
	.wait(400);
	.send(Publico,tell,solicitud("sumale 5"));
	.wait(400);
	.send(Publico,tell,solicitud("y memorizalo"));
	.wait(400);
	.print("Ahora multiplica el número memorizado por 50 y memorizalo nuevamente.");
	.send(Publico,tell,solicitud("Ahora multiplica 50 y memorizalo nuevamente."));
	.wait(400);
	.print("Suma al numero memorizado tu edad y dime el resultado");
	.send(Publico,tell,solicitud("Suma al numero memorizado tu edad"));
	.wait(400);
	.send(Publico,tell,dime("Resultado"));
	.wait(600);
	.abolish(Percepts[source(ayudante)]);
	.send(ayudante,tell,escenario(3)).
	
+fin(N)[source(Ag)]<-
	?calcula(N,Edad,Mes);
	.wait(400);
	.send(Ag,tell,tuMesEdad(Mes,Edad)).

+hasAcertado(Edad, Mes)[source(Ag)] <- 
	.print("El agente ", Ag," ha nacido en el mes ", Mes," y tiene ", Edad, " años.").
	
+hasErrado[source(Ag)] <- 
	.print("El agente ", Ag, " o no sabe cuando ha nacido, o no sabe operar.").

