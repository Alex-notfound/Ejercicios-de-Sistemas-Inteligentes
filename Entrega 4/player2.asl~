/* Initial beliefs and rules */

colocar(BestX,BestY):- 
						/*Empezar de primero*/
						tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] 
						& BestX = 4 & BestY = 3.

colocar(BestX,BestY,EquipoAliado,EquipoEnemigo):-
//Lineas 10-11-12 Comentadas xq no tiene codigo de bloquear, esta en player1 sin acondicionar a player2(Cambiar ,EquipoEnemigo por ,EquipoAliado y viceversa)
							/*Movimientos Bloquear*/ 
							cuatroEnRaya(BestX,BestY,EquipoAliado)
							|bloquearCuatroEnRaya(BestX,BestY,EquipoAliado,EquipoEnemigo)
							|bloquearTresEnRaya(BestX,BestY,EquipoAliado,EquipoEnemigo)
							/*Movimientos en raya*/
							|tresEnRaya(BestX,BestY,EquipoAliado)
							|dosEnRaya(BestX,BestY,EquipoAliado)
     						|unoEnRaya(BestX,BestY,EquipoAliado)
							/*Movimientos empezar de segundo*/
							|tablero(4,3,0)[source(percept)] & BestX = 4 & BestY = 3
							|tablero(X,Y,0)[source(percept)] & BestX = X & BestY = Y.

cuatroEnRaya(BestX,BestY,EquipoAliado):-
							/*4 en raya diagonal izq a derecha arriba abajo*/
							//4 vacia
							tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,EquipoAliado)[source(percept)] & BestX = X+2 & BestY = Y+2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,EquipoAliado)[source(percept)] & BestX = X+1 & BestY = Y+1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & tablero(X-1,Y-1,EquipoEnemigo)[source(percept)] & BestX = X+3 & BestY = Y+3
							/*4 en raya diagonal izq a derecha abajo arriba*/
							//4 vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,0)[source(percept)] & BestX = X-3 & BestY = Y-3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & BestX = X+1 & BestY = Y+1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,0)[source(percept)] & tablero(X-3,Y-3,EquipoAliado)[source(percept)] & BestX = X-2 & BestY = Y-2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,EquipoAliado)[source(percept)] & BestX = X-1 & BestY = Y-1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & BestX = X+1 & BestY = Y+1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,0)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & BestX = X-3 & BestY = Y-3
							/*4 en raya diagonal derecha a izq arriba abajo*/
							//4 vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,0)[source(percept)] & BestX = X+3 & BestY = Y-3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & BestX = X-1 & BestY = Y+1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,0)[source(percept)] & tablero(X+3,Y-3,EquipoAliado)[source(percept)] & BestX = X+2 & BestY = Y-2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,EquipoAliado)[source(percept)] & BestX = X+1 & BestY = Y-1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & BestX = X-1 & BestY = Y+1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,0)[source(percept)] & tablero(X-1,Y+1,EquipoEnemigo)[source(percept)] & BestX = X+3 & BestY = Y-3
							/*4 en raya diagonal izq a derecha abajo arriba*/
							//4 vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,0)[source(percept)] & BestX = X-3 & BestY = Y+3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & BestX = X+1 & BestY = Y-1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,0)[source(percept)] & tablero(X-3,Y+3,EquipoAliado)[source(percept)] & BestX = X-2 & BestY = Y+2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,EquipoAliado)[source(percept)] & BestX = X-1 & BestY = Y+1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,EquipoEnemigo)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & BestX = X+1 & BestY = Y-1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,0)[source(percept)] & tablero(X+1,Y-1,EquipoEnemigo)[source(percept)] & BestX = X-3 & BestY = Y+3
							/*4 en raya vertical*/
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & BestX = X & BestY = Y+3
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & tablero(X,Y+3,EquipoAliado)[source(percept)] & BestX = X & BestY = Y+2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y+3,EquipoAliado)[source(percept)] & BestX = X & BestY = Y+1
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y+3,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
							/*4 en raya horizontal*/
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & BestX = X+3 & BestY = Y
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & tablero(X+3,Y,EquipoAliado)[source(percept)] & BestX = X+2 & BestY = Y
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,EquipoAliado)[source(percept)] & BestX = X+1 & BestY = Y
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y.

