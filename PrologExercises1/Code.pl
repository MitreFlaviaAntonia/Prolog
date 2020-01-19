
%-------first exercise-------

% it exists a direct train from craiova to bucharest
direct_train(craiova, bucharest).
direct_train(sibiu, craiova).
direct_train(deva, sibiu).
direct_train(brasov, deva).
direct_train(pitesti, brasov).
direct_train(ploiesti, pitesti).
direct_train(constanta, ploiesti).

/* you can travel from a city to another if there exists a direct train
from the first city to the second city*/

travel(X, Y) :- direct_train(X, Y).

/* you can also travel from a city to another if you can travel from the 
 * source city (X) to a second city (Y) and there exists a direct train from the 
 * second city (Y) to the destination city (Z)*/

travel(X, Z) :- direct_train(Y, Z), travel(X, Y).

%-------second exercise-------

%translates "unu" into "one"
translate(unu, one).
translate(doi, two).
translate(trei, three).
translate(patru, four).
translate(cinci, five).
translate(sase, six).
translate(sapte, seven).
translate(opt, eight).
translate(noua, nine).

% translates a list into another list
translate([],[]).

translate([X|Ro],[Y|Engl]):-
    translate(X, Y),
    translate(Ro,Engl).

% the result of translate(unu,X) is X = one
% the result of translate(unu,one) is true
% the result of translate([unu],X) is X = [one]
% the result of translate([unu,doi,cinci],X) is X = [one, two, five]  
% the result of translate([unu,doi,cinci],[one, two, five]) is true
% the result of translate([unu,doi,cinci],[one, two, four]) is false

%-------third exercise-------

% multiplicates the only element from a list one time

multiplicate_numbers([A], 1, [A]) :- !.

% multiplicates the only element from a list N-1 times

multiplicate_numbers([A], N, [A|X]) :-
        P is N - 1,
        P > 0,
        multiplicate_numbers([A], P, X).

% multiplicates all the elements from a list N-1 times

multiplicate_numbers([A|E], N, X) :-
      multiplicate_numbers([A], N, Y),
      multiplicate_numbers(E, N, Z),
      !, append(Y, Z, X).

%-------fourth exercise-------

% inserts a number in a list at position 1
insert_number_at_pos(Number, List, 1, [Number|List]).

% inserts a number in a list at position Position - 1
insert_number_at_pos(Number, [Head|Tail], Position, [Head|Result]) :-
        Position1 is Position - 1,
        insert_number_at_pos(Number, Tail, Position1, Result).

% the result of insert_number_at_pos(6,[1,2,3],2,X) is X = [1, 6, 2, 3]
% the result of insert_number_at_pos(6,[1,2,3],1,R) is R = [6, 1, 2, 3]

%-------fifth exercise-------

range(Number, Number, [Number]) :- !.
range(Number, X, [Number|P]) :-
        Number1 is Number + 1,
        range(Number1, X, P).

% the result for range(1,1,X) is X=[1]
% the result for range(1,7,X) is X = [1, 2, 3, 4, 5, 6, 7]
% the result for range(1,7,[1, 2, 3, 4, 5, 6, 7]) is true


