% Aquí va el código.

%maestroDe/2

maestroDe(toph,tierra).
maestroDe(zuko,fuego).
maestroDe(aang,fuego).
maestroDe(aang,tierra).
maestroDe(aang,agua).
maestroDe(katara,agua).

%el Or se hace escribiendo varias clausulas

maestroDe(Maestro,aire):-
    tieneConexion(Maestro).
maestroDe(Maestro,aire):-
    creoMovimiento(Maestro,_).

%similar al describe
:- begin_tests(testsDeMaestrosAire). 
    test(esMaestroAireCuandoTieneConexionEspiritual, nondet):-
        maestroDe(bumi,aire).
    test(esMaestroAireCuandoCreoMovimiento):-
        maestroDe(tenzin,aire).
    test(noEsMaestroAireSiNoCumpleNinguna, fail):-
        maestroDe(zuko,aire).
    test(maestroDeSeaInversiblePorElemento, set(Elemento == [fuego, tierra, agua, aire])):-
        maestroDe(aang, Elemento).
    test(maestroDeSeaInversiblePorMaestro, set( Maestro == [zuko, aang])):-
        maestroDe(Maestro,fuego).
:- end_tests(testsDeMaestrosAire).
%Por propiedad de universo cerrado, cualquier cosa que no este
%en la base de conocimientos es FALSOOO

%Palabras con mayus adentro de predicados = Variables
%Palabras con minus adentro de predicados = atomo

%creoMovimiento/2

creoMovimiento(zaheer,volar).
creoMovimiento(aang,patinetaDeAire).
creoMovimiento(tenzin,torbellinoDeAire).

tieneConexion(zaheer).
tieneConexion(bumi).
tieneConexion(kai).
tieneConexion(marquitos).

%tieneDobleMaestria/1

%el AND se escribe ","

tieneDobleMaestria(Maestro):-
    maestroDe(Maestro,Elemento1),
    maestroDe(Maestro,Elemento2),
    Elemento1 \= Elemento2.

% Existe X talque se cumple p(X), siendo P un predicado inversible

% confiaEn/2

confiaEn(aang,zuko).
confiaEn(aang,sokka).
confiaEn(aang,toph).
confiaEn(aang,appa).
confiaEn(aang,momo).

confiaEn(katara,Maestro):-
    confiaEn(aang,Maestro),
    not(maestroDe(Maestro,fuego)).