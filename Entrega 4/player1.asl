/* Initial beliefs and rules */

//tablero(X,Y,Estado).
estudiarJugada(X,Y):- 
recorridoVertical(X,0).

recorridoVertical(X,Y) :-
tablero(X,Y,1) & Y=Y+1 & recorridoVertical(X,Y,S).

raya([16,16,16,0],X) :- X=3.
raya([0,16,16,16],X) :- X=0.
raya([16,16,0,16],X) :- X=2.
raya([16,0,16,16],X) :- X=1.

raya([16,16,0,0],X) :- X=3.
raya([0,16,16,0],X) :- X=0.
raya([0,0,16,16],X) :- X=0.
raya([0,16,0,16],X) :- X=0.
raya([16,0,16,0],X) :- X=1.

raya([16,0,0,0],X) :- X=3.
raya([0,16,0,0],X) :- X=3.
raya([0,0,16,0],X) :- X=0.
raya([0,0,0,16],X) :- X=0.

raya([0,0,0,0],X) :- X=1.

raya([17,17,17,0],X) :- X=3.
raya([0,17,17,17],X) :- X=0.
raya([17,17,0,17],X) :- X=2.
raya([17,0,17,17],X) :- X=1.

/* Initial goals */

!start.

/* Plans */

+!start <-.wait(turno(player1)); !jugar.

+!jugar : estrategia(jugarAGanar) & tablero(X,Y,0) <- put(X,Y); !start.
/*
+!buscar4enRaya <- 
	for(.range(X,0,7)){
		for(.range(Y,0,7)){
			tablero(X,Y,Z);
			if(Z==1){
				estudiarJugada(X,Y);
			}
			elif(Z==2){
			}
			else{
			}
		}
}.

+!recorrerVerticalmente(X) <- 
	for(.range(Y,0,7)){
		tablero(X,Y,1
	}.
*/

+!buscar4enRaya2(Jugador) : tablero(L) <- 
	N=4;
	.length(L,length);
	
	//Se obtiene la raya a analizar y se analiza
	for(.range(I,0,64)){
		//Descarta las casillas ya evaluadas
		.delete(0,I,L,Tablero)
		//Descarta las casillas que se evaluaran posteriormente
		.delete(I+4,length,Tablero,Raya);
		raya(Raya,Solucion);
		
		if(Solucion==3){
			//Implementar que devuelva la posicion para colocar la ficha que otorga la victoria
		}elif(Solucion==2 | Solucion==1){
			//mejorJugada=Almacenar la jugada si es la mejor hasta el momento
		}
		
		//Si se ha evaluado toda la linea horizontal actual, se salta a la siguiente
		if((I+4) mod 8 == 0){
			I=I+4;	
		}
	}.

+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V) <- put(X,Y); !start.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self <- .print("Ignoro al agente ", A).
