:- use_module(main_21060190_CastilloPerez).

%pruebas ejemplos doc
option(1, "1 - viajar", 2, 4, ["viajar", "turistear", "conocer"], O1),
option(2, "2 - estudiar", 4, 3, ["aprender", "perfeccionarme"], O2),

%pruebas mias

option(3, "3 - comer", 5, 6, ["almuerzo", "delivery", "salir"],O3),
option(4, "4 - deporte", 6, 5, [], O4),
option(5, "5 - Paises de Europa", 3, 6, ["Italia", "Inglaterra", "Francia"], O5).

%ejemplos doc
flow(1, "Flujo 1: mensaje de prueba", [], F1),
flow(2, "Flujo 1: mensaje de prueba", [O1, O2], F2).

%pruebas mias, hay un caso repetido

flow(3, "Flujo 3: prueba", [O3],F3),
flow(4, "Flujo 4: prueba", [O4, 05],F4),
flow(5, "Flujo 5: prueba", [O3, O3],F5).

%ejemplos doc
%añadiendo opciones 1 y 2 al flujo 13
%el resultado alcanzado en F15 es equivalente al ilustrado en F2 del predicado 3.

flowAddOption(F1, O1, F14),
flowAddOption(F14, O2, F15).

%pruebas mias
flowAddOption(F3, O4, F6),
flowAddOption(F4, O5, F7), %da uno repetido
flowAddOption(F5, O5, F8).

%ejemplos doc
chatbot(0, "Asistente", "Bienvenido ¿Qué te gustaría hacer?", 1,[], CB10),
chatbot(0, "Asistente", "Bienvenido ¿Qué te gustaría hacer?", 1, [F2], CB11).

%ejemplos mios
chatbot(1, "Chatbot 1", "Bienvenido ¿Qué te gustaría hacer?", 2, [F4,F5], CB12).
chatbot(2, "Chatbot 2", "Bienvenido ¿Qué te gustaría hacer?", 3, [F5], CB13).
chatbot(3, "Chatbot 3", "Bienvenido ¿Qué te gustaría hacer?", 4, [F2,F2,F15], CB14). %no agrega un flow que contiene el mismo option

%ejemplos doc, los add son sin [] los flow que se agregan
chatbotAddFlow(CB10, F1,CB15).

%ver script gonza
