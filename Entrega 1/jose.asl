// Agent jose in project GreetingSimple.mas2j

/* Initial beliefs and rules */

/* Initial goals */

!digoQue("Hola don Pepito").
+!digoQue("Hola don Pepito") <- .print("Jose: Hola don Pepito"); .broadcast(achieve,digoQue("Hola don Pepito")).
+!digoQue("Hola don Jose")<- .print("Jose: Paso usted por mi casa?"); .broadcast(achieve,digoQue("Paso usted por mi casa?")).
+!digoQue("Por su casa yo pase")<- .print("Jose: Vio usted a mi abuela?"); .broadcast(achieve,digoQue("Vio usted a mi abuela?")).
+!digoQue("A su abuela yo la vi")<- .print("Jose: Adios don Pepito"); .broadcast(achieve,digoQue("Adios don Pepito")).

+!queja("Dame un caramelo").
+!queja("Quiero un helado").
+!queja("Quiero ir al parque") <- .print("Jose: Ya vamos Clara").
+!digoQue("Adios don Jose").


/* Plans */


