% Problema 1. Elabore una regla que recibe una lista en su primer
% argumento y, en su segundo argumento, reporte la cantidad de elementos
% que contiene.

longitud_lista([],0):- !.

longitud_lista([_|Col],N):-
    longitud_lista(Col,N1),
    is(N,+(N1,1)).



% Problema 2. Elabore una regla que recibe una lista en su primer
% argumento, un elemento a buscar en su segundo argumento y, en su
% tercer argumento, reporte la cantidad de veces que se repite el
% elemento.

contar_ocurrencias([],_,0):- !.

contar_ocurrencias([Cab|Col],E,C):-
    contar_ocurrencias(Col,E,C1),
    (
        ==(Cab,E),is(C,+(C1,1)),!
        ;
        \==(Cab,E),is(C,C1)
    ).



% Problema 3.Dada una lista de números enteros, elabore una regla que realice la suma de los miembros de la lista. La regla debe ser de aridad 2.

sumar_enteros([],0):- !.

sumar_enteros([Cab|Col], Sum):-
    sumar_enteros(Col,Sum1),
    is(Sum,+(Sum1,Cab)).



% Problema 4. Elabore una variante del problema anterior que considere
% que algunos elementos no serán enteros. En este caso, estos no deberán
% sumarse. [1,2,a,3,4]

sumar_solo_enteros([],0):- !.

sumar_solo_enteros([Cab|Col],Sum):-
    integer(Cab),
    sumar_solo_enteros(Col,Sum1),
    is(Sum,+(Sum1,Cab)),!.

sumar_solo_enteros([_|Col],Sum):-
    sumar_solo_enteros(Col,Sum).


% Problema 5.Busqueda de la posicion del elemento en la lista

posicion_elemento(L,E):-
    pos(L,E,1,P),
    (
        >(P,0),
        write("El elemento "),
        write(E),
        write(" se encuentre en la posicion "),
        writeln(P),!
        ;
        write("El elemento "),
        write(E),
        writeln(" no se encuentra en la lista")
    ).

pos([],_,_,0):- !.

pos([E|_],E,Cont,Cont):- !.

pos([_|Col],E,Cont,P):-
    is(Cont1,+(Cont,1)),
    pos(Col,E,Cont1,P).
