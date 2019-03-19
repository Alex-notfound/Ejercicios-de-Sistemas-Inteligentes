// Agent Social in project Entrega3.mas2j

/* Initial beliefs and rules */ 
calcularNumero(N) :- 
		//N = math.round(math.random(100)).
		N=17.
answer(pusilanime,"Social se que sabes que yo se cual es el producto, y sé que tu sabes cual es la suma, pero no sé cuáles son los números.","Pusilanime ya sabía que desconocias cuáles eran los números; yo también los desconozco."):-
		.print("Pusilanime ya sabía que desconocias cuáles eran los números; yo también los desconozco.").
answer(pusilanime,"Sin embargo, ahora ya se cuáles son los números!.","Ahora yo también los sé!."):-
		.print("Ahora yo también los sé!.").
		
sumandos(N,Sol) :- firstSumandos(N,[X,Y]) & sumandos2(X,Y, Sol).
firstSumandos(N,[2,(N-2)]) :- N <= 101.
firstSumandos(N,[(N-99),99]) :- N > 101.
sumandos2(N,M,[]) :- N>M.
sumandos2(N,M,[[N, M] | Tail]) :- N <= M & sumandos2((N+1),(M-1),Tail).

/* Initial goals */

/* Plans */

+numero("Social se que sabes que yo se cual es el producto, y sé que tu sabes cual es la suma, pero no sé cuáles son los números.") : calcularNumero(N) & sumandos(N,S) <-
	.print("Social: Pusilanime ya sabía que desconocias cuáles eran los números; yo también los desconozco.");
	.send(pusilanime,tell,numero("Pusilanime ya sabía que desconocias cuáles eran los números; yo también los desconozco."));
	.wait(resultado(L));
	.intersection(S,L,Resultado);
	.print("Social: Ahora yo también los sé!. Son: ");
	if(Resultado==[]){.print("Ninguno en comun")}else{.print(Resultado)}.
