/* Initial beliefs and rules */

/*
	Los predicados "colocar" hacen uso del resto de predicados para implementar la estrategia a "Ganar". Dicha estrategia consiste en analizar las piezas del tablero
de forma que si el contrincante puede colocar 3 o 4 fichas seguidas el agente colocará una ficha suya en la posición indicada para bloquear sus jugadas, prioritando siempre
el colocar 4 se sus fichas seguidas. El agente parte siempre de la posición (4,3) siempre y cuando este libre, si no colocará de forma aleatoria en el tablero. 
Se pioriza evitar el 4 y 3 en raya del contrario a otro mivimiento que no sea el de hacer 4 en raya, ya que tal como esta planteada la logica del agente se puede aprovechar esa ficha
para conseguir el 3 o el 4 en raya por parte del propio agente.
*/

colocar(BestX,EquipoAliado,EquipoEnemigo):- 
						//Si es el primer turno de la partida, coloca en (4,3)
						tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] 
						& BestX = 4.

colocar(BestX,EquipoAliado,EquipoEnemigo):-
							/*Movimientos Bloquear*/ 
							cuatroEnRaya(BestX,EquipoAliado)
							|bloquearCuatroEnRaya(BestX,EquipoAliado,EquipoEnemigo)
							|bloquearTresEnRaya(BestX,EquipoAliado,EquipoEnemigo)
							/*Movimientos en raya*/
							|tresEnRaya(BestX,EquipoAliado)
							|dosEnRaya(BestX,EquipoAliado)
     						|unoEnRaya(BestX,EquipoAliado)
							/*Movimientos empezar de segundo*/
							|tablero(4,7,0)[source(percept)] & BestX = 4
							|tablero(X,Y,0)[source(percept)] & not vacioDebajo(X,Y,0) & BestX = X.

vacioDebajo(X,7,1).
vacioDebajo(X,Y,Toret) :- tablero(X,Y-1,Toret).
/*
	El predicado cuatroEnRaya analiza las posiciones del tabrero buscando 3 fichas del agente que esten colocadas de forma consecutiva para colocar una mas y completar el 4 en raya.
Se distinguen 3 posibilidades: hacer 4 en raya de forma horizontal (de derecha a izquierda y de izquierda a derecha), de forma vertical (de arriba abajo y de abajo arriba) 
y de forma diagonal (diagonal de izquierda a derecha y de arria abajo, diagonal de izquierda a derecha y de abajo arriba, diagonal de derecha a izquierda y de arria abajo,
diagonal de derecha a izquierda y de abajo arriba), ademas en cada una de ellas cabe la posibilidad de tener posiciones libres en medio, es decir, 2 seguidas ocupadas por el agente 
una libre y otra ocupada por el agente o una ocupada por el agente una libre y dos seguidas ocupadas por el agente, en las que se colocará la ficha en la posición libre.
*/
cuatroEnRaya(BestX,EquipoAliado):-
							/*4 en raya diagonal izq a derecha arriba abajo*/
							//4 vacia
							tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & not vacioDebajo(X+3,Y+3,0) & BestX = X+3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,EquipoAliado)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,EquipoAliado)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & tablero(X-1,Y-1,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+3,Y+3,0) & BestX = X+3
							/*4 en raya diagonal izq a derecha abajo arriba*/
							//4 vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,0)[source(percept)] & not vacioDebajo(X-3,Y-3,0) & BestX = X-3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,0)[source(percept)] & tablero(X-3,Y-3,EquipoAliado)[source(percept)] & not vacioDebajo(X-2,Y-2,0) & BestX = X-2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,EquipoAliado)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X-2,Y-2,EquipoAliado)[source(percept)] & tablero(X-3,Y-3,0)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & not vacioDebajo(X-3,Y-3,0) & BestX = X-3
							/*4 en raya diagonal derecha a izq arriba abajo*/
							//4 vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,0)[source(percept)] & not vacioDebajo(X+3,Y-3,0) & BestX = X+3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & not vacioDebajo(X-1,Y+1,0) & BestX = X-1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,0)[source(percept)] & tablero(X+3,Y-3,EquipoAliado)[source(percept)] & not vacioDebajo(X+2,Y-2,0) & BestX = X+2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,EquipoAliado)[source(percept)] & not vacioDebajo(X+1,Y-1,0) & BestX = X+1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & not vacioDebajo(X-1,Y+1,0) & BestX = X-1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)] & tablero(X+2,Y-2,EquipoAliado)[source(percept)] & tablero(X+3,Y-3,0)[source(percept)] & tablero(X-1,Y+1,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+3,Y-3,0) & BestX = X+3
							/*4 en raya diagonal izq a derecha abajo arriba*/
							//4 vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,0)[source(percept)] & not vacioDebajo(X-3,Y+3,0) & BestX = X-3
							//anterior a primera vacia
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & not vacioDebajo(X+1,Y-1,0) & BestX = X+1
							//Medio libres
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,0)[source(percept)] & tablero(X-3,Y+3,EquipoAliado)[source(percept)] & not vacioDebajo(X-2,Y+2,0) & BestX = X-2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,EquipoAliado)[source(percept)] & not vacioDebajo(X-1,Y+1,0) & BestX = X-1
							//anterior primera vacia con 4 bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,EquipoEnemigo)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & not vacioDebajo(X+1,Y-1,0) & BestX = X+1
							//4 vacia con anterior a primera bloqueada
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)] & tablero(X-2,Y+2,EquipoAliado)[source(percept)] & tablero(X-3,Y+3,0)[source(percept)] & tablero(X+1,Y-1,EquipoEnemigo)[source(percept)] & not vacioDebajo(X-3,Y+3,0) & BestX = X-3
							/*4 en raya vertical*/
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & not vacioDebajo(X,Y+3,0) & BestX = X
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & tablero(X,Y+3,EquipoAliado)[source(percept)] & not vacioDebajo(X,Y+2,0) & BestX = X
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y+3,EquipoAliado)[source(percept)] & not vacioDebajo(X,Y+1,0) & BestX = X
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & tablero(X,Y+3,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X
							/*4 en raya horizontal*/
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & not vacioDebajo(X+3,Y,0) & BestX = X+3
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & tablero(X+3,Y,EquipoAliado)[source(percept)] & not vacioDebajo(X+2,Y,0) & BestX = X+2
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,EquipoAliado)[source(percept)] & not vacioDebajo(X+1,Y,0) & BestX = X+1
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1
							|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1.
