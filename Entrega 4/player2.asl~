/* Initial beliefs and rules */

colocar(BestX,BestY):- 
						/*Empezar de primero*/
						tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] 
						& BestX = 4 & BestY = 3.

colocar(BestX,BestY):-
//Lineas 10-11-12 Comentadas xq no tiene codigo de bloquear, esta en player1 sin acondicionar a player2(Cambiar ,1 por ,2 y viceversa)
							/*Movimientos Bloquear*/ 
							cuatroEnRaya(BestX,BestY)
							|bloquearCuatroEnRaya(BestX,BestY)
							/*Movimientos en raya*/
							|tresEnRaya(BestX,BestY)
							|dosEnRaya(BestX,BestY)
     						|unoEnRaya(BestX,BestY)
							/*Movimientos empezar de segundo*/
							|tablero(4,3,0)[source(percept)] & BestX = 4 & BestY = 3
							|tablero(X,Y,0)[source(percept)] & BestX = X & BestY = Y.

cuatroEnRaya(BestX,BestY):-
					/*4 en raya*/
							/*4 en raya diagonal izq a derecha arriba abajo*/
							//4 vacia
							tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
							//anterior a primera vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
							//Medio libres
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,2)[source(percept)] & BestX = X+2 & BestY = Y+2
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & tablero(X+3,Y+3,2)[source(percept)] & BestX = X+1 & BestY = Y+1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & tablero(X+3,Y+3,1)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & tablero(X-1,Y-1,1)[source(percept)] & BestX = X+3 & BestY = Y+3
							/*4 en raya diagonal izq a derecha abajo arriba*/
							//4 vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)] & tablero(X-2,Y-2,2)[source(percept)] & tablero(X-3,Y-3,0)[source(percept)] & BestX = X-3 & BestY = Y-3
							//anterior a primera vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)] & tablero(X-2,Y-2,2)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & BestX = X+1 & BestY = Y+1
							//Medio libres
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)] & tablero(X-2,Y-2,0)[source(percept)] & tablero(X-3,Y-3,2)[source(percept)] & BestX = X-2 & BestY = Y-2
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & tablero(X-2,Y-2,2)[source(percept)] & tablero(X-3,Y-3,2)[source(percept)] & BestX = X-1 & BestY = Y-1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)] & tablero(X-2,Y-2,2)[source(percept)] & tablero(X-3,Y-3,1)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & BestX = X+1 & BestY = Y+1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)] & tablero(X-2,Y-2,2)[source(percept)] & tablero(X-3,Y-3,0)[source(percept)] & tablero(X+1,Y+1,1)[source(percept)] & BestX = X-3 & BestY = Y-3
							/*4 en raya diagonal derecha a izq arriba abajo*/
							//4 vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)] & tablero(X+2,Y-2,2)[source(percept)] & tablero(X+3,Y-3,0)[source(percept)] & BestX = X+3 & BestY = Y-3
							//anterior a primera vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)] & tablero(X+2,Y-2,2)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & BestX = X-1 & BestY = Y+1
							//Medio libres
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)] & tablero(X+2,Y-2,0)[source(percept)] & tablero(X+3,Y-3,2)[source(percept)] & BestX = X+2 & BestY = Y-2
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & tablero(X+2,Y-2,2)[source(percept)] & tablero(X+3,Y-3,2)[source(percept)] & BestX = X+1 & BestY = Y-1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)] & tablero(X+2,Y-2,2)[source(percept)] & tablero(X+3,Y-3,1)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & BestX = X-1 & BestY = Y+1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)] & tablero(X+2,Y-2,2)[source(percept)] & tablero(X+3,Y-3,0)[source(percept)] & tablero(X-1,Y+1,1)[source(percept)] & BestX = X+3 & BestY = Y-3
							/*4 en raya diagonal izq a derecha abajo arriba*/
							//4 vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)] & tablero(X-2,Y+2,2)[source(percept)] & tablero(X-3,Y+3,0)[source(percept)] & BestX = X-3 & BestY = Y+3
							//anterior a primera vacia
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)] & tablero(X-2,Y+2,2)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & BestX = X+1 & BestY = Y-1
							//Medio libres
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)] & tablero(X-2,Y+2,0)[source(percept)] & tablero(X-3,Y+3,2)[source(percept)] & BestX = X-2 & BestY = Y+2
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & tablero(X-2,Y+2,2)[source(percept)] & tablero(X-3,Y+3,2)[source(percept)] & BestX = X-1 & BestY = Y+1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)] & tablero(X-2,Y+2,2)[source(percept)] & tablero(X-3,Y+3,1)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & BestX = X+1 & BestY = Y-1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)] & tablero(X-2,Y+2,2)[source(percept)] & tablero(X-3,Y+3,0)[source(percept)] & tablero(X+1,Y-1,1)[source(percept)] & BestX = X-3 & BestY = Y+3

							/*4 en raya vertical*/
							|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,2)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & BestX = X & BestY = Y+3
							|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & tablero(X,Y+3,2)[source(percept)] & BestX = X & BestY = Y+2
							|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,2)[source(percept)] & tablero(X,Y+3,2)[source(percept)] & BestX = X & BestY = Y+1
							|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,2)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
							|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,2)[source(percept)] & tablero(X,Y+3,1)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
							/*4 en raya horizontal*/
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,2)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & BestX = X+3 & BestY = Y
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & tablero(X+3,Y,2)[source(percept)] & BestX = X+2 & BestY = Y
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,2)[source(percept)] & tablero(X+3,Y,2)[source(percept)] & BestX = X+1 & BestY = Y
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,2)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
							|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,2)[source(percept)] & tablero(X+3,Y,1)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y.
