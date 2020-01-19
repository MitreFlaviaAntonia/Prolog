range(Number, Number, [Number]) :- !.
range(Number, X, [Number|P]) :-
        Number1 is Number + 1,
        range(Number1, X, P).