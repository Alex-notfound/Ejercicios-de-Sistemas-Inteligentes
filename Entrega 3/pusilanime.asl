// Agent Pusilanime in project Entrega3.mas2j

/* Initial beliefs and rules */
calcularNumero(N) :- 
		//N = math.round(math.random(100)).
		N=52.
answer(social, "Pusilanime ya sab�a que desconocias cu�les eran los n�meros; yo tambi�n los desconozco.","Sin embargo, ahora ya se cu�les son los n�meros!."):-
	.print("Sin embargo, ahora ya se cu�les son los n�meros!.").
	
factores(N,L) :-  factores2(N,2,L).
factores2(N,M,[]) :-  M > math.floor(math.sqrt(N)).
factores2(N,M,L) :- (not ((N mod M) == 0) | N div M < M) & factores2(N,M+1,L).
factores2(N,M,[[M,N div M]|L]) :- factores2(N,M+1,L). 

sumandos(N,Sol) :- firstSumandos(N,[X,Y]) & sumandos2(X,Y,Sol).
firstSumandos(N,[2,(N-2)]) :- N <= 101.
firstSumandos(N,[(N-99),99]) :- N > 101.
sumandos2(N,M,[]) :- N>M.
sumandos2(N,M,[[N, M] | Tail]) :- N <= M & sumandos2((N+1),(M-1),Tail).

/* Initial goals */
!start.

/* Plans */

+!start : calcularNumero(N) & factores(N,L) <-
.print("Pusilanime: Social se que sabes que yo se cual es el producto, y s� que tu sabes cual es la suma, pero no s� cu�les son los n�meros.");
.send(social,tell,numero("Social se que sabes que yo se cual es el producto, y s� que tu sabes cual es la suma, pero no s� cu�les son los n�meros."));
.wait(numero("Pusilanime ya sab�a que desconocias cu�les eran los n�meros; yo tambi�n los desconozco."));
.print("Pusilanime: Sin embargo, ahora ya se cu�les son los n�meros!");
.send(social,tell,resultado(L)).
