/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

Texto = LOAD 'data.tsv' using PigStorage('\t') AS (B1:chararray,line:chararray,B3:map[]);
Tupla = FOREACH Texto GENERATE FLATTEN(B3) AS palabra;
Group1 = GROUP Tupla by palabra;
counts = FOREACH Group1 GENERATE group,COUNT(Tupla);
STORE counts INTO './output' USING PigStorage(',');
