// Agent Pepe in project GreetingSimple.mas2j

/* Initial beliefs and rules */

/* Initial goals */

//!start.
+!digoQue("Hola don Pepito") <- .print("Pepe: Hola don Jose"); .send(jose,achieve,digoQue("Hola don Jose")).
+!digoQue("Paso usted por mi casa?") <- .print("Pepe: Por su casa yo pase"); .send(jose,achieve,digoQue("Por su casa yo pase")).
+!digoQue("Vio usted a mi abuela?")<-  .print("Pepe: A su abuela yo la vi"); .send(jose,achieve,digoQue("A su abuela yo la vi")).
+!digoQue("Adios don Pepito")<- .print("Pepe: Adios don Jose"); .send(jose,achieve,digoQue("Adios don Jose")).

+!queja("Dame un caramelo").
+!queja("Quiero un helado").
+!queja("Quiero ir al parque").
//!adios.
/* Plans */
