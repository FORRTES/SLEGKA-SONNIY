:- initialization(main).

main :-
    write('Введите первое множество (например, [1,2,3]): '),
    read(Set1),
    write('Введите второе множество (например, [2,3,4]): '),
    read(Set2),
    intersection(Set1, Set2, Result),
    format('Пересечение множеств: ~w~n~n', [Result]),
    main.

% пересечение двух множеств
intersection([], _, []).

intersection([Head|Tail], Set2, [Head|Result]) :-
    member(Head, Set2),
    intersection(Tail, Set2, Result).

intersection([Head|Tail], Set2, Result) :-
    \+ member(Head, Set2),
    intersection(Tail, Set2, Result).