/*
	El predicado tresEnRaya busca colocar 3  fichas seguidas, al igual que el cuatroEnRaya, buscando 2 fichas del agente que estén consecutivas para colocar la ficha en algún extremo
o en medio, preparando así la posibilidad de hacer un 4 en raya en el seguiente turno	
*/
tresEnRaya(BestX,EquipoAliado):-
						/*3 en raya diagonal*/
						tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2 
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1 
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1 
						/*3 en raya vertical*/
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & not vacioDebajo(X,Y+2,0) & BestX = X 
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoAliado)[source(percept)] & not vacioDebajo(X,Y+1,0) & BestX = X 
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X 
						/*3 en raya horizontal*/
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & not vacioDebajo(X+2,Y,0) & BestX = X+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoAliado)[source(percept)] & not vacioDebajo(X+1,Y,0) & BestX = X+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1.
/*
	El predicado dosEnRaya busca colocar 2 fichas seguidas, al igual que el tresEnRaya y el cuatroEnRaya, buscando una ficha en el tablero para colocar otra a su lado y posibilitar
el colocar 3 fichas seguidas en el seguiente turno.
*/					
dosEnRaya(BestX,EquipoAliado):-
						/*2 en raya Diagonal*/			
						tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & not vacioDebajo(X+3,Y+3,0) & BestX = X+3
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
						/*2 en raya horizontal*/
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & not vacioDebajo(X+2,Y,0) & BestX = X+2
						/*2 en raya Vertical*/ 
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & not vacioDebajo(X,Y+2,0) & BestX = X
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X.
/*
	El predicado unoEnRaya busca colocar una ficha en el tablero de forma que posibilite hacer uso del predicado dosEnRaya.
*/			
unoEnRaya(BestX,EquipoAliado):-
						/*1 en raya*/
						//estrategia colocar diagonal abajo izquierda
						tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & not vacioDebajo(X+1,Y-1,0) & BestX = X+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)]& tablero(X+2,Y-2,0)[source(percept)] & not vacioDebajo(X+2,Y-2,0) & BestX = X+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y-1,EquipoAliado)[source(percept)]& tablero(X+2,Y-2,EquipoAliado)[source(percept)]& tablero(X+3,Y-3,0)[source(percept)] & not vacioDebajo(X+3,Y-3,0) & BestX = X+3
						//estrategia colocar diagonal arriba derecha
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & not vacioDebajo(X-1,Y+1,0) & BestX = X-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)]& tablero(X-2,Y+2,0)[source(percept)] & not vacioDebajo(X-2,Y+2,0) & BestX = X-2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y+1,EquipoAliado)[source(percept)]& tablero(X-2,Y+2,EquipoAliado)[source(percept)]& tablero(X-3,Y+3,0)[source(percept)] & not vacioDebajo(X-3,Y+3,0) & BestX = X-3
						//estrategia colocar derecha
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & not vacioDebajo(X+1,Y,0) & BestX = X+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)]& tablero(X+2,Y,0)[source(percept)] & not vacioDebajo(X+2,Y,0) & BestX = X+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y,EquipoAliado)[source(percept)]& tablero(X+2,Y,EquipoAliado)[source(percept)]& tablero(X+3,Y,0)[source(percept)] & not vacioDebajo(X+3,Y,0) & BestX = X+3
						//estrategia colocar izquierda
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,EquipoAliado)[source(percept)]& tablero(X-2,Y,0)[source(percept)] & not vacioDebajo(X-2,Y,0) & BestX = X-2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,EquipoAliado)[source(percept)]& tablero(X-2,Y,EquipoAliado)[source(percept)]& tablero(X-3,Y,0)[source(percept)] & not vacioDebajo(X-3,Y,0) & BestX = X-3
						//estrategia colocar arriba
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & not vacioDebajo(X,Y+1,0) & BestX = X
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)]& tablero(X,Y+2,0)[source(percept)] & not vacioDebajo(X,Y+2,0) & BestX = X
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y+1,EquipoAliado)[source(percept)]& tablero(X,Y+2,EquipoAliado)[source(percept)]& tablero(X,Y+3,0)[source(percept)] & not vacioDebajo(X,Y+3,0) & BestX = X
						//estrategia colocar abajo
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y-1,EquipoAliado)[source(percept)]& tablero(X,Y-2,0)[source(percept)] & not vacioDebajo(X,Y-2,0) & BestX = X
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X,Y-1,EquipoAliado)[source(percept)]& tablero(X,Y-2,EquipoAliado)[source(percept)]& tablero(X,Y-3,0)[source(percept)] & not vacioDebajo(X,Y-3,0) & BestX = X
						//estrategia colocar diagonal arriba izquierda
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)]& tablero(X-2,Y-2,0)[source(percept)] & not vacioDebajo(X-2,Y-2,0) & BestX = X-2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)]& tablero(X-2,Y-2,EquipoAliado)[source(percept)]& tablero(X-3,Y-3,0)[source(percept)] & not vacioDebajo(X-3,Y-3,0) & BestX = X-3
						//estrategia colocar diagonal abajo derecha
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)]& tablero(X+2,Y+2,0)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2
						|tablero(X,Y,EquipoAliado)[source(percept)] & tablero(X+1,Y+1,EquipoAliado)[source(percept)]& tablero(X+2,Y+2,EquipoAliado)[source(percept)]& tablero(X+3,Y+3,0)[source(percept)] & not vacioDebajo(X+3,Y+3,0) & BestX = X+3.		