tresEnRaya(BestX,BestY):-
						/*3 en raya*/
						/*3 en raya diagonal*/
						tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						/*3 en raya vertical*/
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,2)[source(percept)] & BestX = X & BestY = Y+1
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,1)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						/*3 en raya horizontal*/
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & BestX = X+2 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,2)[source(percept)] & BestX = X+1 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,1)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y.
					
dosEnRaya(BestX,BestY):-
						/*2 en raya*/
						
						/*2 en raya Diagonal*/
						
						
						tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & BestX = X+2 & BestY = Y+2	
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						
						/*2 en raya horizontal*/
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & BestX = X+2 & BestY = Y
						/*2 en raya Vertical*/ 
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1.
						
						
unoEnRaya(BestX,BestY):-
						/*1 en raya*/
						//estrategia colocar diagonal abajo izquierda
						tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)]  & BestX = X+1 & BestY = Y-1
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)]& tablero(X+2,Y-2,0)[source(percept)]  & BestX = X+2 & BestY = Y-2
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y-1,2)[source(percept)]& tablero(X+2,Y-2,2)[source(percept)]& tablero(X+3,Y-3,0)[source(percept)]  & BestX+3 = X & BestY = Y-3
						//estrategia colocar diagonal arriba derecha
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)]  & BestX = X-1 & BestY = Y+1
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)]& tablero(X-2,Y+2,0)[source(percept)]  & BestX = X-2 & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y+1,2)[source(percept)]& tablero(X-2,Y+2,2)[source(percept)]& tablero(X-3,Y+3,0)[source(percept)]  & BestX-3 = X & BestY = Y+3
						
						
						//estrategia colocar derecha
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,0)[source(percept)]  & BestX = X+1 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)]& tablero(X+2,Y,0)[source(percept)]  & BestX = X+2 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y,2)[source(percept)]& tablero(X+2,Y,2)[source(percept)]& tablero(X+3,Y,0)[source(percept)]  & BestX = X+3 & BestY = Y
						//estrategia colocar izquierda
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y,0)[source(percept)]  & BestX = X-1 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y,2)[source(percept)]& tablero(X-2,Y,0)[source(percept)]  & BestX = X-2 & BestY = Y
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y,2)[source(percept)]& tablero(X-2,Y,2)[source(percept)]& tablero(X-3,Y,0)[source(percept)]  & BestX = X-3 & BestY = Y
						//estrategia colocar arriba
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,0)[source(percept)]  & BestX = X & BestY = Y+1
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)]& tablero(X,Y+2,0)[source(percept)]  & BestX = X & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y+1,2)[source(percept)]& tablero(X,Y+2,2)[source(percept)]& tablero(X,Y+3,0)[source(percept)]  & BestX = X & BestY = Y+3
						//estrategia colocar abajo
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y-1,0)[source(percept)]  & BestX = X & BestY = Y-1
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y-1,2)[source(percept)]& tablero(X,Y-2,0)[source(percept)]  & BestX = X & BestY = Y-2
						|tablero(X,Y,2)[source(percept)] & tablero(X,Y-1,2)[source(percept)]& tablero(X,Y-2,2)[source(percept)]& tablero(X,Y-3,0)[source(percept)]  & BestX = X & BestY = Y-3
						//estrategia colocar diagonal arriba izquierda
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)]  & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)]& tablero(X-2,Y-2,0)[source(percept)]  & BestX = X-2 & BestY = Y-2
						|tablero(X,Y,2)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)]& tablero(X-2,Y-2,2)[source(percept)]& tablero(X-3,Y-3,0)[source(percept)]  & BestX-3 = X & BestY = Y-3
						//estrategia colocar diagonal abajo derecha
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)]  & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)]& tablero(X+2,Y+2,0)[source(percept)]  & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,2)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)]& tablero(X+2,Y+2,2)[source(percept)]& tablero(X+3,Y+3,0)[source(percept)]  & BestX+3 = X & BestY = Y+3.		

