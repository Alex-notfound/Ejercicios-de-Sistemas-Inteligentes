/* Initial beliefs and rules */



/* Initial goals */

!start.

/* Plans */

+!start <- .wait(turno(player2)); !jugar.

+!jugar : estrategia(jugarAGanar) & tablero(X,Y,0) <- .print("X: ", X," Y: ",Y," V: ",V);put(X,Y);!start.
+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V) <- put(X,Y);!start.