/*
	Los movimientos bloquear tienen como objetivo evitar que el contrario coloque 3 o 4 fichas en posiciones que posibiliten el 3 o 4 en raya.
*/
/*
	EL predicado bloquearCuatroEnRaya busca 3 fichas del contrario que estén colocadas de forma consecutiva para evitar que el contrario gane en el siguiente turno colocando la cuarta ficha
y haciendo 4 en raya, además de las 3 fichas consecutivas y uno de los extremos libres con el otro ocupado se contempla que pueda haber 2 seguidas ocupadas por el contrario,
1 libre y otra ocupada por el contrario o 1 ocupada por el contrario 1 libre y 2 ocupadas por el contrario, de forma que se se coloque la ficha en la posición libre que evite el
4 en raya del contrario.
*/
/*Movimientos Bloquear*/					
bloquearCuatroEnRaya(BestX,EquipoAliado,EquipoEnemigo):-
						/*Bloquear 4 en raya*/
						/*Bloquear 4 en raya diagonal*/
						tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,EquipoAliado)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & not vacioDebajo(X+3,Y+3,0) & BestX = X+3
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X+3,Y+3,EquipoAliado)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & tablero(X+3,Y+3,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X+3,Y+3,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & tablero(X+3,Y+3,0)[source(percept)] & not vacioDebajo(X+3,Y+3,0) & BestX = X+3
						/*Bloquear 4 en raya vertical*/
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,EquipoAliado)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & not vacioDebajo(X,Y+3,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y+3,EquipoAliado)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & tablero(X,Y+3,EquipoEnemigo)[source(percept)] & not vacioDebajo(X,Y+2,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y+3,EquipoEnemigo)[source(percept)] & not vacioDebajo(X,Y+1,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & tablero(X,Y+3,0)[source(percept)] & not vacioDebajo(X,Y+3,0) & BestX = X
						/*Bloquear 4 en raya horizontal*/
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,EquipoAliado)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & not vacioDebajo(X+3,Y,0) & BestX = X+3
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X+3,Y,EquipoAliado)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & tablero(X+3,Y,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+2,Y,0) & BestX = X+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X+3,Y,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+1,Y,0) & BestX = X+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & tablero(X+3,Y,0)[source(percept)] & not vacioDebajo(X+3,Y,0) & BestX = X+3.
/*
	El predicado bloquearTresEnRaya busca 2 fichas del contrario consecutivas para al colocar la siguiente ficha en una posicion que o bien evite que el contrario consiga el 3 en raya
o "bloquee" uno de los extremos para evitar que tenga 2 posibilidades de completar el 4 en raya.
*/
bloquearTresEnRaya(BestX,EquipoAliado,EquipoEnemigo):-
						/*Bloquear 3 en raya diagonal*/
						 tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,0)[source(percept)] & tablero(X+2,Y+2,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+1,Y+1,0) & BestX = X+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,0)[source(percept)] & tablero(X-2,Y+2,EquipoEnemigo)[source(percept)] & not vacioDebajo(X-1,Y+1,0) & BestX = X-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+2,Y+2,0)[source(percept)] & not vacioDebajo(X+2,Y+2,0) & BestX = X+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X-1,Y-1,0)[source(percept)] & not vacioDebajo(X-1,Y-1,0) & BestX = X-1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X-2,Y+2,0)[source(percept)] & not vacioDebajo(X-2,Y+2,0) & BestX = X-2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y+1,EquipoEnemigo)[source(percept)] & tablero(X+1,Y-1,0)[source(percept)] & not vacioDebajo(X+1,Y-1,0) & BestX = X+1
						/*Bloquear 3 en raya vertical*/
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,0)[source(percept)] & tablero(X,Y+2,EquipoEnemigo)[source(percept)] & not vacioDebajo(X,Y+1,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y+2,0)[source(percept)] & not vacioDebajo(X,Y+2,0) & BestX = X
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X,Y+1,EquipoEnemigo)[source(percept)] & tablero(X,Y-1,0)[source(percept)] & not vacioDebajo(X,Y-1,0) & BestX = X
						/*Bloquear 3 en raya horizontal*/                  
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,0)[source(percept)] & tablero(X+2,Y,EquipoEnemigo)[source(percept)] & not vacioDebajo(X+1,Y,0) & BestX = X+1
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X+2,Y,0)[source(percept)] & not vacioDebajo(X+2,Y,0) & BestX = X+2
						|tablero(X,Y,EquipoEnemigo)[source(percept)] & tablero(X+1,Y,EquipoEnemigo)[source(percept)] & tablero(X-1,Y,0)[source(percept)] & not vacioDebajo(X-1,Y,0) & BestX = X-1.

