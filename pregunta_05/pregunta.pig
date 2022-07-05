/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Texto = LOAD 'data.tsv' using PigStorage('\t') AS (B1:chararray,line:chararray,B3:chararray);
Tupla = FOREACH Texto GENERATE FLATTEN(TOKENIZE(line)) AS palabra;
Group1 = GROUP Tupla by palabra;
counts = FOREACH Group1 GENERATE group,COUNT(Tupla);
letras = LIMIT counts 7; 
STORE letras INTO './output' USING PigStorage(',');
