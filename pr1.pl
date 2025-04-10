:- initialization(main).

main :-
    write('Введите натуральное число: '), flush_output(current_output),
    read(N),
    nl,
    process(N, 0, Steps),
    format('Общее количество шагов: ~w~n~n', [Steps]),
    main.

% Базовый случай: число стало 0 — завершить и вернуть количество шагов
process(0, Steps, Steps) :- !.

% Рекурсивный случай: вычесть сумму цифр, увеличить счётчик
process(N, Acc, Steps) :-
    sum_digits(N, Sum),
    NewN is N - Sum,
    format('~w - сумма цифр (~w) = ~w~n', [N, Sum, NewN]),
    Acc1 is Acc + 1,
    process(NewN, Acc1, Steps).

% Рекурсивный подсчёт суммы цифр
sum_digits(N, Sum) :-
    N < 10, Sum is N, !.

sum_digits(N, Sum) :-
    Digit is N mod 10,
    Rest is N // 10,
    sum_digits(Rest, RestSum),
    Sum is Digit + RestSum.

