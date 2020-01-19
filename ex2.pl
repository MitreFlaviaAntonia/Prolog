translate(unu, one).
translate(doi, two).
translate(trei, three).
translate(patru, four).
translate(cinci, five).
translate(sase, six).
translate(sapte, seven).
translate(opt, eight).
translate(noua, nine).
list_w([],[]).

list_w([X|Ro],[Y|Engl]):-
    translate(X, Y),
    list_w(Ro,Engl).