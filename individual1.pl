% Список всех простых делителей числа
prime_divider_list(X,Res):-prime_divider_list(X,Res,2).
prime_divider_list(X,[X],X):-!.
prime_divider_list(X,[I|T],I):- Mod is X mod I,Mod = 0,!,New_x is X div I,prime_divider_list(New_x,T,I).
prime_divider_list(X,Res,I):- I1 is I + 1,prime_divider_list(X,Res,I1).

%Есть 4 боксера Томас, Герберт, Френсис, Джеймс
stronger(gerbert,tomas).
stronger(frensis,tomas).
stronger(frensis,gerbert).
stronger(james,gerbert).
%stronger(gerbert,frensis).
clog_stronger(X,Y):-stronger(X,Y).
clog_stronger(X,Y):-stronger(X,Z),clog_stronger(Z,Y).

%ыбалке. Какие предметы преподает каждый учитель?

% 8. Есть четыре боксера: Томас Герберт, Герберт Френсис, Френсис Джеймс
% и Джеймс Томас.
%Герберт намного сильнее Томаса.
%Френсис сильнее и Томаса и Герберта.
%Герберт слабее Джеймса, но сильнее Френсиса.
%В каком
% порядке нужно расположить боксеров от слабейшего к сильнейшему?
the_strongest(X):-clog_stronger(X,_),not(clog_stronger(_,X)).

boxer_ranging([H|T]):-clog_stronger(_,H),not(clog_stronger(H,_)),!,the_strongest(To),boxer_ranging(T,H,To,[H]).
boxer_ranging([H|T],From,To,Visited):-
    % H сильнее всех из
    stronger(H,From),not(member(H,Visited)),boxer_ranging(T,H,To,[H|Visited]).
boxer_ranging(From,From,To,_):-stronger(To,From).
%

% X Most powerful
  %  is_stronger(X,_),not(is_stronger(_,X)).
% boxer_ranging([H|T],Pred):-is_stronger(H,Pred),H \=
% Pred,!,boxer_ranging(T,H).
%boxer_ranging([X],Pred):-!.
%boxer_ranging(X,Pred):-is_stronger(X,_),not(is_stronger(_,X)).