tresEnRaya(BestX,BestY,EquipoAliado):-
						/*3 en raya diagonal*/
						tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						/*3 en raya vertical*/
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & BestX = X & BestY = Y+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						/*3 en raya horizontal*/
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & BestX = X+2 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & BestX = X+1 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y.
					
dosEnRaya(BestX,BestY,EquipoAliado):-
						/*2 en raya Diagonal*/			
						tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & BestX = X+2 & BestY = Y+2	
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						/*2 en raya horizontal*/
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & BestX = X+2 & BestY = Y
						/*2 en raya Vertical*/ 
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1.
						
unoEnRaya(BestX,BestY,EquipoAliado):-
						/*1 en raya*/
						//estrategia colocar diagonal abajo izquierda
						tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)]  & BestX = X+1 & BestY = Y-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)]& tablero(X+2,Y-2,0)[source(percept)]  & BestX = X+2 & BestY = Y-2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)]& tablero(X+2,Y-2,EquipoAliado)[source(percept)]& tablero(X+3,Y-3,0)[source(percept)]  & BestX+3 = X & BestY = Y-3
						//estrategia colocar diagonal arriba derecha
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)]  & BestX = X-1 & BestY = Y+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)]& tablero(X-2,Y+2,0)[source(percept)]  & BestX = X-2 & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)]& tablero(X-2,Y+2,EquipoAliado)[source(percept)]& tablero(X-3,Y+3,0)[source(percept)]  & BestX-3 = X & BestY = Y+3
						//estrategia colocar derecha
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,0)[source(percept)]  & BestX = X+1 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)]& tablero(X+2,Y,0)[source(percept)]  & BestX = X+2 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)]& tablero(X+2,Y,EquipoAliado)[source(percept)]& tablero(X+3,Y,0)[source(percept)]  & BestX = X+3 & BestY = Y
						//estrategia colocar izquierda
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)]  & BestX = X-1 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,EquipoAliado)[source(percept)]& tablero(X-2,Y,0)[source(percept)]  & BestX = X-2 & BestY = Y
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,EquipoAliado)[source(percept)]& tablero(X-2,Y,EquipoAliado)[source(percept)]& tablero(X-3,Y,0)[source(percept)]  & BestX = X-3 & BestY = Y
						//estrategia colocar arriba
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,0)[source(percept)]  & BestX = X & BestY = Y+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)]& tablero(X,Y+2,0)[source(percept)]  & BestX = X & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)]& tablero(X,Y+2,EquipoAliado)[source(percept)]& tablero(X,Y+3,0)[source(percept)]  & BestX = X & BestY = Y+3
						//estrategia colocar abajo
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)]  & BestX = X & BestY = Y-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y-1,EquipoAliado)[source(percept)]& tablero(X,Y-2,0)[source(percept)]  & BestX = X & BestY = Y-2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y-1,EquipoAliado)[source(percept)]& tablero(X,Y-2,EquipoAliado)[source(percept)]& tablero(X,Y-3,0)[source(percept)]  & BestX = X & BestY = Y-3
						//estrategia colocar diagonal arriba izquierda
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)]  & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)]& tablero(X-2,Y-2,0)[source(percept)]  & BestX = X-2 & BestY = Y-2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)]& tablero(X-2,Y-2,EquipoAliado)[source(percept)]& tablero(X-3,Y-3,0)[source(percept)]  & BestX-3 = X & BestY = Y-3
						//estrategia colocar diagonal abajo derecha
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)]  & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)]& tablero(X+2,Y+2,0)[source(percept)]  & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)]& tablero(X+2,Y+2,EquipoAliado)[source(percept)]& tablero(X+3,Y+3,0)[source(percept)]  & BestX+3 = X & BestY = Y+3.		