/*Movimientos Bloquear*/					
bloquearCuatroEnRaya(BestX,BestY):-
						/*Bloquear 4 en raya*/
						/*Bloquear 4 en raya diagonal*/
						tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,1)[source(percept)] & tablero(X+2,Y+2,1)[source(percept)] & tablero(X-1,Y-1,2)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,1)[source(percept)] & tablero(X+2,Y+2,1)[source(percept)] & tablero(X+3,Y+3,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,1)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,1)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,1)[source(percept)] & tablero(X+3,Y+3,1)[source(percept)] & BestX = X+1 & BestY = Y+1
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,1)[source(percept)] & tablero(X+2,Y+2,1)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,1)[source(percept)] & tablero(X+2,Y+2,1)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & BestX = X+3 & BestY = Y+3
						
						/*Bloquear 4 en raya vertical*/
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y+2,1)[source(percept)] & tablero(X,Y-1,2)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & BestX = X & BestY = Y+3
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y+2,1)[source(percept)] & tablero(X,Y+3,2)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & tablero(X,Y+3,1)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,1)[source(percept)] & tablero(X,Y+3,1)[source(percept)] & BestX = X & BestY = Y+1
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y+2,1)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y+2,1)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & BestX = X & BestY = Y+3
						
						/*Bloquear 4 en raya horizontal*/
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X+2,Y,1)[source(percept)] & tablero(X-1,Y,2)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & BestX = X+3 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X+2,Y,1)[source(percept)] & tablero(X+3,Y,2)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & tablero(X+3,Y,1)[source(percept)] & BestX = X+2 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,1)[source(percept)] & tablero(X+3,Y,1)[source(percept)] & BestX = X+1 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X+2,Y,1)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X+2,Y,1)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & BestX = X+3 & BestY = Y.

bloquearTresEnRaya(BestX,BestY):- //listo
						/*Bloquear 3 en raya*/
						/*Bloquear 3 en raya Diagonal*/
						tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & BestX = X-1 & BestY = Y-1
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,2)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & BestX = X+2 & BestY = Y+2
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,1)[source(percept)] & BestX = X+1 & BestY = Y+1	
						/*Bloquear 3 en raya horizontal*/
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & BestX = X-1 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,1)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & BestX = X+2 & BestY = Y
						|tablero(X,Y,1)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,2)[source(percept)] & BestX = X+1 & BestY = Y
						/*Bloquear 3 en raya Vertical*/
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & BestX = X & BestY = Y-1
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,1)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & BestX = X & BestY = Y+2
						|tablero(X,Y,1)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,2)[source(percept)] & BestX = X & BestY = Y+1.

/*PERDER*/
colocarPerder(BestX,BestY):- 
							/*Empezar de primero*/
							tablero(X,Y,0)[source(percept)] & tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] 
							& BestX = X & BestY = Y & .print("Colocar de tablero vacio").
colocarPerder(BestX,BestY):-
							//not cuatroEnRaya(BestX,BestY) & colocarFicha(BestX,BestY) & BestX = BestX  & BestY = BestY.
							tablero(X,Y,0)[source(percept)] & BestX = X & BestY = Y & not cuatroEnRaya(X,Y)//uno cualquiera que no haga 4 en raya
							|tablero(X,Y,0)[source(percept)] & BestX = X & BestY = Y & .print("Movimiento final aleatorio").

/* Initial goals */

!start.

/* Plans */

+!start <-.my_name(Self); .wait(turno(Self)[source(percept)]); !jugar.
+!jugar : estrategia(jugarAGanar) //& tablero(X,Y,V)
					<- //preguntar por el valor de X e Y  al belief 
						?colocar(BestX,BestY);
						//pasar el valor de X e Y con 
						put(BestX,BestY);	
						!start.
//problema de la reina pag103
+!jugar : estrategia(jugarAPerder) //& tablero(X,Y,V)[source(percept)] <- put(X,Y); !start.
					<- //preguntar por el valor de X e Y  al belief 
						.print("PERDIENDO");	
						?colocarPerder(BestX,BestY);
						//pasar el valor de X e Y con 
						put(BestX,BestY);
						!start.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self & not A=percept <- .print("Ignoro al agente ", A).			
