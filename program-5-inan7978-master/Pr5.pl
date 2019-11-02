%consider pattern matching and head-tail notation for these

elem([],0).
elem([H|T],X):-elem(T,N),X is N+1.

exactly3(L):- lists(L), L=[X,Y,Z].

at_least_3(L):- elem(L,N), N>=3.

at_most_3(L):- lists(L), L=[]; lists(L), L=[A]; lists(L), L=[B,C]; lists(L), L=[D,E,F].


intersect(L1,L2):-member(X,L1), member(X,L2).

all_intersect(ListofLists,L):-ListofLists = [X|Z], intersect(X,L), all_intersect(Z,L).
all_intersect(ListofLists,_) :- ListofLists = [].



dependsOn(X,Y,Z) :- member([Y,A],X), member(Z,A).
doesntDependOn(X, Y) :- \+ dependsOn(X, _, Y).

removeGraphNode([ [X,_] | Y], X, Y).
removeGraphNode([ [X,Y] | T], Z, R) :- \+ X=Z,removeGraphNode( T, Z, Q), append([[X,Y]], Q, R).

source_removal([], []).
source_removal(G,Toposort):-member([X,_], G), doesntDependOn(G,X), removeGraphNode(G,X,S), 
source_removal(S, TopoSort2), append([X], TopoSort2, AppendResult), Toposort = AppendResult.