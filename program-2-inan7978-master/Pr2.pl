% you need to replace, e.g., "D='fix this'" with a valid query.

%Did Leonardo DiCaprio act in Babel?
q1 :- acted_in('Leonardo DiCaprio', 'Babel').

%Who directed District 9?
q2(D) :- directed(D, 'District 9') .

%Did anyone act in Both Click and The Aviator
q3(A) :- acted_in(A, 'Click'), acted_in(A, 'The Aviator').

%Was there a move released in 2010 that did not star Jennifer Aniston?
q4(M):-  released(M, 2010), \+ acted_in('Jennifer Aniston', M).

%Who directed movies released in 2009? (don't worry about ; part)
q5(D):-  released(X, 2009), directed(D, X).

%Has anyone directed more than one movie?
q6(D) :- directed(D, X), directed(D, S), \+ S = X.

%Does any movie have more than one director?
q7(M) :- directed(S, M), directed(Z, M), \+ S = Z.

%Has anyone acted in more than one movie released in 2008?
q8(A) :- acted_in(A, X), released(X, 2008), acted_in(A,Z), released(Z,2008), \+ X=Z.

%Has anyone acted in more than two movies in the same year?
q9(A) :- acted_in(A, X), released(X, F), acted_in(A,Z), released(Z,F), acted_in(A, Y),
released(Y,F), \+ X=Z, \+ X=Y, \+ Y=Z.

%Who has worked with the same director in different years?
q10(A) :- acted_in(A, X), directed(D, X), acted_in(A, Y), directed(D,Y), \+ X = Y,
released(X, O), released(Y, J), \+ O = J.


