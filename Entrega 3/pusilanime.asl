// Agent pusilanime in project adivinarNumeros.mas2j



/* Initial beliefs and rules */

numeros(M,N) :-
candidatos(M,N) &
doesntKnowP(M,N) &
knowsSthatPdoesntKnow(M,N) &
nowPknows(M,N) &
nowSknows(M,N).

//Calculo de candidatos
candidatos(M,N) :- entre(2,99,M) & entre(M,99,N) & .print("Candidatos: ", M," ",N).
entre(X,Y,X) :- X <= Y.
entre(X,Y,Z) :- X < Y & entre(X+1,Y,Z).

//Calculo de sumandos
sumandos(N,Sol) :- firstSumandos(N,X,Y) & sumandos2(X,Y,Sol).
firstSumandos(N,2,(N-2)) :- N <= 101.
firstSumandos(N,(N-99),99) :- N > 101.
sumandos2(N,M,[]) :- N>M.
sumandos2(N,M,[N,M|Tail]) :- N <= M & sumandos2((N+1),(M-1),Tail) & .print("Sumandos: ", M," ",N).

//Calculo de factores
factores(N,L) :-  factores2(N,2,L).
factores2(N,M,[]) :-  M > math.floor(math.sqrt(N)).
factores2(N,M,L) :- (not N mod M =0 | N div M >M) & factores2(N,M+1,L).
factores2(N,M,[M,N div M|L]) :- factores2(N,M+1,L)& .print("Factor: ", L).

//Afirmacion de Pusilanime
doesntKnowP(A,B) :-  factores(A*B,L) & atLeastTwo(L).
atLeastTwo([X,Y|Z]).
atLeastTwo([]):- false.
atLeastTwo([X]):- false.
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
	  
noOneKnowsSthatPdoesntKnow([]).

existsOneKnowsSthatPdoesntKnow([A,B|Tl]) :-
      not knowsSthatPdoesntKnow(A,B) &
      existsOneKnowsSthatPdoesntKnow(Tl).	  
nowSknows(A,B) :- 
      sumandos((A+B),L) &
      existsOneNowPknows(L).
existsOneNowPknows([A,B|Tl]) :-
      nowPknows(A,B) &
      noOneNowPknows(Tl).
noOneNowPknows([]).	 
existsOneNowPknows ([A,B|Tl]) :-
      not nowPknows(A,B) &
      existsOneNowPknows(Tl).	  

/* Initial goals */



!start.



/* Plans */



+!start : numeros(M,N)<- .print("Numeros: ", M, " y ", N).

