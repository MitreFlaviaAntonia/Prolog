direct_train(craiova, bucharest).
direct_train(sibiu, craiova).
direct_train(deva, sibiu).
direct_train(brasov, deva).
direct_train(pitesti, brasov).
direct_train(ploiesti, pitesti).
direct_train(constanta, ploiesti).
connected(X, Y) :- direct_train(X, Y).
travel(X, Y) :- connected(X, Y).
travel(X, Z) :- connected(Y, Z), travel(X, Y).