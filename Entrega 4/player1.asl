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
/*
+!buscar4enRaya2(Jugador) : tablero(L) <- 
	//Pos. horizontal
	X=0;
	.length(L,length);
	//Se obtiene la raya a analizar y se analiza
	for(.range(I,1,16)){
		.delete(I*4,length,L,Raya);
		raya(Raya);
	}
	
	acumRayaActual=0;
	//Recorre tablero
	for(.member(Q,L)){
		if(Q==Jugador){
			.concat(Raya,Q);
			acumRayaActual=acumRayaActual+1;
		}else{
			if(acumRayaActual==3 && Q==0){
				Y=Q/7;
				X=(Q mod 7)-1;
				break;
			}
			acumRayaActual=0;
		}												
}.

*/

+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V) <- put(X,Y); !start.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self <- .print("Ignoro al agente ", A).
