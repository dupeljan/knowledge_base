parent(tom,ann). % tom - parent, ann-child tom
parent(tom,mike).
parent(mary,mike).
parent(mike,sue).
parent(mike,john).
parent(mike,nick).
parent(john,jane).
parent(sue,bob).
parent(sue,mark).
parent(john,jim).
parent(nick,liza).
parent(nick,masha).

parent(petya,vova).
parent(petya,pasha).
parent(vova,dima).
parent(vova,ruslan).

man(tom).
man(mike).
man(john).
man(nick).
man(jim).
man(petya).
man(vova).
man(pasha).
man(dima).
man(ruslan).

woman(mary).
woman(ann).
woman(sue).
woman(jane).
woman(liza).
woman(masha).

maried(petya,jane).
maried(dima,sue).
maried(ruslan,masha).
maried(pasha,liza).

grandchild(X,Y):-parent(Z,X),parent(Y,Z).
haschild(X):-parent(X,_).
sister(X,Y):-woman(X),parent(Z,X),parent(Z,Y),dif(X,Y).
%ancestor(X,Y):-parent(X,Y).
%ancestor(X,Y):-parent(Z,Y),ancestor(X,Z).
ancestor(X,X).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(X,Z),ancestor(Z,Y).

patriach(X):-parent(X,_),not(parent(_,X)).
cousin(X,Y):-parent(Z,X),parent(W,Y),dif(Z,W),parent(O,Z),parent(O,W),dif(X,Y). %Двоюродные братья или сестры
% Родственники.
%relative(X,Y):-parent(Y,X) .
%relative(X,Y):-parent(X,Y).
%relative(X,Y):-parent(X,Z),relative(Z,Y),dif(X,Y).
%relative(X,Y):-parent(Y,Z),relative(Z,X),dif(X,Y).
relative(X,Y):-ancestor(Z,X),ancestor(Z,Y).
% женаты на сестрах
maried_on_sisters(X,Y):-maried(X,Xwife),maried(Y,Ywife),woman(Xwife),sister(Xwife,Ywife).





