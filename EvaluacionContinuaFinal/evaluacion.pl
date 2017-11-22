%Primer ejercicio
sumaAcumulada(X,R):-sumaAcumulada(X,0,R).
sumaAcumulada([],sum,[]).
sumaAcumulada([H|T],sum,[H1|T1]):-H1 is H + sum, sumaAcumulada(T,H1,T1).


%Problema 2Predicado que recibe una lista de números y que devuelve la lista ordenada de menor a mayor (implementa MERGE SORT) Edgar
listh(_, 0, []).
listh([H|T], N, [H|Sub]) :- N1 is N-1, listh(T, N1, Sub).

listt(T, 0, T).
listt([_|T], N, R) :- N1 is N-1, listt(T, N1, R).

merge(A, [], A).
merge([], B, B).
merge([Ha|Ta], [Hb|Tb], [Ha|Sub]) :- Ha < Hb, merge(Ta, [Hb|Tb], Sub).

merge([Ha|Ta], [Hb|Tb], [Hb|Sub]) :- Ha >= Hb, merge([Ha|Ta], Tb, Sub).

mergesort([H], [H]).
mergesort(List, Sorted) :-
			listh(List, Half, H),
			listt(List, Half, T),
			mergesort(H, A),
			mergesort(T, B),
			merge(A, B, Sorted).

test(Sorted) :- mergesort([10, 9, 8, 4, 5, 6, 7, 3, 2, 1], Sorted).


/*Ejercicio3 Predicado que reciba dos listas, una lista de enteros a insertar y una lista ordenada de enteros.
El predicado deberá insertar los números de la primera lista en la segunda lista (en el lugar que les corresponda)*/

insSort(List, [], List).
insSort(List, [H|T], R):-
    insert(List, H, B),
    insSort(B, T, R).
insert(List, Num, A):- separa(Num, List, L, R),
                        append(L,[Num],B),
                        append(B,R,A).
separa(N, [H|T], [H|L], R):-
    H =< N,
    separa(N, T, L, R).
separa(N, [H|T], L, [H|R]):-
    H > N,
    separa(N, T, L, R).
separa(N, [], [], []).


/*Ejercicio4 */
subset(_,[]).
subset([X|Y],[X|XS]) :- subset(Y,Z).
subset([_|Y],[X|Z]) :- subset(Y,[X|Z]).

/*Ejercicio5*/
enteroDivisible(Result) :- enteroDivisible(1, 1, Result).
enteroDivisible(Start, 21, Result):- Result = Start, !.

enteroDivisible(Start, Div, Result):- X is Start mod Div,
    ( X == 0 ->
      D is Div + 1,
      enteroDivisible(Start, D, Result);
      S is Start + 1,
      enteroDivisible(S, 1, Result)
     ).



/*Ejercicio6*/
checkPrime(X) :- X > 1,
              succ(X0, X),\+ (between(2, X0, N), 0 is X mod N).

checkCountPrime(Counter, PrimeNum, Res):- Counter =:= 10000, Res is PrimeNum.
checkCountPrime(Counter, PrimeNum, Res):- NumVar is (PrimeNum + 1),
                                          checkPrime(NumVar),
                                          Z is (Counter + 1),
                                          checkCountPrime(Z, NumVar, Res).
checkCountPrime(Counter, PrimeNum, Res):- NumVar is (PrimeNum + 1),
                                          checkCountPrime(Counter, NumVar, Res).
                                          checkLastPrime(N,PRIME,COUNT)).




/*Ejercicio7*/
isPalindrome(Num):- number_chars(Num, X), reverse(X, Res), X == Res.

mult(Counter, X, Max, Res):- Counter =:= 999, Res is Max.
mult(Counter, X, Max, Res):- MultRes is (Counter * X), Z is (Counter + 1),
                          isPalindrome(MultRes), (MultRes > Max -> MaxRes is MultRes; MaxRes is Max),
                          mult(Z, X, MaxRes, Res).
mult(Counter, X, Max, Res):- Z is (Counter + 1),
                          mult(Z, X, Max, Res).

palindrome(Num1, Max, ResPal):- Num1 =:= 999, ResPal is Max.
palindrome(Num1, Max, ResPal):- Z is (Num1 + 1),
                          mult(100, Num1, Max, Res),
                          (Res > Max -> MaxRes is Res; MaxRes is Max),
                          palindrome(Z, MaxRes, ResPal).

/*Ejercicio8*/
t(_,nil,nil).
t(,,nil).
t(,nil,).
t(,,_).
% T1 = t(8,t(4,t(2,nil,nil),nil),nil).

% encuentra el mayor
mayorNum([], V, V).
mayorNum([H|T], V, R) :- H>V -> mayorNum(T, H, R) ; mayorNum(T, V, R).
mayorN([H|T], M) :- mayorNum(T, H, M).

% encuentra el menor
menorNum([], V, V).
menorNum([H|T], V, R) :- H<V -> menorNum(T, H, R) ; menorNum(T, V, R).
menorN([H|T], M) :- menorNum(T, H, M).

% obtiene los numeros del arbol en una lista
nodes(nil,[]).
nodes(t(_,nil,nil),[]) :- !.
nodes(t(X,L,R),[X|S]) :- nodes(L,SL), nodes(R,SR), append(SL,SR,S).

% 8. c)
mayorNode(T,Ma) :- nodes(T,S), mayorN(S,Ma).

% 8. d)
menorNode(T,Me) :- nodes(T,S), menorN(S,Me).

copyTree(T,T).
t(_,nil,nil).
t(_,_,nil).
t(_,nil,_).
t(_,_,_).

% 8.a
inTree(V, t(N,L,R) ):- V<N -> inTree(V,L) ;
					   V>N -> inTree(V,R) ; !.

%(F es el arbol final)
insertTT(_,nil,F,F).
insertTT(V,t(N,L,R),Res,F) :- V<N->insertTT(V,L,t(N,Res,R),F);
								   insertTT(V,R,t(N,L,Res),F).
%% 8.b
insertToTree(V,T,Res) :- inTree(V,T)->copyTree(T,Res)
									 ;insertTT(V,T,t(V,nil,nil),Res).
