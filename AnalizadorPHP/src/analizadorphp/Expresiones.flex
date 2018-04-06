package analizadorphp;
import static.analizadorphp.Token.*;
%%
%class Lexer
%type Token
L = [a-zA-Z_]
D = [0-9]
a = [aA]
b = [bB]
c = [cC]
d = [dD]
e = [eE]
f = [fF]
g = [gG]
h = [hH]
i = [iI]
j = [jJ]
k = [kK]
l = [lL]
m = [mM]
n = [nN]
o = [oO]
p = [pP]
q = [qQ]
r = [rR]
s = [sS]
t = [tT]
u = [uU]
v = [vV]
w = [wW]
x = [xX]
y = [yY]
z = [zZ]
WHITE = [ \t\r\n]
%{
public String lexeme;
%}
%%
{WHITE} {return SPACE;}
({a}({b}{s}{t}{r}{a}{c}{t}|{n}{d}|{r}{r}{a}{y}|{s}))|({c}({a}({l}{l}{a}{b}{l}{e}|{s}{e}|{t}{c}{h})|{l}({a}{s}{s}|{o}{n}{e})|{o}{n}({s}{t}|{t}{i}{n}{u}{e})))
|({d}({e}({c}{l}{a}{r}{e}|{f}{a}{u}{l}{t})|{i}{e}|{o}))|({e}({c}{h}{o}|{l}{s}{e}({i}{f})?|{m}{p}{t}{y}|{n}{d}({d}{e}{c}{l}{a}{r}{e}|{f}{o}{r}({e}{a}{c}{h})?
|{i}{f}|{s}{w}{i}{t}{c}{h}|{w}{h}{i}{l}{e})|{v}{a}{l}|{x}({i}{t}|{t}{e}{n}{d}{s})))
|({f}({i}{n}{a}{l}|{o}{r}({e}{a}{c}{h})?|{u}{n}{c}{t}{i}{o}{n}))|({g}({l}{o}{b}{a}{l}|{o}{t}{o}))
|({i}({f}|{m}{p}{l}{e}{m}{e}{n}{t}{s}|{n}({c}{l}{u}{d}{e}("_"{o}{n}{c}{e})?|{s}{t}({a}{n}{c}{e}{o}{f}|{e}{a}{d}{o}{f})
|{t}{e}{r}{f}{a}{c}{e})|{s}{s}{e}{t}))|({n}({a}{m}{e}{s}{p}{a}{c}{e}|{e}{w}))
|({p}({r}({i}({n}{t}|{v}{a}{t}{e})|{o}{t}{e}{c}{t}{e}{d})|{u}{b}{l}{i}{c}))|({r}{e}({q}{u}{i}{r}{e}("_"{o}{n}{c}{e})?|{t}{u}{r}{n}))
|({s}({t}{a}{t}{i}{c}|{w}{i}{t}{c}{h}))|({t}({h}{r}{o}{w}|{r}({a}{i}{t}|{y})))|({u}({n}{s}{e}{t}|{s}{e}))
|("__"{h}{a}{l}{t}"_"{c}{o}{m}{p}{i}{l}{e}{r}|{b}{r}{e}{a}{k}|{l}{i}{s}{t}|({x})?{o}{r}|{v}{a}{r}|{w}{h}{i}{l}{e}) {lexeme = yytext(); return EDC;}
("__"({c}{l}{a}{s}{s}|{n}{a}{m}{e}{s}{p}{a}{c}{e}|{d}{i}{r}|{t}{r}{a}{i}{t}|{f}{i}{l}{e}|{f}{u}{n}{c}{t}{i}{o}{n}|{l}{i}{n}{e}|{m}{e}{t}{h}{o}{d})"__") {lexeme = yytext(); return CTC;}
{i}{n}{t}({e}{g}{e}{r})?|{t}{r}{u}{e}|{i}{t}{e}{r}{a}{b}{l}{e}|{f}{l}{o}{a}{t}|{f}{a}{l}{s}{e}|{o}{b}{j}{e}{c}{t}|{b}{o}{o}{l}|{n}{u}{l}{l}|{r}{e}{s}{o}{u}{r}{c}{e}{d}
|{s}{t}{r}{i}{n}{g}|{v}{o}{i}{d}|{m}{i}{x}{e}{d}|{n}{u}{m}{e}{r}{i}{c} {lexeme = yytext(); return RESERVEDWORD;}
"$"GLOBALS|_(SERVER|GET|POST|FILES|COOKIE|SESSION|REQUEST|ENV)|({L}({L}|{D})*) {lexeme = yytext(); return ID;}
("+"|"-")?({D})+ {lexeme = yytext(); return INT;}
("+"|"-")?({D})+"."({D})+ {lexeme = yytext(); return FLOAT;}
[+-]?0[xX][0-9a-fA-F]+|[+-]?0[0-7]+|[+-]?0[bB][01]+ {lexeme = yytext(); return NUM;}
(\"|\')({L}|{D}|" ")(\"|\') {lexeme = yytext(); return STRING;}
(("<"|">"|"!")("=")?)|"=="|"&&"|"||"|"+"|"-"|"/"|"%"|"*" {lexeme = yytext(); return OPERADORES;}
"<?php"|"?>" {lexeme = yytext(); return LLAVES;}
"$recordset["(\"|\')({L}|{D})(\"|\')"]" {lexeme = yytext(); return BD;}
";"|"."|","|"("|")"|"{"|"}"|"["|"]"|":"|"!"|\\ {lexeme = yytext(); return SYMB;}
("//"|"#")(.)*| "/*"([^*/])*"*/" {lexeme = yytext(); return COMENT;}
. {return ERROR;}
