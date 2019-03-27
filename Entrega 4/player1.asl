/* Initial beliefs and rules */

//tablero(X,Y,Estado).
estudiarJugada(X,Y):- true.

/* Initial goals */

!start.

/* Plans */

+!start <-.wait(turno(player1)); !jugar.

+!jugar : estrategia(jugarAGanar) & tablero(X,Y,0) <- put(X,Y); !start.
/*
+!buscar4enRaya <- 
	for(vl(X)){
		for(vl(Y)){
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
*/
/*
+!buscar4enRaya2 : tablero(L) <- 
	X=0;
	for(.member(Q,L)){
		if(Q==16){
		
		}
		elif(Q==17){
		
		}
		else{
		}
														
}.
*/

+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V) <- put(X,Y); !start.
