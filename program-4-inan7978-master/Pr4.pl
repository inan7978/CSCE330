
%For all of these, especially the first two, see the examples in the book
%Ignore the Singleton variable warning, that goes away when you 
% define the rules. 

%europe map coloring problem -- use these colors as the domain
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):-color(Fr), color(Sw), color(It), color(Be), color(Ho), color(Ge), color(Au),
\+ Fr=Ge, \+ Fr=Sw, \+ Fr=Be, \+ Sw=Ge, \+ Sw=Au, \+ It = Fr, \+ It = Sw, \+ It = Au, \+ Be = Ho, \+ Be = Ge, \+ Be = Fr, \+ Ho=Ge, \+ Ge = Au, \+ Ge = Sw.


unique_digits(C,R,O,S,A,D,N,G,E):-
dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
\+ C=R, \+ C=O, \+ C=S, \+ C=A, \+ C=D, \+ C=N, \+ C=G, \+ C=E,
\+ R=O, \+ R=S, \+ R=A, \+ R=D, \+ R=N, \+ R=G, \+ R=E,
\+ O=S, \+ O=A, \+ O=D, \+ O=N, \+ O=G, \+ O=E,
\+ S=A, \+ S=D, \+ S=N, \+ S=G, \+ S=E,
\+ A=D, \+ A=N, \+ A=G, \+ A=E,
\+ D=N, \+ D=G, \+ D=E,
\+ N=G, \+ N=E,
\+ G=E.


cryptarithmetic(C,R,O,S,A,D,N,G,E):-
dig(S),
R is (S+S) mod 10, C1 is (S+S) // 10,
dig(S), dig(D),
E is (S+D+C1) mod 10, C10 is (S+D+C1) // 10,
dig(O), dig(A),
G is (O+A+C10) mod 10, C100 is (O+A+C10) // 10,
dig(R), dig(O),
N is (R+O+C100) mod 10, C1000 is (R+O+C100) // 10,
dig(C), C > 0, dig(R), R > 0,
A is (C+R+C1000) mod 10, D is (C+R+C1000) // 10,
unique_digits(C,R,O,S,A,D,N,G,E).





%Persons are just their names, lower case
who_ordered_pizza(PizzaPerson):- true.
