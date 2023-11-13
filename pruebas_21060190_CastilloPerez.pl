%SCRIPT DE PRUEBAS 1

%Como se menciona en las instrucciones de uso, estarán comentados las consultas de predicados que no se llegaron a implementar y también los que dan false según lo pedido en el documento.
%Hacer uso de set_prolog_flag(answer_write_options,[max_depth(0)]). antes de hacer las pruebas

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
%flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9).
systemLogin(S9, "user2", S10).

%De aqui hacía abajo son predicados no implementados.
%systemTalkRec(S10, "hola", S11),
%systemTalkRec(S11, "1", S12),
%systemTalkRec(S12, "1", S13),
%systemTalkRec(S13, "Museo", S14),
%systemTalkRec(S14, "1", S15),
%systemTalkRec(S15, "3", S16),
%systemTalkRec(S16, "5", S17),
%systemSynthesis(S17, "user2", Str1),
%systemSimulate(S02, 5, 32131, S99).


%---PRUEBAS CREADAS POR MI---


%RF2

option(3, "3 - comer", 5, 6, ["almuerzo", "delivery", "salir"],O3),
option(4, "4 - deporte", 6, 5, ["futbol","handball"], O4),
option(5, "5 - Paises de Europa", 3, 6, ["Italia", "Inglaterra", "Francia"], O5),

%RF3

flow(3, "Flujo 3: prueba", [O3],F3),
flow(4, "Flujo 4: prueba", [O4, O5],F4),
%flow(5, "Flujo 5: prueba", [O3, O3],F5),  %Se descomenta y da false

%RF4
flowAddOption(F3, O4, F6),
%flowAddOption(F4, O5, F7), %Se descomenta y da false
flowAddOption(F3, O5, F8),

%RF5
chatbot(1, "Chatbot 1", "Bienvenido ¿Qué te gustaría hacer?", 2, [F4], CB12),
chatbot(2, "Chatbot 2", "Bienvenido ¿Qué te gustaría hacer?", 3, [F3], CB13),
%chatbot(3, "Chatbot 3", "Bienvenido ¿Qué te gustaría hacer?", 4, [F2,F2,F15], CB14), %se descomenta y da false
chatbot(4,"Chatbot 4", "Bienvenido ¿Qué te gustaría hacer?", 5, [F4], CB18),

%RF6 
%chatbotAddFlow(CB12,F4,CB15), %se descomenta y da false
chatbotAddFlow(CB13,F4,CB16),
chatbotAddFlow(CB12,F3,CB17),

%RF7
system("Chatbot 1", 1, [CB12], S20),
%system("Chatbot 2", 2, [CB18,CB18], S21), %se descomenta y da false
system("Chatbot 3", 3, [CB13], S22),

%RF8
systemAddChatbot(S20,CB16,S23),
systemAddChatbot(S22,CB18,S24),
%systemAddChatbot(S22,CB13,S25), %se descomenta y da false

%RF9 
systemAddUser(S20,"user6",S26),
systemAddUser(S26,"user7",S27),
systemAddUser(S27,"user8",S28),

%RF10
systemLogin(S26,"user6",S29),
%systemLogin(S29,"user7",S30), %se descomenta y da false 
%systemLogin(S28,"user9",S31), %se descomenta y da false

%RF11
systemLogout(S29,S35),
%systemLogout(S27,S33), %se descomenta y da false
%systemLogout(S26,S34). %se descomenta y da false