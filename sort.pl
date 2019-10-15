% change first occurence A > B or false
swap([A,B|Tail],[B,A|Tail]):-B < A,!.
swap([H|T],[H|New_t]):-swap(T,New_t).

sortbub(Q,W):-swap(Q,X),!,sortbub(X,W).
sortbub(X,X):-!.

sortSplit([],P,[],[]):-!.
sortSplit([H|T],P,[H|Less],More):-H < P,!,sortSplit(T,P,Less,More).
sortSplit([H|T],P,Less,[H|More]):-sortSplit(T,P,Less,More).
myAppend([],L,L):-!.
myAppend([H|T],L,[H|New_T]):-myAppend(T,L,New_T).
sortHuar([],[]):-!.
%sortHuar([A,B],[B,A]):-B<A,!.
sortHuar([H|T],Res):-sortSplit(T,H,Less,More),sortHuar(Less,Sort_less),sortHuar(More,Sort_more),
    myAppend(Sort_less,[H|Sort_more],Res).





















































