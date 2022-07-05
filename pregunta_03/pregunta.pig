/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Texto = LOAD 'data.tsv' using PigStorage('\t') AS (letter:CHARARRAY, date:CHARARRAY, counts:INT);
letter = ORDER Texto by counts;
Top = LIMIT letter 5;
c = FOREACH Top GENERATE counts;
STORE c INTO './output' USING PigStorage('\n');
