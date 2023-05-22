union([X|Y],Z,W):-list-member(X,Z),union(Y,Z,W).
union([X|Y],Z,[X|W]):- \+list-member(X,Z),union(Y,Z,W).
union([],Z,Z).
list-member(X,[X|_]).
list-member(X,[_|TAIL]):-list-member(X,TAIL).
