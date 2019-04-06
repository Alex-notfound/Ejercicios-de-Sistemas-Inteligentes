/* Initial beliefs and rules */

prioridad(2000).

raya([16,16,16,0],X,P) :- P=1 & X=3.
raya([0,16,16,16],X,P) :- P=1 & X=0.
raya([16,16,0,16],X,P) :- P=1 & X=2.
raya([16,0,16,16],X,P) :- P=1 & X=1.

raya([16,16,0,0],X,P) :- P=4 & X=2.
raya([0,16,16,0],X,P) :- P=4 & X=0.
raya([0,0,16,16],X,P) :- P=4 & X=1.
raya([0,16,0,16],X,P) :- P=4 & X=2.
raya([16,0,16,0],X,P) :- P=4 & X=1.
raya([16,0,0,16],X,P) :- P=4 & X=2.

raya([16,0,0,0],X,P) :- P=10 & X=1.
raya([0,16,0,0],X,P) :- P=10 & X=0.
raya([0,0,16,0],X,P) :- P=10 & X=1.
raya([0,0,0,16],X,P) :- P=10 & X=2.

raya([0,0,0,0],X,P) :- P=100 & X=1.

raya([17,17,17,0],X,P) :- P=2 & X=3.
raya([0,17,17,17],X,P) :- P=2 & X=0.
raya([17,17,0,17],X,P) :- P=2 & X=2.
raya([17,0,17,17],X,P) :- P=2 & X=1.

raya([17,17,0,0],X,P) :- P=3 & X=2.
raya([0,17,17,0],X,P) :- P=3 & X=0.
raya([0,0,17,17],X,P) :- P=3 & X=1.
raya([0,17,0,17],X,P) :- P=3 & X=2.
raya([17,0,17,0],X,P) :- P=3 & X=1.
raya([17,0,0,17],X,P) :- P=3 & X=1.

raya([17,0,0,0],X,P) :- P=5 & X=3.
raya([0,17,0,0],X,P) :- P=5 & X=3.
raya([0,0,17,0],X,P) :- P=5 & X=0.
raya([0,0,0,17],X,P) :- P=5 & X=0.

raya(L,X,P) :- P=1500 & X=0.

/* Initial goals */

!start.

/* Plans */

//Espera a que sea su turno para jugar
+!start <-.wait(turno(player1)); !jugar.
//Si es el primer turno coloca en una posicion cualquiera
+!jugar : estrategia(jugarAGanar) & tablero([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]) & tablero(X,Y,0) <- put(X,Y); !start.
//En cualquier otro caso analiza las posibilidades, coloca y vuelve a esperar su turno
+!jugar : estrategia(jugarAGanar) <- !buscar4enRaya;!start.

+!buscar4enRaya <-
	//Intenta confundir al jugador contrario
	.send(player2,tell,estrategia(jugarAPerder));
	//Busca la mejor posicion para colocar una ficha en relacion a una raya horizontal aliada o enemiga
	!estrategiaHorizontal;
	//Busca la mejor posicion para colocar una ficha en relacion a una raya vertical aliada o enemiga
	!estrategiaVertical;
	//Busca la mejor posicion para colocar una ficha en relacion a una raya diagonal \ aliada o enemiga
	!estrategiaDiagonalIzq;
	//Busca la mejor posicion para colocar una ficha en relacion a una raya diagonal / aliada o enemiga
	!estrategiaDiagonalDer;
	//Pregunta por la ultima prioridad almacenada
	?prioridad(PF);
	//Si el nivel de prioridad es relevante, pregunta por la mejor posicion calculada y coloca
	if(PF<1000){
		?x(X);
		?y(Y);
		put(X,Y);
	} //En otro caso, coloca en un sitio aleatorio disponible
	else{
		?tablero(Q,W,0);
		put(Q,W)
	} //Resetea la prioridad
	-+prioridad(2000).

