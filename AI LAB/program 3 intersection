intersection([X|Y],M,[X|Z]):-list-member(X,M),intersection(Y,M,Z).
intersection([X|Y],M,Z):- \+list-member(X,M),intersection(Y,M,Z).
intersection([],M,[]).
list-member(X,[X|_]).
list-member(X,[_|TAIL]):-list-member(X,TAIL).
