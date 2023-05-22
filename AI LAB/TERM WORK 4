% Helper predicates
concatenate([], L, L).
concatenate([H|T], L, [H|R]) :-
    concatenate(T, L, R).

add_element(X, L, [X|L]).

delete_element(_, [], []).
delete_element(X, [X|T], T).
delete_element(X, [H|T], [H|R]) :-
    X \= H,
    delete_element(X, T, R).

permute([], []).
permute([H|T], R) :-
    permute(T, X),
    select(H, R, X).

% Menu-driven functions
menu :-
    write('MENU'), nl,
    write('1. Concatenate lists'), nl,
    write('2. Add element'), nl,
    write('3. Delete element'), nl,
    write('4. Permute list'), nl,
    write('5. Quit'), nl,
    write('Enter the number of your choice: '),
    read(Choice),
    process(Choice).

process(1) :-
    write('Enter first list: '),
    read(L1),
    write('Enter second list: '),
    read(L2),
    concatenate(L1, L2, Result),
    write('Concatenated list: '),
    write(Result), nl,
    menu.
process(2) :-
    write('Enter an element: '),
    read(X),
    write('Enter a list: '),
    read(L),
    add_element(X, L, Result),
    write('List after adding element: '),
    write(Result), nl,
    menu.
process(3) :-
    write('Enter an element: '),
    read(X),
    write('Enter a list: '),
    read(L),
    delete_element(X, L, Result),
    write('List after deleting element: '),
    write(Result), nl,
    menu.
process(4) :-
    write('Enter a list: '),
    read(L),
    findall(X, permute(L, X), Results),
    write('Permutations: '), nl,
    maplist(writeln, Results),
    menu.
process(5) :-
    write('Goodbye!'), nl.

% Main predicate
main :-
    menu.
