studies(kirti,ai).
studies(rohit,ai).
studies(geeta,ds).
studies(jhon,nt).
teaches(sgs,ai).
teaches(rjk,nt).
teaches(rjk,pa).
teaches(sdp,ds).






del(X,[X|T],T).
del(X,[H|T],[H|T1]):-del(X,T,T1).





listmember(X,[X|_]).
listmember(X,[_|Tall]):-listmember(X,Tall).
