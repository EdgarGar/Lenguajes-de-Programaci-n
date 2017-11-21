%Ejemplo1
myappend1(A, B, B, A).
%myappend([1, 2, 3|X], X,[4, 5],Y).

%Ejemplo2
myappend2(A-B, B, A).
%myappend2([1, 2, 3| X]-X, [5, 6], Y).

%Ejemplo3
myappend3(A-B, B-C, A-C).
%myappend3([1, 2, 3|X]-X, [4, 5|Y]-Y, Z).

%Ejemplo4
myappend4(A, B, B, A).
%myappend4([1, 2, 3], X,[5, 6|Y], Y]).

%Ejemplo5
%assert(edad(pedro, 15)).
%assert(joven(pedro)).
%assert((joven(X) :- edad(X, Y), Z is 18, Y<Z)).
%Eliminacion de la base de datos
%retract(edad(pedro, 15)).

%Ejemplo6 Predicado que suma y eleva al cuadrado 2#'s
:-dynamic tabla/3.
sumpot(X, Y, Z):-tabla(X, Y, Z), !.
sumpot(X, Y, Z):-Z is (X+Y)*(X+Y), asssert(tabla(X,Y,Z)).

%--------------------------Evaluacion------------------------
%Predicado que devuelve si un # es circulas primo
%X va ser mi Numero
primocircular(N, VA, CONT) :=
                      CONT =:= 3 esprimo(N).
primocircular(N, VA, CONT) :=
                      CONT > 4, numbera_char(VA, R).

%funcion que dice que numero es primo
divisible(X, Y) :- Y < X,
                  X mod Y is 0,
                  Y1 is Y+1,
                  divisible(X, Y1).
esprimo(X) :- integer(X),
              X > 1,
              \+ divisible(X, 2).
