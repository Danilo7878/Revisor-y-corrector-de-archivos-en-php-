package analizadorphp;
import static.analizadorphp.Token.*;
%%
%class Lexer
%type Token
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
"__"{h}{a}{l}{t}"_"{c}{o}{m}{p}{i}{l}{e}{r}"()"|{b}{r}{e}{a}{k}|{c}{l}{o}{n}{e}
|die() {lexeme = yytext(); return RESERVEDWORD;}
