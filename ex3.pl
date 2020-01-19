multiplicate_numbers([A], 1, [A]) :- !.
multiplicate_numbers([A], N, [A|X]) :-
        P is N - 1,
        P > 0,
        multiplicate_numbers([A], P, X).
multiplicate_numbers([A|E], N, X) :-
      multiplicate_numbers([A], N, Y),
      multiplicate_numbers(E, N, Z),
      !, append(Y, Z, X).
