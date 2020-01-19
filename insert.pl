insert_at_pos(Number, List, 1, [Number|List]).
insert_at_pos(Number, [Head|Tail], Position, [Head|Result]) :-
        Position1 is Position - 1,
        insert_at_pos(Number, Tail, Position1, Result).