famoso(pedro).
hombre(juan).
hombre(pedro).
hombre(pablo).
hombre(rodrigo).

padre(pedro, juan).
padre(roberto, pedro).
padre(simon, roberto).
padre(manuel, simon).
padre(manuel, doroteo).

ancestro(X, Y) :- padre(X, Y).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).


ancestro(X, Y) :- padre(X, Y), write(X, Y), !.
ancestro(X, Y) :- ancestro(X, Z), ancestro(Z, Y).


feliz(X) :- write(X), hombre(X), write(X), famoso(X), write(X).

/*Tamaño de una lista*/
elementosLista([], Cont, Cont).
elementosLista([_|T], Cont, X) :- Z is Cont + 1, elementosLista(T, Z, X).
cuenta(Lista, X) :- elementosLista(Lista, 0, X).

/*Comparacion de dos listas, tamaño, elememnto */

/*sameList(Lista, ListB):-cuenta(Lista, X), cuenta(ListB, Y), X=:=Y.*/

sameList([][]).
sameList([H|T],[H1|T1]):-H=:=H1, sameList(T, T1).


/*Funcion append en una lista*/
split(A, X, Y) :- append(X, Y, A), length(X, A), length(Y, B), A =:=B, !.

/*Maximo de una lista*/
arrLista([], A, B) :- A is B
arrLista([H|T], A, B) :- H > A, arrLista(T, H, B)
arrLista([H|T],A, B):- H =< A, arrLista(T, A, B)











































































l
