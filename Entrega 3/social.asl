// Agent social in project adivinarNumeros.mas2j

/* Initial beliefs and rules */

numeros(M,N) :-

candidatos(M, N) &

doesntKnowP(M, N) &

knowsSthatPdoesntKnow(M, N) &

nowPknows(M, N) &

nowSknows(M, N).

//Calculo de candidatos
candidatos(M, N) :- entre(2, 99, M) & entre(M,99,N).

entre(X, Y, X) :- X <= Y.

entre(X, Y, Z) :- X < Y & entre(X+1, Y, Z).

//Calculo de sumandos
sumandos(N, Sol) :- firstSumandos(N, (X,Y)) & sumandos2(X, Y, Sol).

firstSumandos(N, (2,(N-2))) :- N <= 101.

firstSumandos(N, ((N-99),99)) :- N > 101.

sumandos2(N, M, []) :- N>M.

sumandos2(N, M, [(N, M) | Tail]) :- N <= M & sumandos2((N+1), (M-1), Tail).

//Afirmacion
allDoesntKnowP([]).
allDoesntKnowP([(X,Y)|Tl] :- 
      doesntKnowP(X,Y) & allDoesntKnowP(Tl).

knowsSthatPdoesntKnow (A, B) :- 
      sumandos(A+B, L) & allDoesntKnowP(L).

//Test final
nowSknows(A, B) :-
      sumandos(A+B, L) &
      existsOneNowPknows(L).

existsOneNowPknows([(A, B) | Tl]) :-
      nowPknows(A, B) &
      noOneNowPknows(Tl).
existsOneNowPknows ([(A, B) | Tl]) :-
      not nowPknows(A, B) &
      existsOneNowPknows(Tl).

/* Initial goals */

!start.

/* Plans */
/*
+!start : true <- .print("hello world.").

+conversar : true <- .print("Ya sabía que tú no lo sabías; yo tampoco los sé.").
+conversar2 : true <- .print("Ahora yo también lo sé!").
*/
