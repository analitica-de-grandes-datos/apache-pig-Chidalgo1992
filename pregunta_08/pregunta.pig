/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

Texto = LOAD 'data.tsv' using PigStorage('\t') AS (B1:chararray,B2:bag{},B3:[]);
Valores = FOREACH Texto GENERATE FLATTEN($1), FLATTEN($2);
Tupla = GROUP Valores BY ($0, $1);
Conteo = FOREACH Tupla GENERATE group, COUNT(Valores);
STORE Conteo INTO 'output' USING PigStorage(',');
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