//Modo perder
/*
	La estrategia a perder busca evitar colocar 4 fichas seguidas por parte del agente de forma prioritaria, lo mismo en el caso de 3 y de dos, a menos que no tenga espacios libres
que no queden fichas consecutivas, de forma que colocara 2 seguidas hasta que no se vea forzado a colocar 3 por espacios. En el caso que no pueda evitar colocar 4 en raya colocará
una ficha de forma aleatoria perdiendo asi la partida.
La estrategia se compone de negar los predicados implementados para colocar 1, 2, 3 y 4 en raya en la estrategia a "Ganar" y la colocaión de forma aleatoria de una ficha en el tablero.
*/
colocarPerder(X,EquipoAliado,EquipoEnemigo):- 
							//Si es el primer turno de la partida, coloca en cualquier sitio libre
							tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] & X=7.
colocarPerder(X,EquipoAliado,EquipoEnemigo):-
							 tablero(X,Y,0)[source(percept)] & not unoEnRaya(X,Y,EquipoAliado) & not bloquearCuatroEnRaya(X,EquipoAliado,EquipoEnemigo)
							|tablero(X,Y,0)[source(percept)] & not unoEnRaya(X,Y,EquipoAliado) & not bloquearTresEnRaya(X,EquipoAliado,EquipoEnemigo)
							
							|tablero(X,Y,0)[source(percept)] & not dosEnRaya(X,Y,EquipoAliado )& not bloquearCuatroEnRaya(X,EquipoAliado,EquipoEnemigo)
							|tablero(X,Y,0)[source(percept)] & not dosEnRaya(X,Y,EquipoAliado) & not bloquearTresEnRaya(X,EquipoAliado,EquipoEnemigo)
							
							|tablero(X,Y,0)[source(percept)] & not tresEnRaya(X,Y,EquipoAliado) & not bloquearCuatroEnRaya(X,EquipoAliado,EquipoEnemigo)
							|tablero(X,Y,0)[source(percept)] & not tresEnRaya(X,Y,EquipoAliado) & not bloquearTresEnRaya(X,EquipoAliado,EquipoEnemigo)

							|tablero(X,Y,0)[source(percept)] & not cuatroEnRaya(X,Y,EquipoAliado) & not bloquearCuatroEnRaya(X,EquipoAliado,EquipoEnemigo)
							|tablero(X,Y,0)[source(percept)] & not cuatroEnRaya(X,Y,EquipoAliado) & not bloquearTresEnRaya(X,EquipoAliado,EquipoEnemigo)

							|tablero(X,Y,0)[source(percept)] & not unoEnRaya(X,Y,EquipoAliado)
							|tablero(X,Y,0)[source(percept)] & not dosEnRaya(X,Y,EquipoAliado)
							|tablero(X,Y,0)[source(percept)] & not tresEnRaya(X,Y,EquipoAliado)
							|tablero(X,Y,0)[source(percept)].
