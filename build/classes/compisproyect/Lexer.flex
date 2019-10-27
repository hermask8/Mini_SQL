package compisproyect;  
import static compisproyect.Tokens.*; 

%%
%class Lexer
%type Tokens
%line
%column

/*Ingreso de digitos y letras*/
Letra=[a-zA-Z_]+
Digito=[0-9]+
Operadores = ["+","-","/","*","%"]
Signos = ["+","-"]
Comparadores = [">","<","<=",">=","==","!="]
Operador = {Operadores}?
Comparador = {Comparadores}?
Simbolos = ["&&"|"||"|"!"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"|"{}"|"[]"|"()"|"@"|"#"|"##"] 
Separador = [","]
Simbolo = {Simbolos}?
Espacios = [" ",\t,\n,\r]+
Enter = [\n|\r|\n\r|\r\n]
/*Termina el Ingreso de digitos y letras*/

/*Expresiones Regulares Correctas*/
ComentarioMultilinea ="/*"[^*]~"*/" 

ComentarioLinea = "--"[^]~([\r]|[\n])
Enteros = {Signos}?{Digito}+
boolean = [0] | [1] | [NULL]
Identificador = {Letra}({Letra}|{Digito})*
String = "'"({Letra}({Letra} | {Digito} | " ")*)"'"

Float = {Signos}?{Digito}+"."{Digito}*("E"({Signos}?)|"e"({Signos}?))?{Digito}+

/*Fin de Expresiones Regulares Correctas*/

/*Expresiones Regulares Incorrectas*/
ErrorMultilinea = "/*"[^]
ErrorIdentificador = {Enteros}+{Identificador}
ErrorString = (("'"({Letra}({Letra} | {Digito} | " ")*))|("'"({Letra}({Letra} | {Digito} | " " |\n)*)"'"))

%{
    public String lexeme;
    public int linea;
    public int columna;
%} 
%%
int |
if |
else |
ADD | EXTERNAL | PROCEDURE |
ALL | FETCH | PUBLIC |
ALTER | FILE | RAISERROR |
AND | FILLFACTOR | READ |
ANY | FOR | READTEXT |
AS | FOREIGN | RECONFIGURE |
ASC | FREETEXT | REFERENCES |
AUTHORIZATION | FREETEXTTABLE | REPLICATION |
BACKUP | FROM | RESTORE |
BEGIN | FULL | RESTRICT |
BETWEEN | FUNCTION | RETURN |
BREAK | GOTO | REVERT |
BROWSE | GRANT |REVOKE |
BULK | GROUP | RIGHT |
BY | HAVING | ROLLBACK |
CASCADE | HOLDLOCK | ROWCOUNT |
CASE | IDENTITY | ROWGUIDCOL |
CHECK | IDENTITY_INSERT | RULE |
CHECKPOINT | IDENTITYCOL | SAVE |
CLOSE | IF | SCHEMA |
CLUSTERED | IN | SECURITYAUDIT | 
COALESCE | INDEX | SELECT |
COLLATE | INNER | SEMANTICKEYPHRASETABLE |
COLUMN | INSERT | SEMANTICSIMILARITYDETAILSTABLE |
COMMIT | INTERSECT | SEMANTICSIMILARITYTABLE |
COMPUTE | INTO | SESSION_USER |
CONSTRAINT | IS | SET |
CONTAINS | JOIN | SETUSER |
CONTAINSTABLE | KEY | SHUTDOWN |
CONTINUE | KILL | SOME |
CONVERT | LEFT | STATISTICS |
CREATE | LIKE | SYSTEM_USER |
CROSS | LINENO | TABLE |
CURRENT | LOAD | TABLESAMPLE |
CURRENT_DATE | MERGE | TEXTSIZE |
CURRENT_TIME | NATIONAL | THEN |
CURRENT_TIMESTAMP | NOCHECK | TO |
CURRENT_USER | NONCLUSTERED | TOP |
CURSOR | NOT | TRAN |
DATABASE | NULL | TRANSACTION |
DBCC | NULLIF | TRIGGER |
DEALLOCATE | OF | TRUNCATE |
DECLARE | OFF | TRY_CONVERT |
DEFAULT | OFFSETS | TSEQUAL |
DELETE | ON | UNION |
DENY | OPEN | UNIQUE |
DESC | OPENDATASOURCE |UNPIVOT |
DISK | OPENQUERY | UPDATE |
DISTINCT | OPENROWSET | UPDATETEXT |
DISTRIBUTED | OPENXML | USE |
DOUBLE | OPTION | USER |
DROP | OR | VALUES |
DUMP | ORDER | VARYING |
ELSE | OUTER | VIEW |
END | OVER | WAITFOR |
ERRLVL | PERCENT | WHEN |
ESCAPE | PIVOT | WHERE |
EXCEPT | PLAN | WHILE |
EXEC | PRECISION | WITH |
EXECUTE | PRIMARY | WITHIN GROUP |
EXISTS | PRINT | WRITETEXT |
EXIT | PROC |
ABSOLUTE | EXEC | OVERLAPS |
ACTION | EXECUTE | PAD |
ADA | EXISTS | PARTIAL |
ADD | EXTERNAL | PASCAL |
ALL | EXTRACT | POSITION |
ALLOCATE | FALSE | PRECISION |
ALTER | FETCH | PREPARE |
AND | FIRST | PRESERVE |
ANY | FLOAT | PRIMARY |
ARE | FOR | PRIOR |
AS | FOREIGN | PRIVILEGES |
ASC | FORTRAN | PROCEDURE |
ASSERTION | FOUND | PUBLIC |
AT | FROM | READ |
AUTHORIZATION | FULL | REAL |
AVG | GET | REFERENCES |
BEGIN | GLOBAL | RELATIVE |
BETWEEN | GO | RESTRICT |
BIT | GOTO | REVOKE |
BIT_LENGTH | GRANT | RIGHT |
BOTH | GROUP | ROLLBACK |
BY | HAVING | ROWS |
CASCADE | HOUR | SCHEMA | 
CASCADED | IDENTITY | SCROLL |
CASE | IMMEDIATE | SECOND |
CAST | IN | SECTION |
CATALOG | INCLUDE | SELECT |
CHAR | INDEX | SESSION |
CHAR_LENGTH | INDICATOR | SESSION_USER |
CHARACTER | INITIALLY | SET |
CHARACTER_LENGTH | INNER | SIZE |
CHECK | INPUT | SMALLINT |
CLOSE | INSENSITIVE | SOME |
COALESCE | INSERT | SPACE |
COLLATE | INT | SQL |
COLLATION | INTEGER | SQLCA |
COLUMN | INTERSECT | SQLCODE |
COMMIT | INTERVAL | SQLERROR |
CONNECT | INTO | SQLSTATE |
CONNECTION | IS | SQLWARNING |
CONSTRAINT | ISOLATION | SUBSTRING |
CONSTRAINTS |JOIN | SUM |
CONTINUE | KEY | SYSTEM_USER |
CONVERT | LANGUAGE | TABLE |
CORRESPONDING | LAST | TEMPORARY |
COUNT | LEADING | THEN |
CREATE | LEFT | TIME |
CROSS | LEVEL | TIMESTAMP |
CURRENT | LIKE | TIMEZONE_HOUR |
CURRENT_DATE | LOCAL | TIMEZONE_MINUTE |
CURRENT_TIME | LOWER | TO |
CURRENT_TIMESTAMP | MATCH | TRAILING |
CURRENT_USER | MAX | TRANSACTION |
CURSOR | MIN | TRANSLATE |
DATE | MINUTE | TRANSLATION |
DAY | MODULE | TRIM |
DEALLOCATE | MONTH | TRUE |
DEC | NAMES | UNION |
DECIMAL | NATIONAL | UNIQUE |
DECLARE | NATURAL | UNKNOWN |
DEFAULT | NCHAR | UPDATE |
DEFERRABLE | NEXT | UPPER |
DEFERRED | NO | USAGE |
DELETE | NONE | USER |
DESC | NOT | USING |
DESCRIBE | NULL | VALUE |
DESCRIPTOR | NULLIF | VALUES |
DIAGNOSTICS | NUMERIC | VARCHAR |
DISCONNECT | OCTET_LENGTH | VARYING |
DISTINCT | OF | VIEW |
DOMAIN | ON | WHEN |
DOUBLE | ONLY | WHENEVER |
DROP | OPEN | WHERE |
ELSE | OPTION | WITH |
END | OR | WORK |
END-EXEC | ORDER | WRITE |
ESCAPE | OUTER | YEAR |
EXCEPT | OUTPUT | ZONE |
EXCEPTION |
while 
{lexeme=yytext(); return Reservadas;}

{Espacios} {/*Ignore*/}
{ComentarioMultilinea} {lexeme = yytext(); linea = yyline; columna =yycolumn; return ComentarioMultilinea;}
{ComentarioLinea} {lexeme = yytext(); linea = yyline; columna =yycolumn; return ComentarioLinea;}

"//".* {/*Ignore*/}
{Simbolo} {lexeme = yytext(); linea = yyline; columna =yycolumn; return Simbolo;}
{Identificador} {lexeme=yytext(); linea = yyline; columna =yycolumn; return Identificador;}
{Enteros} {lexeme = yytext(); linea = yyline; columna =yycolumn; return Enteros;}
{Float} {lexeme= yytext(); linea = yyline; columna =yycolumn; return Float;}
{String} {lexeme = yytext(); linea = yyline; columna =yycolumn; return String1;}
{Separador} {lexeme = yytext(); linea = yyline; columna =yycolumn; return Separador;}
{Operador} {lexeme = yytext(); linea = yyline; columna =yycolumn; return Operador;}
{Comparador} {lexeme = yytext(); linea = yyline; columna =yycolumn; return Comparador;}

{ErrorIdentificador} {lexeme = yytext(); linea = yyline; columna =yycolumn; return ErrorIdentificador;} 
{ErrorString} {lexeme = yytext(); linea = yyline; columna =yycolumn; return ErrorString;}
{ErrorMultilinea} {lexeme = yytext(); linea = yyline; columna =yycolumn; return ErrorMultilinea;}
 . {return ERROR;}
