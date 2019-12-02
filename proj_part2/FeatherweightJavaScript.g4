grammar FeatherweightJavaScript;


//@header { package edu.sjsu.fwjs.parser; }

// Reserved words
IF        : 'if' ;
ELSE      : 'else' ;
//added
WHILE     : 'while' ;
FUNCTION  : 'function' ;
VAR       : 'var' ;
PRINT     : 'print';
// Literals
INT       : [1-9][0-9]* | '0' ;
//added BOOLs either true or false
BOOL      :'true'| 'false';
NULL      :'null';
// Symbols
MUL       : '*' ;
DIV       : '/' ;
SEPARATOR : ';' ;
//added symbols:
ASSIGN 	  : '=' ;
ADD       : '+';
SUB       : '-';
MOD       : '%';
//comparision part
GT		  : '>' ;
LT 		  : '<' ;
EQ		  : '==';
GE		  : '>=';
LE 		  : '<=';
//identifiers: The rules for variable names in FWJS:
//*The first character must be an alphabetic character or an underscore.
//*The remaining characters must be alphabetic characters, numeric characters, or underscores.
ID		  : [a-zA-Z_][a-zA-Z_0-9]*;

// Whitespace and comments
NEWLINE   : '\r'? '\n' -> skip ;
LINE_COMMENT  : '//' ~[\n\r]* -> skip ;
WS            : [ \t]+ -> skip ; // ignore whitespace
//block : *BLOCK_COMMENTs are the usual C-style /* comments */.
BLOCK_COMMENT : '/*' .*? '*/' -> skip ;

// ***Parsing rules ***

/** The start rule */
prog: stat+ ;

stat: expr SEPARATOR                                    # bareExpr
    | IF '(' expr ')' block ELSE block                  # ifThenElse
    | IF '(' expr ')' block                             # ifThen
    | WHILE '(' expr ')' block                          # while
    | PRINT '(' expr ')' SEPARATOR?                     # print
    | SEPARATOR                                         # empty
    ;

expr: expr op = ( '*' | '/' | '%' ) expr                # MulDivMod
    | expr op =( '+' | '-' ) expr                       # AddSub
    | expr op =( '<' | '<=' | '>' | '>=' | '==' ) expr  # Compare
    | FUNCTION params block                             # FuncDec
    | expr args                                         # FuncApp
    | VAR ID ASSIGN expr                                # VarDec
    | ID                                                # VarRef
    | ID ASSIGN expr                                    # Assignment
    | INT                                               # int
    | BOOL                                              # bool
    | NULL                                              # null
    | '(' expr ')'                                      # parens
    ;

block: '{' stat* '}'                                    # fullBlock
     | stat                                             # simpBlock
     ;
params: '(' (ID (',' ID)* )? ')' ;

args: '(' (expr (',' expr)* )? ')' ;
