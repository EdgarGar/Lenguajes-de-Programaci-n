/*Funcion que reciebe
  -numero-Lista
  -Lista de #'s'
  Devuelve dos listas [menores][mayores]*/

  mayorMenor([], Numero , Menor, Mayor, ResMayor, ResMenor).
  mayorMenor([H|T], Numero, Menor, Mayor, ResMenor, ResMayor) :- H > Numero, append([H], Mayor, A), mayorMenor(T, Numero , Menor, A, ResMayor, ResMenor).
  mayorMenor([H|T], Numero, Menor, Mayor, ResMenor, ResMayor) :- H < Numero, append([H], Menor, B), mayorMenor(T, Numero, B, Mayor, ResMayor, ResMenor).
  mayorMenor([H|T], Numero, Menor, Mayor, ResMenor, ResMayor) :- H =:= Numero , mayorMenor(T, Numero, ResMayor, ResMenor, Mayor, Menor).




quick([H|T], Sol) :- split(H, T, [], [], L, R),
                      quick()
