%yours
great_grand_parent(A,D):- child(D,M), child(M,G), child(G,A). 
%Q1
mother(M,C):-child(C,M), female(M).
grand_parent(GP,GC):-child(F,GP), child(GC,F).
great_grand_mother(GGM,GGC):-female(GGM), child(GGC, F), child(F,T), child(T,GGM).

%Q2
sibling(A,B):-child(A,F), child(B,F), \+ A=B.
brother(B,Sib):-male(B), child(B,M), child(Sib,M), \+ B=Sib.
sister(S,Sib):-female(S), child(S,M), child(Sib,M), \+ S=Sib.

%Q3 --
%You have to know both parents for both siblings for half_sibling
half_sibling(S1,S2):-child(S1,F), child(S1,M), child(S2,G), child(S2,M), \+ F=G, \+ F=M, \+ M=G, \+ S1=S2.

full_sibling(S1,S2):-child(S1,F), child(S2,F), child(S1,M), child(S2,M), \+ S1=S2, \+ F=M.

%Q4
first_cousin(C1,C2):-child(C1,D), child(D,G), child(C2,U), child(U,G), \+ G=D, \+ D=U, \+ C1 = C2.

second_cousin(C1,C2):-child(C1,M), child(M,G), child(G,Q), child(C2,M1), child(M1,G1), child(G1,Q), \+ C1=C2, \+ G=G1, \+ M=M1.

%Q5
half_first_cousin(C1,C2):-child(C1,M), child(M,GL), child(M,GI), child(C2,M1), child(M1,GI), child(M1,GB), \+ GL = GI, \+ GI = GB, \+ GL = GB, \+ M = M1, \+ C1 = C2.

double_first_cousin(C1,C2):-child(C1, S1), child(S1,G2), child(S1, G1), child(C1,D1), child(D1, G3), child(D1, G4), child(C2, S2), child(S2, G1), child(S2, G2), child(C2,D2), child(D2, G3), child(D2, G4),
\+ G1=G3, \+  G1 = G4, \+ G2=G3, \+ G2=G4, \+ S1=S2, \+ D1=D2, \+ C1=C2.

%Q6
first_cousin_twice_removed(C1,C2):-(first_cousin(C1,D), grand_parent(D,C2)) ; (first_cousin(C2,D), grand_parent(D,C1)).

%Q7
descendant(D,A):-parent(A,D);grand_parent(A,D);(grand_parent(A,GP), parent(GP,D));(grand_parent(A,GP1),grand_parent(GP1,D)).

ancestor(A,D):-descendant(D,A).

%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X, Y):- (first_cousin(X,Y)) ; (second_cousin(X,Y)).

%Q9
%do not return anything for closest_common_ancestor(X,X,A).
closest_common_ancestor(R1,R2,A):-ancestor(A,R1), ancestor(A,R2), \+R1=R2, \+ (child(X,A), ancestor(X,R1),ancestor(X,R2)).

% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one should print nothing
%   (make sure this does not fail (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):- true.
