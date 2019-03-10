// Agent adivino in project adivinoNacimiento.mas2j

/* Initial beliefs and rules */

escoge(Publico) :-
	.all_names(Agentes) & 
	.my_name(Self) &
	.member (Publico, Agentes) & 
	not Self = Publico.
	
calcula(N,Edad,Mes) :-
	Numero = N-250 &
	Edad = Numero mod 100 &
	Mes = Numero div 100.
	
/* Initial goals */

!adivinar.

/* Plans */
+!adivinar : escoge(Publico) <- 
	.print("Escojo al agente ",Publico);
	.send(Publico,tell,solicitud("Memoriza el número de orden del mes de nacimiento."));
	.print("Memoriza el número de orden del mes de nacimiento.");
	.wait(400);
	.print("Multiplica 2");
	.send(Publico,tell,solicitud("Multiplica 2"));
	.wait(400);
	.print("suma 5");
	.send(Publico,tell,solicitud("Suma 5"));
	.wait(400);
	.print("Memoriza el número");
	.send(Publico,tell,solicitud("Memorizalo"));
	.wait(400);
	.print("Ahora multiplica el número memorizado por 50 y memorízalo nuevamente.");
	.send(Publico,tell,solicitud("multiplica 50 y memorizalo nuevamente."));
	.wait(400);
	.print("Suma al numero memorizado tu edad y dime el resultado");
	.send(Publico,tell,solicitud("Suma al numero memorizado tu edad"));
	.wait(400);
	.send(Publico,tell,dime("Resultado")).

+fin(N)[source(Ag)]<-
	?calcula(N,Edad,Mes);
	.wait(400);
	.send(Ag,tell,tuMesEdad(Mes,Edad)).

+hasAcertado(Edad, Mes)[source(Ag)] <- 
	.print("El agente ", Ag," ha nacido en el mes ", Mes," y tiene ", Edad, " años.").
	
+hasErrado[source(Ag)] <- 
	.print("El agente ", Ag, " o no sabe cuando ha nacido, o no sabe operar.").

