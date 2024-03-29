% sum of list elements
% sum(list,sum(list))
sum([],0).
sum([H|T],A):-sum(T,A1),A is H + A1.

% seek for i-th el of the list
% find(i list, elem[i])
find(0,[H|_],H):-!.
find(I,[_|T],Res):-I1 is I - 1,find(I1,T,Res).

% isMember of the list
% isMember(elem,list)
isMember(H,[H|_]):-!.
isMember(X,[_|T]):-isMember(X,T).

% min member of the list
% minElement(elem,list)
minElement(_,[]):-false.
minElement(M, [M]):-!.
minElement(M, [H | T]) :-  minElement(M1, T), H =< M1, !, M is H.
minElement(M, [_,T]) :- minElement(M, T).

% min member of the list iterative
% minElementi(elem,list)
% minElementn(elem,list,i_min)
minElementi(_,[]):-false.
minElementi(X,[X]).
minElementi(X,[H|T]):-minElementn(X,T,H).
minElementn(X,[H|T],Imin):-H < Imin,!,minElementn(X,T,H).
minElementn(X,[_|T],Imin):-minElementn(X,T,Imin).
minElementn(X,[],X):-!.

% reverce list
% reverce(list,reverce_list)
% reverce(list,
reverce(X,Y):- reverce(X,[],Y).
reverce([],Y,Y):-!.
reverce([X|Y],Z,T):-reverce(Y,[X|Z],T).

% isBegin(list0,list1)
% true if list0 is begining of list1
isBegin([],_):-!.
isBegin([X|Y],[X|Z]):-isBegin(Y,Z).

% sublist(list0,list1)
%  true if list1 is sublist of list0
sublist(X,Y):-isBegin(X,Y),!.
sublist(X,[_|T]):-sublist(X,T).

% delete all items in list
%  delete(list,item,newList)
cdelete([],_,[]):-!.
% if elelem and head same - don't modify res
cdelete([Head|Tail],Head,Res):-cdelete(Tail,Head,Res),!.
% else
cdelete([Head|Tail],Elem,[Head|TailRes]):-cdelete(Tail,Elem,TailRes).

% append(first,second,result)
cappend([],X,X):-!.
cappend([Head|Tail],Sec,[Head|NewTail]):-cappend(Tail,Sec,NewTail).

% clength(list,res)
clength([],0):-!.
clength([_|T],N):-clength(T,N1),N is N1 + 1.

% hasRepead(list) true if list have repeted element
hasRepead([]):-fail,!.
hasRepead([H|T]):-isMember(H,T),!.
hasRepead([_|T]):-hasRepead(T).

% mergeSortedLists(list1,list2,res) res sorted union of list1 and list 2
mergeSortedLists([],X,X):-!.
mergeSortedLists([H1|T1],[H2|T2],[H1|Tres]):-H1 < H2,!,mergeSortedLists(T1,[H2|T2],Tres).
mergeSortedLists(List1,[H2|T2],[H2|Tres]):-mergeSortedLists(T2,List1,Tres).

% Two same elements consistenly
hasConsRep(X):-cappend(_,[Y,Y|_],X),!.

