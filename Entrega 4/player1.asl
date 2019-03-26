// Agent player1 in project ET4.mas2j

/* Initial beliefs and rules */

//tablero(X,Y,Estado).

/* Initial goals */

!start.

/* Plans */

+!start <-.wait(turno(player1)); !jugar.

+!jugar : estrategia(jugarAGanar) & tablero(X,Y,0) <- put(X,Y); !start.
+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V) <- put(X,Y); !start.
