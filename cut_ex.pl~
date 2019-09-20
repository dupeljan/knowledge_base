fact(1,1):-!.
fact(X,Y):-X1 is X-1,fact(X1,Y1),Y is Y1 * X.

%facti(X,Y):-factn(X,Y,1,1).
%factn(X,Y,I,P):-I=<X,!,P1 is P*I,I1 is I+1,factn(X,Y,I1,P1).
%factn(_,P,_,P).

facti(X,Y):-factn(X,Y,1,1).
factn(X,P,X,P):-!.
factn(X,Y,I,P):-I1 is I+1, P1 is P * I1, factn(X,Y,I1,P1).

fib(1,0):-!.
fib(2,1):-!.
fib(X,Y):-X1 is X - 1, X2 is X - 2, fib(X1,Fib1),fib(X2,Fib2),Y is Fib1 + Fib2.

fibi(X,Y):-fibn(X,Y,1,0,1). %Номер, решение, i, fib (i-1), fib (i)
fibn(X,P,X,_,P):-!.
fibn(X,Y,I,T,P):-P1 is T+P, I1 is I + 1,fibn(X,Y,I1,P,P1).

nod(X,0,X):-!.
nod(0,X,X):-!.
nod(X,Y,Z):-Y =< X,!,Y1 is X - Y,nod(Y,Y1,Z).
nod(X,Y,Z):-X1 is Y - X,nod(X1,X,Z).

min(X,Y,X):-X<Y,!.
min(_,Y,Y).

max(X,Y,X):-X>Y,!.
max(_,Y,Y).

comb(N,M,R):-NminusM is N-M,facti(N,Nfact),facti(M,Mfact),facti(NminusM,NminusMfact),
    R is  div(Nfact,Mfact * NminusMfact).
