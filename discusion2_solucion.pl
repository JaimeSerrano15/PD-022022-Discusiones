% Problema 1. Letra en pantalla

escribir_letra(N):-
    =<(N,0),
    writeln("Debe ingresar un numero mayor a 0"),!,fail.

escribir_letra(N):-
    write("Digite la letra a repetir: "),
    read(L),
    escribir(N,L).


escribir(_,L):-
    not(is_alpha(L)),
    writeln("Debe digital una letra"),!,fail.

escribir(0,_):- !.
escribir(N,L):-
    >(N,0),
    writeln(L),
    is(N1,-(N,1)),
    escribir(N1,L).


% Problema 2. Etapas de Fabricacion

paso(1,medicion).
paso(2,corte).
paso(3,moldeado).
paso(4,pulido).
paso(5,montaje).
paso(6,empacado).
paso(7,almacenaje).

proxima_etapa(X):-
    not(number(X)),
    writeln("Se debe de ingresar un valor numerico"),!,fail.

proxima_etapa(X):-
    number(X),
    (<(X,0);>(X,7)),
    writeln("El valor ingresado debe de estar entre 0 y 7"),!,fail.

proxima_etapa(X):-
    number(X),
    >=(X,0),
    =<(X,7),
    is(Sig,+(X,1)),
    etapas_restantes(Sig).

etapas_restantes(S):-
    not(paso(S,_)),
    writeln("Se ha terminado el proceso"),!.

etapas_restantes(S):-
    paso(S,M),
    writeln(M),
    is(NewSig,+(S,1)),
    etapas_restantes(NewSig).

% Problema 3. Invertir digitos

invierte_digitos(N,M):-
    number(N),
    invertir(N,0,M).

invertir(0,M,M):- !.
invertir(N,I,M):-
    >(N,0),
    is(C,//(N,10)),
    is(I1,+(*(I,10),mod(N,10))),
    invertir(C,I1,M).


% Problema 4. Euclides

euclides(N,0,N):- !.
euclides(N,M,X):-
    is(R,mod(N,M)),
    euclides(M,R,X).
