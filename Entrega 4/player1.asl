/* Initial beliefs and rules */

prioridad(2000).

estudiarJugada(X,Y):- 
recorridoVertical(X,0).

recorridoVertical(X,Y) :-
tablero(X,Y,1) & Y=Y+1 & recorridoVertical(X,Y,S).

raya([16,16,16,0],X,P) :- .print("Entra en zona ganadora") & P=1 & X=3.
raya([0,16,16,16],X,P) :- .print("Entra en zona ganadora") & P=1 & X=0.
raya([16,16,0,16],X,P) :- .print("Entra en zona ganadora") & P=1 & X=2.
raya([16,0,16,16],X,P) :- .print("Entra en zona ganadora") & P=1 & X=1.

raya([16,16,0,0],X,P) :- P=3 & X=3.
raya([0,16,16,0],X,P) :- P=3 & X=0.
raya([0,0,16,16],X,P) :- P=3 & X=0.
raya([0,16,0,16],X,P) :- P=3 & X=0.
raya([16,0,16,0],X,P) :- P=3 & X=1.
raya([16,0,0,16],X,P) :- P=3 & X=2.

raya([16,0,0,0],X,P) :- P=10 & X=3.
raya([0,16,0,0],X,P) :- P=10 & X=3.
raya([0,0,16,0],X,P) :- P=10 & X=0.
raya([0,0,0,16],X,P) :- P=10 & X=0.

raya([0,0,0,0],X,P) :- P=100 & X=1.

raya([17,17,17,0],X,P) :- P=2 & X=3.
raya([0,17,17,17],X,P) :- P=2 & X=0.
raya([17,17,0,17],X,P) :- P=2 & X=2.
raya([17,0,17,17],X,P) :- P=2 & X=1.

raya([17,17,0,0],X,P) :- P=4 & X=3.
raya([0,17,17,0],X,P) :- P=4 & X=0.
raya([0,0,17,17],X,P) :- P=4 & X=0.
raya([0,17,0,17],X,P) :- P=4 & X=0.
raya([17,0,17,0],X,P) :- P=4 & X=1.

raya([17,0,0,0],X,P) :- P=20 & X=3.
raya([0,17,0,0],X,P) :- P=20 & X=3.
raya([0,0,17,0],X,P) :- P=20 & X=0.
raya([0,0,0,17],X,P) :- P=20 & X=0.

raya([_,_,_,_],X,P) :- P=1000 & X=0.

/*
prioridad(PM,P,PM) :- PM<=P & .print("2 priority: ", PM) .
prioridad(PM,P,P) :- PM>P & .print("3 priority: ", P).

cambiarPrioridad(PrioridadMayor,NuevaPrioridad):- PrioridadMayor=NuevaPrioridad.
*/

/* Initial goals */

!start.

/* Plans */

+!start <-.wait(turno(player1)); !jugar.

//+!jugar : estrategia(jugarAGanar) & tablero(X,Y,0) <- put(X,Y); !start.

+!jugar : estrategia(jugarAGanar) & tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]) & tablero(X,Y,0) <- put(X,Y); !start.

+!jugar : estrategia(jugarAGanar) <- !buscar4enRaya; .print("FIN");!start.

+!buscar4enRaya : tablero(L) <-
	.length(L, Tam);
	//Se obtiene la raya a analizar y se analiza
	for( .range(Num,0,64)){
		PosicionHorizontal = (Num mod 8);
		//Descarta las casillas ya evaluadas
		if(Num<60){.delete(0,Num,L,Tablero);}
		else{.delete(0,60,L,Tablero);}
		//Descarta las casillas que se evaluaran posteriormente
		.delete(4,Tam,Tablero,Raya);
		.print("Raya: ", Raya);
		?raya(Raya,Solucion,P);		
		if(P==1){
			.print("Voy a ganar");
			put(PosicionHorizontal+Solucion,Num/8);
		}
		?prioridad(PM);
		if(P<PM){
			.print("P es ", P, " y PM es ", PM);
			-+prioridad(P);
			X=PosicionHorizontal+Solucion;
			-+x(X);
			Div=Num/8;
			Y=Div mod 10;
			-+y(Y);
			.print("[",X,",",Y,"]");
		}
		//.print("Eje X: ", PosicionHorizontal, " y Numero: ", Num);	
	}
	?prioridad(PF);
	if(PF<1000){
		?x(X);
		?y(Y);
		put(X,Y);
	}
	else{
		?tablero(Q,W,0);
		put(Q,W)
	}
	-+prioridad(2000).
			
+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V) <- put(X,Y); !start.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self & not A=percept <- .print("Ignoro al agente ", A).
