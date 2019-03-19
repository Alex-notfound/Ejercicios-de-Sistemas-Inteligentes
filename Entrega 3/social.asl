// Agent Social in project Entrega3.mas2j

/* Initial beliefs and rules */ 
calcularNumero(N) :- 
		//N = math.round(math.random(100)).
		N=17.
answer(pusilanime,"Social se que sabes que yo se cual es el producto, y s� que tu sabes cual es la suma, pero no s� cu�les son los n�meros.","Pusilanime ya sab�a que desconocias cu�les eran los n�meros; yo tambi�n los desconozco."):-
		.print("Pusilanime ya sab�a que desconocias cu�les eran los n�meros; yo tambi�n los desconozco.").
answer(pusilanime,"Sin embargo, ahora ya se cu�les son los n�meros!.","Ahora yo tambi�n los s�!."):-
		.print("Ahora yo tambi�n los s�!.").
		
sumandos(N,Sol) :- firstSumandos(N,[X,Y]) & sumandos2(X,Y, Sol).
firstSumandos(N,[2,(N-2)]) :- N <= 101.
firstSumandos(N,[(N-99),99]) :- N > 101.
sumandos2(N,M,[]) :- N>M.
sumandos2(N,M,[[N, M] | Tail]) :- N <= M & sumandos2((N+1),(M-1),Tail).

/* Initial goals */

/* Plans */

+numero("Social se que sabes que yo se cual es el producto, y s� que tu sabes cual es la suma, pero no s� cu�les son los n�meros.") : calcularNumero(N) & sumandos(N,S) <-
	.print("Social: Pusilanime ya sab�a que desconocias cu�les eran los n�meros; yo tambi�n los desconozco.");
	.send(pusilanime,tell,numero("Pusilanime ya sab�a que desconocias cu�les eran los n�meros; yo tambi�n los desconozco."));
	.wait(resultado(L));
	.intersection(S,L,Resultado);
	.print("Social: Ahora yo tambi�n los s�!. Son: ");
	if(Resultado==[]){.print("Ninguno en comun")}else{.print(Resultado)}.
