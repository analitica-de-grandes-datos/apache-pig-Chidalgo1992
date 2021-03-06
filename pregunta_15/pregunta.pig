/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/

data = LOAD './data.csv' USING PigStorage(',')
    AS (
            id:int,
            name:chararray,
            lastname:chararray,
            birth_date:chararray,
            colour:chararray,
            children:int
    );

name_color_tbl = FOREACH data GENERATE name AS firstname, colour AS color;

name_color_filtered = FILTER name_color_tbl BY (firstname MATCHES '(?i).*Z.*') AND (color=='blue');

STORE name_color_filtered INTO 'output/' using PigStorage(' ');
