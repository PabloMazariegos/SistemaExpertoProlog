:- use_module(library(pce)).

%BASE DE CONOCIMIENTO
%RESPUESTA
respuesta('si').
respuesta('no').
respuesta('3000-5000').
respuesta('5001-8000').
respuesta('+8001').

%INGENIERIA
pregunta('Diseñar programas de computacion y explorar nuevas tecnologias',X):-respuesta(X).
pregunta('resolver problemas de calculo matematico',X):-respuesta(X).
pregunta('Te gusta la programación o cosas que tenga que ver con computadoras',X):-respuesta(X).
pregunta('te gusta la fisica, matematica y todo lo que se relacione con numeros',X):-respuesta(X).
pregunta('Diseñar máquinas que puedan simular actividades humanas',X):-respuesta(X).

%MEDICINA
pregunta('Diseñar cursos para enseñar a la gente sobre temas de salud e higiene',X):-respuesta(X).
pregunta('Atender la salud de personas enfermas',X):-respuesta(X).
pregunta('Examinar y tratar los problemas visuales',X):-respuesta(X).
pregunta('Atender y realizar ejercicios a personas que tienen limitaciones fisicas, problemas de lenguaje u otra discapacidad',X):-respuesta(X).
pregunta('Realizar el control de calidad de los alimentos',X):-respuesta(X).

%ADMINISTRACION
pregunta('Seleccionar, capacitar y motivar al personal de una organizacion/empresa',X):- respuesta(X).
pregunta('Planificar cuales son las metas de una organizacion publica o privada a mediano y largo plazo',X):- respuesta(X).
pregunta('Controlar ingresos y egresos de fondos y presentar el balance final de una institucion',X):- respuesta(X).
pregunta('Elaborar campañas para introducir un nuevo producto al mercado',X):- respuesta(X).

%UNIVERSIDAD
pregunta('Depende economicamente de una persona',X):-respuesta(X).
pregunta('Se encuentra trabajando',X):-respuesta(X).
pregunta('Se encuentra habitando dentro del área metropolitana ',X):-respuesta(X).
pregunta('Su hogar es propio o alquilado',X):-respuesta(X).
pregunta('Seleccione sus ingresos',X):-respuesta(X).



principal:-
    new(D, dialog('EXAMEN DE ORIENTACION VOCACIONAL')),

    send(D, append, new(label(titulo, 'BIENVENIDO AL TEST'))),
    send(D, append, new(label(ins, 'Responde todas las preguntas para calcular tu resultado.'))),
    send(D, append, button(procesar, message(@prolog, preguntas))),

    send(D, default_button, procesar),
    send(D, open_centered).


preguntas:-
    new(D, dialog('PREGUNTAS')),

    send(D, append, new(P1, menu('Diseñar Programas De computacion y explorar nuevas tecnologias'))),
      send_list(P1, append, [si,no]),

    send(D, append, new(P8, menu('Atender a personas que tienen limitaciones fisicas, problemas de lenguaje u otra discapacidad'))),
      send_list(P8, append, [si,no]),

    send(D, append, new(P13, menu('Elaborar campañas para introducir un nuevo producto al mercado'))),
      send_list(P13, append, [si,no]),

    send(D, append, new(P3, menu('Te gusta la programación o cosas que tenga que ver con computadoras'))),
      send_list(P3, append, [si,no]),

    send(D, append, new(P5, menu('Diseñar máquinas que puedan simular actividades humanas'))),
      send_list(P5, append, [si,no]),

    send(D, append, new(P11, menu('Planificar cuales son las metas de una organizacion publica o privada a mediano y largo plazo'))),
      send_list(P11, append, [si,no]),

    send(D, append, new(P7, menu('Examinar y tratar los problemas visuales'))),
      send_list(P7, append, [si,no]),

    send(D, append, new(P6, menu('Atender la salud de personas enfermas'))),
      send_list(P6, append, [si,no]),

    send(D, append, new(P4, menu('te gusta la fisica, matematica y todo lo que se relacione con numeros'))),
      send_list(P4, append, [si,no]),

    send(D, append, new(P9, menu('Realizar el control de calidad de los alimentos'))),
      send_list(P9, append, [si,no]),

    send(D, append, new(P2, menu('resolver problemas de calculo matematico'))),
      send_list(P2, append, [si,no]),

    send(D, append, new(P10, menu('Seleccionar, capacitar y motivar al personal de una organizacion/empresa'))),
      send_list(P10, append, [si,no]),

    send(D, append, new(P12, menu('Controlar ingresos y egresos de fondos y presentar el balance final de una institucion'))),
      send_list(P12, append, [si,no]),

    send(D, scrollbars, vertical),

    new(B,button(siguiente,message(@prolog,inferencia,P1?selection,P2?selection,P3?selection,
        P4?selection,P5?selection,P6?selection,P7?selection,P8?selection,P9?selection,P10?selection,
        P11?selection,P12?selection,P13?selection))),

    send(D,append,B),

    send(D, open_centered).


