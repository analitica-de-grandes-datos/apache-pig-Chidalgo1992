/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
Texto = LOAD 'data.tsv' using PigStorage('\t') AS (letter:CHARARRAY, date:CHARARRAY, counts:INT);
letter = ORDER Texto by letter,counts;
STORE letter INTO './output' USING PigStorage(',');
