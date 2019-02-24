// Agent Pepe in project GreetingSimple.mas2j

/* Initial beliefs and rules */

/* Initial goals */

+!digoQue("Hola don Pepito") <- .print("Clara: Dame un caramelo"); .broadcast(achieve,queja("Dame un caramelo")).
+!digoQue("Paso usted por mi casa?") <- .print("Clara: Quiero un helado"); .broadcast(achieve,queja("Quiero un helado")).
+!digoQue("Vio usted a mi abuela?").
+!digoQue("Adios don Pepito") <-  .print("Clara: Quiero ir al parque"); .broadcast(achieve,queja("Quiero ir al parque")).
+!digoQue("Ya vamos Clara") <- .print("Clara: Por fin!!"); .send(jose,achieve,digoQue("Por fin!!")); .abolish(Percepts[source(jose)]);.abolish(Percepts[source(pepe)]).

/* Plans */
