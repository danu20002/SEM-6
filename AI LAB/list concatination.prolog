combine(List1,List2,CombinedList):-
combine1(List1,List2,List), %Return List with items not in List2
append(List,List2,AppendedList), %Join List and List2
sort(AppendedList,CombinedList). %Sort the final List

combine1([],_,[]).
combine1([H|T],List2,[H|L]):-
    \+member(H,List2),
    combine1(T,List2,L).
combine1([H|T],List2,L):-
    member(H,List2),
    combine1(T,List2,L).