/*
	El predicado conocerEquipo está implementado para dar valor a las variables EquipoAliado y EquipoEnemigo facilitando así el cambio del agente para comportarse como "player1" o 
"player2".
*/							
conocerEquipo(player1):- .abolish(equipoAliado(_)) & .asserta(equipoAliado(1)) & .abolish(equipoEnemigo(_)) & .asserta(equipoEnemigo(2)).
conocerEquipo(player2):- .abolish(equipoAliado(_)) & .asserta(equipoAliado(2)) & .abolish(equipoEnemigo(_)) & .asserta(equipoEnemigo(1)).

/* Initial goals */

!start.

/* Plans */

//El jugador inicia averiguando cual es su equipo y a continuacion ejecuta !esperar
+!start <- .my_name(Self); ?conocerEquipo(Self); !esperar.

//El jugador espera a que sea su turno para jugar
+!esperar : .my_name(Self) <- .wait(turno(Self)[source(percept)]); !jugar.

//Si el modo es jugarAGanar, el jugador pregunta a su base de conocimiento cual es la mejor posicion para colocar una ficha
+!jugar : estrategia(jugarAGanar)[source(percept)] & equipoAliado(EquipoAliado) & equipoEnemigo(EquipoEnemigo)
					<- //Pregunta por el valor de X al belief 
						?colocar(BestX,EquipoAliado,EquipoEnemigo);
						//Coloca ficha en el tablero
						put(BestX);
						//Ejecuta el plan "esperar"
						!esperar.

//Si el modo es jugarAPerder, el jugador pregunta a su base de conocimiento cual es la peor posicion para colocar una ficha
+!jugar : estrategia(jugarAPerder)[source(percept)]  & equipoAliado(EquipoAliado) & equipoEnemigo(EquipoEnemigo)
					<- //Pregunta por el valor de X e Y al belief 
						?colocarPerder(BestX,EquipoAliado,EquipoEnemigo);
						//Coloca ficha en el tablero
						put(BestX);
						//Ejecuta el plan "esperar"
						!esperar.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self & not A=percept <- .print("Ignoro al agente ", A).			