+!estrategiaHorizontal : tablero(L) <-
	.length(L, Tam);
	for(.range(Num,0,60)){
		PosicionHorizontal = Num mod 8;
		//Descarta las casillas ya evaluadas
		if(PosicionHorizontal<5){
			.delete(0,Num,L,Tablero);
			//Descarta las casillas que se evaluaran posteriormente
			.delete(4,Tam,Tablero,Raya);
			//Analiza la raya obtenida
			?raya(Raya,Solucion,P);	
			//Si P de prioridad es 1, coloca para ganar
			if(P==1){
				.print("Voy a ganar con PH: ", PosicionHorizontal);
				//Si la posicion actual esta en la mitad derecha del tablero, coloca a partir de 4 en la posicion correcta
				if(PosicionHorizontal mod 8 > 3){
					put(4+Solucion,Num/8);
				//Si no, coloca a partir de la posicion actual en la correcta
				}else{
					put(PosicionHorizontal+Solucion,Num/8);
				}
			}
			//Obtiene la mayor prioridad almacenada hasta el momento
			?prioridad(PM);
			//Si la prioridad es menor que la almacenada hasta el momento, la actualiza y almacena los nuevos valores de X e Y
			if(P<PM){
				//Actualiza la prioridad
				-+prioridad(P);
				//Si la posicion actual esta en la mitad derecha del tablero, coloca a partir de 4 en la posicion correcta
				if(PosicionHorizontal mod 8 > 3){
					X=4+Solucion;
				//Si no, coloca a partir de la posicion actual en la correcta
				}else{
					X=PosicionHorizontal+Solucion;
				}
				//Actualiza X
				-+x(X);
				//Se calcula Y
				Y=Num div 8;
				//Actualiza Y
				-+y(Y);
			}
		}
	}
.

+!estrategiaVertical : tablero(L) <-
	.length(L, Tam);
	for(.range(Num,0,39)){
		PosicionVertical = Num div 8;
		//Descarta las casillas ya evaluadas
		.delete(0,Num,L,Tablero);
		.delete(1,8,Tablero,Tablero2);
		.delete(2,9,Tablero2,Tablero3);
		.delete(3,10,Tablero3,Tablero4);
		//Descarta las casillas que se evaluaran posteriormente
		.delete(4,Tam,Tablero4,Raya);
		//.print("Raya: ", Raya);
		?raya(Raya,Solucion,P);		
		if(P==1){
			.print("Voy a ganar con Num: ", Num, " PV: ", PosicionVertical+Solucion);
			put(Num mod 8,PosicionVertical+Solucion);
		}
			
		?prioridad(PM);
		if(P<PM){
			-+prioridad(P);
			X=Num mod 8;
			-+x(X);
			Y=PosicionVertical+Solucion;
			-+y(Y);
		}
	}
.

+!estrategiaDiagonalIzq : tablero(L) <-
	.length(L, Tam);
	for(.range(Num,0,33)){
		if((Num mod 8) < 5){
			PosicionVertical = Num div 8;
			//Descarta las casillas que no pertenezcan a la diagonal actual
			.delete(0,Num,L,Tablero);
			.delete(1,9,Tablero,Tablero2);
			.delete(2,10,Tablero2,Tablero3);
			.delete(3,11,Tablero3,Tablero4);
			.delete(4,Tam,Tablero4,Raya);
			//Obtiene la Prioridad y la posicion en la que se debe colocar la ficha
			?raya(Raya,Solucion,P);		
			//Si la prioridad es 1, ejecuta la jugada ganadora
			if(P==1){
				-+prioridad(P);
				put((Num mod 8)+Solucion,PosicionVertical+Solucion);
			}else{
				?prioridad(PM);
				if(P<PM){
					//.print("P es ", P, " y PM es ", PM);
					-+prioridad(P);
					X=(Num mod 8)+Solucion;
					-+x(X);
					Y=PosicionVertical+Solucion;
					-+y(Y);
					.print("[",X,",",Y,"]");
				}
			}
		}
	}
.

+!estrategiaDiagonalDer : tablero(L) <-
	.length(L, Tam);
	for(.range(Num,0,36)){
		if((Num mod 8) > 2){
			PosicionVertical = Num div 8;
			//Descarta las casillas que no pertenezcan a la diagonal actual
			.delete(0,Num,L,Tablero);
			.delete(1,7,Tablero,Tablero2);
			.delete(2,8,Tablero2,Tablero3);
			.delete(3,9,Tablero3,Tablero4);
			.delete(4,Tam,Tablero4,Raya);
			//Obtiene la Prioridad y la posicion en la que se debe colocar la ficha
			?raya(Raya,Solucion,P);		
			//Si la prioridad es 1, ejecuta la jugada ganadora
			if(P==1){
				-+prioridad(P);
				put((Num mod 8)-Solucion,PosicionVertical+Solucion);
			}else{
				?prioridad(PM);
				if(P<PM){
					-+prioridad(P);
					X=(Num mod 8)-Solucion;
					-+x(X);
					Y=PosicionVertical+Solucion;
					-+y(Y);
					.print("[",X,",",Y,"]");
				}
			}
		}
	}
.

+!jugar : estrategia(jugarAPerder) & tablero(X,Y,0) <- put(X,Y); !start.

//Plan por defecto para otros casos, de este modo se trata de evitar ser engañado.
+Default[source(A)]: not A=self & not A=percept <- .print("Ignoro al agente ", A).
