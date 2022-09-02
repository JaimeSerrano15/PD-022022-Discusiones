%Ejercicio de calorias
calorias(paella,200).
calorias(gazpacho,150).
calorias(consome,300).
calorias(filete,400).
calorias(pollo,280).
calorias(trucha,160).
calorias(bacalao,300).
calorias(flan,200).
calorias(nueces,500).
calorias(naranja,50).

valor_calorico(X,Y,Z,V):-
    calorias(X,A),
    calorias(Y,B),
    calorias(Z,C),
    is(V,+(A,+(B,C))).

comida_equilibrada(X,Y,Z):-
    calorias(X,A),
    calorias(Y,B),
    calorias(Z,C),
    is(V,+(A,+(B,C))),
    >(V,800),
    writeln("La comida supera las 800 calorias! D:"),!.

comida_equilibrada(X,Y,Z):-
    calorias(X,A),
    calorias(Y,B),
    calorias(Z,C),
    is(V,+(A,+(B,C))),
    =<(V,800),
    writeln("La comida NO supera las 800 calorias! D:"),!.



% Base 10 a Hexadecimal
hex(0,0).
hex(1,1).
hex(2,2).
hex(3,3).
hex(4,4).
hex(5,5).
hex(6,6).
hex(7,7).
hex(8,8).
hex(9,9).
hex(10,'A').
hex(11,'B').
hex(12,'C').
hex(13,'D').
hex(14,'E').
hex(15,'F').

converter_b10_b16(X):-
    <(X,16),
    hex(X,H),
    write(H),!.

converter_b10_b16(X):-
    is(R,mod(X,16)),
    hex(R,H),
    is(N,//(X,16)),
    converter_b10_b16(N),
    write(H).

%Fibonacci

fibo(0,0):-!.
fibo(1,1):-!.

fibo(N,F):-
    is(X,-(N,1)),
    fibo(X,F1),
    is(Y,-(N,2)),
    fibo(Y,F2),
    is(F,+(F1,F2)),!.
