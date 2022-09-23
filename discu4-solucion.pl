% Discusion 4 - Arboles y Logica
% Problema 1) Calculo de Altura de un Arbol binario

altura_arbol([],0):- !.

altura_arbol([ArbIzq,_,ArbDer],H):-
    altura_arbol(ArbIzq,HI),
    altura_arbol(ArbDer,HD),
    is(H,+(1,max(HI,HD))).

% Problema 2) Realice la suma de las llaves de los nodos de un BT

suma_llaves([],0):- !.

suma_llaves([SubIzq,Nodo,SubDer],Sum):-
    suma_llaves(SubIzq,SumI),
    suma_llaves(SubDer,SumD),
    is(Sum,+(+(Nodo,SumI),SumD)),!.

% Problema 3) Cuente la cantidad de nodos en un BT

contar_nodos([],0):- !.

contar_nodos([SubIzq,_,SubDer],C):-
    contar_nodos(SubIzq,CI),
    contar_nodos(SubDer,CD),
    is(C,+(1,+(CI,CD))).

% Problema 4) Contar la cantidad de nodos que se visitan hasta encontrar
% el valor que se desea buscar.Considere el hecho de que la llave puede
% no encontrarse en el árbol.

contar_visitas([],_,'Llave no encontrada'):- !.

contar_visitas([_,Nodo,_],Nodo,1):- !.

contar_visitas([SubIzq,Nodo,_],Dato,Cont):-
    <(Dato,Nodo),
    contar_visitas(SubIzq,Dato,ContI),
    (
        number(ContI),is(Cont,+(1,ContI)),!
        ;
        not(number(ContI)), =(Cont,ContI)
    ).

contar_visitas([_,Nodo,SubDer],Dato,Cont):-
    >(Dato,Nodo),
    contar_visitas(SubDer,Dato,ContD),
    (
        number(ContD),is(Cont,+(1,ContD)),!
        ;
        not(number(ContD)), =(Cont,ContD)
    ).

% Problema 5)
% Tres señoras de apellidos Blanco, Rubio y Castaño, se
% conocen en una reunión. Poco después de hacerse las presentaciones,
% una de ellas hace notar: "Es muy curioso que nuestros apellidos sean
% Blanco, Rubio y Castaño, y que nos hayamos reunido aquí tres personas
% con esos mismos colores de cabello". "Sí que lo es - dijo la dama de
% pelo rubio-, pero habrá observado que nadie tiene el color de pelo que
% corresponde a su apellido." "¡Es verdad!" - exclamó la señora de
% apellido Blanco. Si la última dama no tiene el pelo castaño, ¿De qué
% color es el cabello de las tres señoras?

color_cabello(blanco).
color_cabello(rubio).
color_cabello(castano).

colorCabello(S):-
    =(S,[SraBlanco,SraRubio,SraCastano]),
    color_cabello(SraBlanco),
    \==(SraBlanco,blanco),
    \==(SraBlanco,castano),
    color_cabello(SraRubio),
    \==(SraRubio,rubio),
    \==(SraRubio,SraBlanco),
    color_cabello(SraCastano),
    \==(SraCastano,castano),
    \==(SraCastano,SraRubio),
    \==(SraCastano,SraBlanco),!.



% Problema 6)
% En una hilera de cuatro casas, los Vásquez viven al lado
% de los Moreno pero no al lado de los González. Si los González no
% viven al lado de los Flores, ¿en qué orden están las casa de las
% cuatro familias?, ¿hay más de una posibilidad?

asignar_casa([1,X],[[1,X],_,_,_]).
asignar_casa([2,X],[_,[2,X],_,_]).
asignar_casa([3,X],[_,_,[3,X],_]).
asignar_casa([4,X],[_,_,_,[4,X]]).

cuatro_casas(Hilera):-
    =(Hilera,[[1,_],[2,_],[3,_],[4,_]]),
    asignar_casa([V,vasquez],Hilera),
    asignar_casa([M,moreno],Hilera),
    (
        succ(M,V);
        succ(V,M)
    ),
    asignar_casa([G,gonzalez],Hilera),
    (
        >(V,+(G,1));
        <(V,-(G,1))
    )
    ,
    asignar_casa([F,flores],Hilera),
    (
        >(G,+(F,1));
        <(G,-(F,1))
    ).



