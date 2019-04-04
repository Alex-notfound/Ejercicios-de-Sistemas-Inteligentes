

// Agent player1 in project practica2.mas2j

/* Initial beliefs and rules */
//es necesario cambiar los  1 y 2 de tablero por una constante que se inicialice a 1 o 2 segun sea el caso, para no tener que cambiarlo todo segunsea player1 o player2
jugador(1).
contrario(2).

colocar(NextX,NextY):- tablero(X,Y,0)[source(percept)] & tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])[source(percept)] 
						& NextX = 4 & NextY = 3 & .print("Colocar de tablero vacio").
colocar(NextXMove,NextYMove):- lastMove(NextX,BNextY) & bestMove(BestX,BestY) & NextXMove = BestX  & NextYMove = BestY //&.print("bestMove: ",bestMove(BestX,BestY), "PosibleMove: ",posibleMove(PosibleX,PosibleY)) 
							//| posibleMove(PosibleX,PosibleY) & NextXMove = PosibleX  & NextYMove = PosibleY .
							| NextXMove = 4 & NextYMove = 3
							| tablero(X,Y,0)[source(percept)] & NextXMove = 4 & NextYMove = 3.
							
lastMove(A,B):- last(NextX,NextY) & A=NextX & B=NextY
				&.print(last(NextX,NextY)).
posibleMove(PosibleX,PosibleY):- last(NextX,NextY) & tablero(NextX,NextY-1,0)[source(percept)] & PosibleX = NextX & PosibleY = NextY-1/*arriba*/// & UltimoX=NextX & UltimoY=NextY &.print(tablero(NextX,NextY+1,0)[source(percept)])
								| last(NextX,NextY) & tablero(NextX,NextY+1,0)[source(percept)]& PosibleX = NextX & PosibleY = NextY+1/*abajo*///&.print(tablero(NextX,NextY,0)[source(percept)])
								| last(NextX,NextY) & tablero(NextX-1,NextY,0)[source(percept)]& PosibleX = NextX-1 & PosibleY = NextY/*izq*///&.print(tablero(NextX,NextY,0)[source(percept)])
								| last(NextX,NextY) & tablero(NextX+1,NextY,0)[source(percept)]& PosibleX = NextX+1 & PosibleY = NextY/*derch*///  &.print(tablero(NextX,NextY,0)[source(percept)])							
								| last(NextX,NextY) & tablero(NextX-1,NextY-1,0)[source(percept)]& PosibleX = NextX-1 & PosibleY = NextY-1/*diag arriba izq*///&.print(tablero(NextX,NextY,0)[source(percept)])
								| last(NextX,NextY) & tablero(NextX-1,NextY+1,0)[source(percept)]& PosibleX = NextX-1 & PosibleY = NextY+1/*diag abajo izq*///&.print(tablero(NextX,NextY,0)[source(percept)])
								| last(NextX,NextY) & tablero(NextX+1,NextY-1,0)[source(percept)]& PosibleX = NextX+1 & PosibleY = NextY-1/*diag arriba derch*///&.print(tablero(NextX,NextY,0)[source(percept)])
								| last(NextX,NextY) & tablero(NextX+1,NextY+1,0)[source(percept)]& PosibleX = NextX+1 & PosibleY = NextY+1./*diagonal abajo derch*///&.print(tablero(NextX,NextY,0)[source(percept)]).
/*bestMove*/
bestMove(BestX,BestY):- 	
						/*3 Seguidos*/
						//3 seguido arriba
						posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX,PosibleY+1,1)[source(percept)]  & tablero(PosibleX,PosibleY+2,1)[source(percept)]  & tablero(PosibleX,PosibleY+3,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//3 seguido abajo
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX,PosibleY-1,1)[source(percept)]  & tablero(PosibleX,PosibleY-2,1)[source(percept)]  & tablero(PosibleX,PosibleY-3,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//3 seguidos derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY,1)[source(percept)]  & tablero(PosibleX-2,PosibleY,1)[source(percept)]  & tablero(PosibleX-3,PosibleY,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//3 seguidos izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY,1)[source(percept)]  & tablero(PosibleX+2,PosibleY,1)[source(percept)]  & tablero(PosibleX+3,PosibleY,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//3 seguido diagonal abajo derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY-1,1)[source(percept)] & tablero(PosibleX-2,PosibleY-2,1) & tablero(PosibleX-3,PosibleY-3,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//3 seguido diagonal abajo izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY-1,1)[source(percept)]  & tablero(PosibleX+2,PosibleY-2,1)& tablero(PosibleX+3,PosibleY-3,1)[source(percept)] & BestX = PosibleX & BestY = PosibleY
						//3 seguido diagonal arriba derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY+1,1)[source(percept)]  & tablero(PosibleX-2,PosibleY+2,1)& tablero(PosibleX-3,PosibleY+3,1)[source(percept)] & BestX = PosibleX & BestY = PosibleY
						//3 seguido diagonal arriba izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY+1,1)[source(percept)] & tablero(PosibleX+2,PosibleY+2,1) & tablero(PosibleX+3,PosibleY+3,1)& BestX = PosibleX & BestY = PosibleY						
						/*2 Seguidos*/
						//2 seguido arriba
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX,PosibleY+1,1)[source(percept)]  & tablero(PosibleX,PosibleY+2,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//2 seguido abajo
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX,PosibleY-1,1)[source(percept)]  & tablero(PosibleX,PosibleY-2,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//2 seguidos derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY,1)[source(percept)]  & tablero(PosibleX-2,PosibleY,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//2 seguidos izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY,1)[source(percept)]  & tablero(PosibleX+2,PosibleY,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//2 seguido diagonal abajo derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY-1,1)[source(percept)] & tablero(PosibleX-2,PosibleY-2,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//2 seguido diagonal abajo izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY-1,1)[source(percept)]  & tablero(PosibleX+2,PosibleY-2,1)[source(percept)] & BestX = PosibleX & BestY = PosibleY
						//2 seguido diagonal arriba derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY+1,1)[source(percept)]  & tablero(PosibleX-2,PosibleY+2,1)[source(percept)] & BestX = PosibleX & BestY = PosibleY
						//2 seguido diagonal arriba izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY+1,1)[source(percept)] & tablero(PosibleX+2,PosibleY+2,1) & BestX = PosibleX & BestY = PosibleY
						/*1 seguido*/
						//1 seguido arriba
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX,PosibleY+1,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido abajo
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX,PosibleY-1,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido diagonal abajo derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY-1,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido diagonal abajo izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY-1,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido diagonal arriba derecha
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX-1,PosibleY+1,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY
						//1 seguido diagonal arriba izquierda
						|posibleMove(PosibleX,PosibleY)
						& tablero(PosibleX+1,PosibleY+1,1)[source(percept)]  & BestX = PosibleX & BestY = PosibleY.
						
/* Initial goals */

!start.

/* Plans */


//tipo de juego viene del environment linea 573-580/*			
+!start <-.wait(turno(player2)[source(percept)]); !jugar.
//estrategia minimax
+!jugar : estrategia(jugarAGanar) //& tablero(X,Y,V)
					<- //preguntar por el valor de X e Y  al belief 
						?colocar(NextX,NextY);
						//pasar el valor de X e Y con 
						put(NextX,NextY);
						//remenber last move
						//-last(_,_);
						+last(NextX,NextY);
						//.print("last en main: ",last(NextX,NextY));
						
						!start.
//problema de la reina pag103
+!jugar : estrategia(jugarAPerder) & tablero(X,Y,V)[source(percept)] <- put(X,Y); !start.