/*Movimientos Bloquear*/					
bloquearCuatroEnRaya(BestX,BestY,EquipoAliado,EquipoEnemigo):-
						/*Bloquear 4 en raya*/
						/*Bloquear 4 en raya diagonal*/
						tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X+3,Y+3,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,EquipoEnemigo)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X+3,Y+3,EquipoEnemigo)[source(percept)] & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
						/*Bloquear 4 en raya vertical*/
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,EquipoAliado)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & BestX = X & BestY = Y+3
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y+3,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & tablero(X,Y+3,EquipoEnemigo)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y+3,EquipoEnemigo)[source(percept)] & BestX = X & BestY = Y+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & BestX = X & BestY = Y+3
						/*Bloquear 4 en raya horizontal*/
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & BestX = X+3 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X+3,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & tablero(X+3,Y,EquipoEnemigo)[source(percept)] & BestX = X+2 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X+3,Y,EquipoEnemigo)[source(percept)] & BestX = X+1 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & BestX = X+3 & BestY = Y.

bloquearTresEnRaya(BestX,BestY,EquipoAliado,EquipoEnemigo):-
						/*Bloquear 3 en raya diagonal*/
						 tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)]  & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & tablero(X-2,Y+2,EquipoEnemigo)[source(percept)]  & BestX = X-1 & BestY = Y+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)]  & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X-2,Y+2,0)[source(percept)]  & BestX = X-2 & BestY = Y+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)]  & BestX = X+1 & BestY = Y-1
						/*Bloquear 3 en raya vertical*/
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)]  & BestX = X & BestY = Y+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,0)[source(percept)]  & BestX = X & BestY = Y+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)]  & BestX = X & BestY = Y-1
						/*Bloquear 3 en raya horizontal*/                  
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)]  & BestX = X+1 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,0)[source(percept)]  & BestX = X+2 & BestY = Y
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)]  & BestX = X-1 & BestY = Y.

//Modo perder
colocarPerder(X,Y):- 
							/*Empezar de primero*/
							tablero(X,Y,0)[source(percept)] & tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] 
							& .print("Colocar de tablero vacio").
colocarPerder(X,Y):-
							tablero(X,Y,0)[source(percept)] & not unoEnRaya(X,Y,EquipoAliado)//uno cualquiera que no haga 4 en raya
							|tablero(X,Y,0)[source(percept)] & not dosEnRaya(X,Y,EquipoAliado)//uno cualquiera que no haga 4 en raya
							|tablero(X,Y,0)[source(percept)] & not tresEnRaya(X,Y,EquipoAliado)//uno cualquiera que no haga 4 en raya
							|tablero(X,Y,0)[source(percept)] & not cuatroEnRaya(X,Y,EquipoAliado)//uno cualquiera que no haga 4 en raya
							|tablero(X,Y,0)[source(percept)]. //uno cualquiera

conocerEquipo(player1):- .abolish(equipoAliado(_)) & .asserta(equipoAliado(1)) & .abolish(equipoEnemigo(_)) & .asserta(equipoEnemigo(2)) 
							& .abolish(nombreEnemigo(_)) & .asserta(nombreEnemigo(player2)).
conocerEquipo(player2):- .abolish(equipoAliado(_)) & .asserta(equipoAliado(2)) & .abolish(equipoEnemigo(_)) & .asserta(equipoEnemigo(1)) 
							& .abolish(nombreEnemigo(_)) & .asserta(nombreEnemigo(player1)).

/* Initial goals */

!start.

/* Plans */

+!start <- .my_name(Self); ?conocerEquipo(Self); !esperar.

+!esperar : .my_name(Self) <- .wait(turno(Self)[source(percept)]); !jugar.

+!jugar : estrategia(jugarAGanar)[source(percept)] & equipoAliado(EquipoAliado) & equipoEnemigo(EquipoEnemigo)
					<- //preguntar por el valor de X e Y  al belief 
						?colocar(BestX,BestY,EquipoAliado,EquipoEnemigo);
						//pasar el valor de X e Y con
						put(BestX,BestY);	
						!esperar.

+!jugar : estrategia(jugarAPerder)[source(percept)] //& tablero(X,Y,V)[source(percept)] <- put(X,Y); !start.
					<- //preguntar por el valor de X e Y  al belief 
						.print("PERDIENDO");	
						?colocarPerder(BestX,BestY,EquipoAliado,EquipoEnemigo);
						//pasar el valor de X e Y con 
						put(BestX,BestY);
						!esperar.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self & not A=percept <- .print("Ignoro al agente ", A).			
