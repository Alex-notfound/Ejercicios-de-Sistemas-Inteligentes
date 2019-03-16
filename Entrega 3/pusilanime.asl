// Agent pusilanime in project adivinarNumeros.mas2j



/* Initial beliefs and rules */

numeros(M,N) :-
candidatos(M,N) &
doesntKnowP(M,N) &
knowsSthatPdoesntKnow(M,N) &

.print("nowPknows") &
nowPknows(M,N) &
.print("nowSknows") &
nowSknows(M,N).

//Calculo de candidatos
candidatos(M,N) :- entre(2,99,M) & entre(M,99,N).
entre(X,Y,X) :- X <= Y.
entre(X,Y,Z) :- X < Y & entre(X+1,Y,Z).

//Calculo de sumandos
firstSumandos(N,2,(N-2)) :- N <= 101.
firstSumandos(N,(N-99),99) :- N > 101.
sumandos2(N,M,[]) :- N>M.
sumandos2(N,M,[N,M|Tail]) :- N <= M & sumandos2((N+1),(M-1),Tail).
sumandos(N,Sol) :- firstSumandos(N,X,Y) & sumandos2(X,Y,Sol).

//Calculo de factores
factores(N,L) :-  factores2(N,2,L).
factores2(N,M,[]) :-  M > math.floor(math.sqrt(N)).
factores2(N,M,L) :- (not N mod M =0 | N div M >M) & factores2(N,M+1,L).
factores2(N,M,[M,NdivM|L]) :- factores2(N,M+1,L).

//Afirmacion de Pusilanime
doesntKnowP(A,B) :-  factores(A*B,L) & atLeastTwo(L).
atLeastTwo([X,Y|Z]).
//Mas
allDoesntKnowP([]).
allDoesntKnowP([X,Y|Tl]) :- 
      doesntKnowP(X,Y) & allDoesntKnowP(Tl).
knowsSthatPdoesntKnow (A, B) :- 
      sumandos(A+B, L) & allDoesntKnowP(L).
	  
//Test final
nowPknows(A,B) :-  
      factores(A*B,L) & 
      existsOneKnowsSthatPdoesntKnow(L).
existsOneKnowsSthatPdoesntKnow([A,B|Tl]) :-
      knowsSthatPdoesntKnow(A,B) &
      noOneKnowsSthatPdoesntKnow(Tl).
existsOneKnowsSthatPdoesntKnow([A,B|Tl]) :-
      not knowsSthatPdoesntKnow(A,B) &
      existsOneKnowsSthatPdoesntKnow(Tl).
//Mass	 
nowSknows(A,B) :-
      sumandos((A+B),L) &
      existsOneNowPknows(L).
existsOneNowPknows([A,B|Tl]) :-
      nowPknows(A,B) &
      noOneNowPknows(Tl).
existsOneNowPknows ([A,B|Tl]) :-
      not nowPknows(A,B) &
      existsOneNowPknows(Tl).	  

/* Initial goals */



!start.



/* Plans */



+!start : numeros(M,N) <- .print("Numeros: ", M, " y ", N).

+conversar : true <- .print("No sé cuáles son los números").
+conversar2 : true <- .print("Ahora ya sé cuáles son los números!").

