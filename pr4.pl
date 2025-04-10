:- initialization(main).

% Главный запуск: найти все допустимые конфигурации
main :-
    findall([A, B, C, D], guilty_set(A, B, C, D), Results),
    print_results(Results).

% Печать результата
print_results([]) :-
    write('Больше нет допустимых конфигураций'), nl.
print_results([[A,B,C,D]|T]) :-
    write('Нарушители: '), nl,
    (A = true -> write('- Антипов нарушил'), nl ; write('- Антипов не нарушил'), nl),
    (B = true -> write('- Борисов нарушил'), nl ; write('- Борисов не нарушил'), nl),
    (C = true -> write('- Цветков нарушил'), nl ; write('- Цветков не нарушил'), nl),
    (D = true -> write('- Дмитриев нарушил'), nl ; write('- Дмитриев не нарушил'), nl),
    nl,
    print_results(T).

% Все логические условия из задачи
guilty_set(A, B, C, D) :-
    member(A, [true, false]),
    member(B, [true, false]),
    member(C, [true, false]),
    member(D, [true, false]),

    % 1) Если A нарушил — то B тоже нарушил
    (A = true -> B = true ; true),

    % 2) Если B нарушил — то C нарушил или A не нарушил
    (B = true -> (C = true ; A = false) ; true),

    % 3) Если D не нарушил — то A нарушил и C не нарушил
    (D = false -> (A = true, C = false) ; true),

    % 4) Если D нарушил — то A тоже нарушил
    (D = true -> A = true ; true).
