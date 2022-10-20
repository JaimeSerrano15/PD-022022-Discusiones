% Ejemplo de Manipulación de Archivos con Prolog
%
% Leer archivo y guardar datos en una lista

archivo_lista:-
    open('listaarchivo.txt',read,Datos),
    llenarLista(Datos,L),
    close(Datos),
    writeln(L).

llenarLista(File,L):-
    read(File,D),
    (
        \==(D,end_of_file),
        llenarLista(File,L2),
        =(L,[D|L2]);
        ==(D,end_of_file),
        =(L,[])
    ),!.

% Contar cantidad de pares e impares

paresImpares:-
    analizar_doc(P,I),
    write('Cantidad de Pares: '), writeln(P),
    write('Cantidad de Impares: '), writeln(I).

analizar_doc(P,I):-
    open('numeros.txt',read,Numeros),
    analizar(Numeros,P,I),
    close(Numeros).

analizar(Archivo,P,I):-
    read(Archivo,N),
    validar(Archivo,N,P,I).

validar(Archivo,N,P,I):-
    \==(N,end_of_file),
    =:=(0,mod(N,2)),
    analizar(Archivo,P1,I),
    is(P,+(P1,1)),!.

validar(Archivo,N,P,I):-
    \==(N,end_of_file),
    =\=(0,mod(N,2)),
    analizar(Archivo,P,I1),
    is(I,+(I1,1)),!.

validar(_,N,0,0):-
    ==(N,end_of_file).
