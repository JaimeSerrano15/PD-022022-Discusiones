% Discusion #5 - Viernes 7 de Octubre 2022

% Solucion de la Tarea 2
% Invertir un arbol binario

invertir_arbol([SubIzq,Nodo,SubDer],[SubDerInv,Nodo,SubIzqInv]):-
    invertir_arbol(SubIzq,SubIzqInv),
    invertir_arbol(SubDer,SubDerInv).

invertir_arbol([],[]):- !.

% Viaje al Tunco
%Cinco amigos estaban desesperados por ir a celebrar el fin de exámenes al Tunco.
%Acordaron que, después del último examen, saldrían volando a la playa, sin esperar a
%nadie que se tardara.
%El día del último examen, el primero en terminarlo fue Chico,
%Paco salió después de Pancho,
%Chepe no fue al paseo
%y José salió inmediatamente antes de
%Paco. ¿En que orden salieron?

examen_finalizado([X,2],[_,[X,2],_,_,_]).
examen_finalizado([X,3],[_,_,[X,3],_,_]).
examen_finalizado([X,4],[_,_,_,[X,4],_]).

orderSalida(Orden):-
    =(Orden,[_,_,_,_,_]),
    =(Orden,[[chico,1]|_]),
    examen_finalizado([paco,OrdenPaco],Orden),
    examen_finalizado([pancho,OrdenPancho],Orden),
    >(OrdenPaco,OrdenPancho),
    last(Orden,[chepe,5]),
    examen_finalizado([jose,OrdenJose],Orden),
    succ(OrdenJose,OrdenPaco),!.

% Derivadas

% Derivada de la forma X
d(X,X,1):- atom(X),not(number(X)),!.

% Derivada de la una constante
d(X,C,0):- atom(X), not(number(X)), number(C), !.

% Derivada de una constante por X (C*X)
d(X,C*X,C):- atom(X), not(number(X)), number(C), !.

% Derivada de log(X)
d(X,log(X),1/X):- atom(X), not(number(X)), !.

% Derivada de un numero elevado a la X (A^X)
d(X,A^X,A^X*log(A)):- atom(X), not(number(X)), number(A), !.

% Derivada de la forma X^N
d(X,X^N,N*(X^N1)):- atom(X),not(number(X)),number(N),is(N1,-(N,1)),!.

% Derivada de la forma X^(1/N)
d(X,X^(1/N),1/(N*((X)^(N1/N)))):- atom(X),not(number(X)),number(N),is(N1,-(N,1)),!.

% Integrales

% Integral de una constante
i(X,C,C*X):- atom(X), not(number(X)), number(C), !.

% Integral de X
i(X,X,(X^(2)/2)):- atom(X), not(number(X)),!.

% Integral de la forma C*X
i(x,C*x,C*((x^2)/2)):- number(C),!.

% Integral de la forma X^N
i(X,X^N,(X^N1)/N1):- atom(X),not(number(X)),number(N),is(N1,+(N,1)),!.

% Integral de la forma C*Funcion
i(X,C*Ux,C*IUx):- atom(X),not(number(X)),number(C),i(X,Ux,IUx),!.

% Integral de Suma de funciones
i(X,Ux+Vx,IUx+IVx):- atom(X),not(number(X)),i(X,Ux,IUx),i(X,Vx,IVx),!.

%Integral de Diferencia de Funciones
i(X,Ux-Vx,IUx-IVx):- atom(X),not(number(X)),i(X,Ux,IUx),i(X,Vx,IVx),!.