%MAQUINA DE INFERENCIAS
inferencia(P1,P2,P3,P4,P5,_,_,_,_,_,_,_,_):-
    pregunta('Diseñar programas de computacion y explorar nuevas tecnologias',P1),P1='si',
    pregunta('resolver problemas de calculo matematico',P2),P2='si',
    pregunta('Te gusta la programación o cosas que tenga que ver con computadoras',P3),P3='si',
    pregunta('te gusta la fisica, matematica y todo lo que se relacione con numeros',P4),P4='si',
    pregunta('Diseñar máquinas que puedan simular actividades humanas',P5),P5='si',
    resultados('C:/Vocacion/tecno.jpg','CIENCIA Y TECNOLOGIA: Ingenieria, Arquitectura, Electronica, Telecomunicaciones').

inferencia(_,_,_,_,_,P6,P7,P8,P9,P10,_,_,_):-
    pregunta('Diseñar cursos para enseñar a la gente sobre temas de salud e higiene',P6),P6='si',
    pregunta('Atender la salud de personas enfermas',P7),P7='si',
    pregunta('Examinar y tratar los problemas visuales',P8),P8='si',
    pregunta('Atender y realizar ejercicios a personas que tienen limitaciones fisicas, problemas de lenguaje u otra discapacidad',P9),P9='si',
    pregunta('Realizar el control de calidad de los alimentos',P10),P10='si',
    resultados('C:/Vocacion/medicina.jpg','MEDICINA: nutricion, medicina').

inferencia(_,_,_,_,_,_,_,_,_,_,P11,P12,P13):-
    pregunta('Planificar cuales son las metas de una organizacion publica o privada a mediano y largo plazo',P11),P11='si',
    pregunta('Controlar ingresos y egresos de fondos y presentar el balance final de una institucion',P12),P12='si',
    pregunta('Elaborar campañas para introducir un nuevo producto al mercado',P13),P13='si',
    resultados('C:/Vocacion/planeacion.jpg','ADMINISTRACION: administracion de empresas, marketing, mercadeo').


resultados(X,R):-
    new(D, dialog('RESULTADOS DE TEST')),
    mostrar2(X,D,20,30),
    send(D, append(label(n,'RECOMENDACION DE AREA DE VOCACION: '))),
    send(D, append(label(n,R))),
    send(D, append, button(siguiente, message(@prolog, universidad))),
    send(D, default_button, siguiente),
    send(D,open_centered).


mostrar2(V,D,X,Y):- new(I, image(V)),
        new(B, bitmap(I)),
        new(F2, figure),
        send(F2, display, B),
        new(D1, device),
        send(D1, display, F2),
        send(D, display, D1),
        send(D,display,D1,point(X,Y)).

universidad:-
    new(D, dialog('TEST VOCACIONAL')),

    send(D, append, new(U1, menu('Depende economicamente de una persona'))),
      send_list(U1, append, [si,no]),

    send(D, append, new(U2, menu('Se ecuentra trabajando'))),
      send_list(U2, append, [si,no]),

    send(D, append, new(U3, menu('se encuentra dentro del area metropolitana'))),
      send_list(U3, append, [si,no]),

    send(D, append, new(U4, menu('Tiene hogar propio'))),
      send_list(U4, append, [si,no]),

    send(D, append, new(U5, menu('Seleccione sus ingresos'))),
      send_list(U5, append, ['3000-5000','5001-8000','+8001']),

    new(B,button(siguiente,message(@prolog,universidadinfer,U1?selection,U2?selection,U3?selection,U4?selection,U5?selection))),

    send(D, append, B),
    send(D, open_centered).


universidadinfer(_,U2,U3,_,U5):-
    pregunta('Se encuentra trabajando',U2),U2='si',
    pregunta('Se encuentra habitando dentro del área metropolitana ',U3),U3='si',
    pregunta('Seleccione sus ingresos', U5),U5='3000-5000',
    result2('C:/Vocacion/usac.jpg').

universidadinfer(_,U2,U3,_,U5):-
    pregunta('Se encuentra trabajando',U2),U2='no',
    pregunta('Se encuentra habitando dentro del área metropolitana ',U3),U3='si',
    pregunta('Seleccione sus ingresos', U5),U5='3000-5000',
    result2('C:/Vocacion/usac.jpg').

universidadinfer(_,U2,U3,_,U5):-
    pregunta('Se encuentra trabajando',U2),U2='si',
    pregunta('Se encuentra habitando dentro del área metropolitana ',U3),U3='no',
    pregunta('Seleccione sus ingresos', U5),U5='3000-5000',
    result2('C:/Vocacion/usac.jpg').

universidadinfer(_,U2,U3,_,U5):-
    pregunta('Se encuentra trabajando',U2),U2='si',
    pregunta('Se encuentra habitando dentro del área metropolitana ',U3),U3='si',
    pregunta('Seleccione sus ingresos', U5),U5='5001-8000',
    result2('C:/Vocacion/umg.jpg').

universidadinfer(_,_,_,_,U5):-
    pregunta('Seleccione sus ingresos', U5),U5='5001-8000',
    result2('C:/Vocacion/umg.jpg').

universidadinfer(_,_,_,_,U5):-
    pregunta('Seleccione sus ingresos', U5),U5='+8001',
    result2('C:/Vocacion/url.jpg').

universidadinfer(_,_,_,_,U5):-
    pregunta('Seleccione sus ingresos', U5),U5='3000-5000',
    result2('C:/Vocacion/usac.jpg').

result2(U):-
    new(D, dialog('RESULTADOS DE TEST')),
    mostrar2(U,D,20,30),
    send(D, append(label(n,'UNIVERSIDAD RECOMENDADA'))),
    send(D,open_centered).





:- principal.
