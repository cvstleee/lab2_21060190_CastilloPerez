:- module(tdaSystem_21060190_CastilloPerez,[tdaSystem/7,getFechaSystem/2,getNameSystem/2,getInitialChatbotCodeLinkSystem/2,getChatbotsSystem/2,getUsersSystem/2,getUserActual/2,filtroDuplicadosUser/2,setSystemUserActual/3]).
:- use_module(tdaChatbot_21060190_CastilloPerez).


%--CONSTRUCTOR----

%Descripción: Predicado que construye un sistema sin el filtro.
%Dominio: Fecha (int) X Name X InitialChatbotCodeLink X Chatbots X Users X UserActual
%Metas primarias: tdaSystem/7
%Metas secundarias: no tiene

tdaSystem(Fecha, Name, InitialChatbotCodeLink, Chatbots,Users,UserActual,[Fecha,Name,InitialChatbotCodeLink,Chatbots,Users,UserActual]).

%----SELECTORES---

%Descripción: Predicado que obtiene la fecha de un sistema
%Dominio: System X Fecha
%Metas primarias: getFechaSystem/2
%Metas secundarias: tdaSystem/7

getFechaSystem(System,Fecha):-
    tdaSystem(Fecha,_,_,_,_,_,System).

%Descripción: Predicado que obtiene el nombre de un sistema
%Dominio: System X Name
%Metas primarias: getNameSystem/2
%Metas secundarias: tdaSystem/7

getNameSystem(System,Name):-
    tdaSystem(_,Name,_,_,_,_,System).

%Descripción: Predicado que obtiene el InitialChatbotCodeLink de un sistema
%Dominio: System X InitialChatbotCodeLink
%Metas primarias: getInitialChatbotCodeLinkSystem/2
%Metas secundarias: tdaSystem/7

getInitialChatbotCodeLinkSystem(System,InitialChatbotCodeLink):-
    tdaSystem(_,_,InitialChatbotCodeLink,_,_,_,System).

%Descripción: Predicado que obtiene la lista de chatbots de un sistema
%Dominio: System X Chatbots
%Metas primarias: getChatbotsSystem/2
%Metas secundarias: tdaSystem/7

getChatbotsSystem(System,Chatbots):-
    tdaSystem(_,_,_,Chatbots,_,_,System).

%Descripción: Predicado que obtiene la lista de users de un sistema
%Dominio: System X Chatbots
%Metas primarias: getUsersSystem/2
%Metas secundarias: tdaSystem/7

getUsersSystem(System,Users):-
    tdaSystem(_,_,_,_,Users,_,System).

%Descripción: Predicado que obtiene el usuario actual (el iniciado) de un sistema
%Dominio: System X Chatbots
%Metas primarias: getUserActualSystem/2
%Metas secundarias: tdaSystem/7

getUserActual(System,UserActual):-
    tdaSystem(_,_,_,_,_,UserActual,System).

%Descripción: Predicado que revisa si un usuario está registrado en el sistema, en caso de no estarlo lo agrega a la lista de salida
%Dominio: Lista de entrada X Lista de Salida
%Metas primarias: filtroDuplicadosUser/2
%Metas secundarias: member/2
%Método: Recursión.

filtroDuplicadosUser([],[]):-
    !.

filtroDuplicadosUser([H | T],[H | ListaNueva]):-
    filtroDuplicadosUser(T, ListaNueva),
    \+ member(H,ListaNueva).

%---MODIFICADOR---

%Descripción: Predicado que crea un nuevo sistema modificando el usuario actual
%Dominio: System X UserActual x System
%Metas primarias: setSystemUserActual/3
%Metas secundarias: tdaSystem/7

setSystemUserActual(System, UserActual, SystemNuevo):-
    tdaSystem(Fecha, Name, InitialChatbotCodeLink, Chatbots,Users,_,System),
    tdaSystem(Fecha, Name, InitialChatbotCodeLink, Chatbots,Users,UserActual,SystemNuevo).