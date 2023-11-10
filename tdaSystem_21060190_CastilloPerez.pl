:- module(tdaSystem_21060190,[tdaSystem/4,getFechaSystem/,getNameSystem/2,getInitialChatbotCodeLinkSystem/2,getChatbotsSystem/2]).
:- use_module(tdaChatbot_21060190_CastilloPerez).


%--CONSTRUCTOR----
tdaSystem(Fecha, Name, InitialChatbotCodeLink, Chatbots,Users,UserActual,[Fecha,Name,InitialChatbotCodeLink,Chatbots,Users,UserActual]).

%----SELECTORES---
getFechaSystem(System,Fecha):-
    tdaSystem(Fecha,_,_,_,_,_,System).

getNameSystem(System,Name):-
    tdaSystem(_,Name,_,_,_,_,System).

getInitialChatbotCodeLinkSystem(System,InitialChatbotCodeLink):-
    tdaSystem(_,_,InitialChatbotCodeLink,_,_,_,System).

getChatbotsSystem(System,Chatbots):-
    tdaSystem(_,_,_,Chatbots,_,_,System).

getUsersSystem(System,Users):-
    tdaSystem(_,_,_,_,Users,_,System).

getUserActual(System,UserActual):-
    tdaSystem(_,_,_,_,_,UserActual,System).



%probablemente tenga que cambiarla a la que he estado usando comunmente debido a como puse el ejemplo, ya que se irán agregando
%uno a uno.
%quizá no sea necesario, pq aqui la lista siempre será con más usuarios, no con otros elementos como era en el caso del flow y option   

filtroDuplicadosUser([],[]):-
    !.

filtroDuplicadosUser([H | T],[H | ListaNueva]):-
    filtroDuplicadosUser(T, ListaNueva),
    \+ member(H,ListaNueva).

filtroDuplicadosUser([_ | T],ListaNueva):-
    filtroDuplicadosUser(T, ListaNueva).


setSystemUserActual(System, UserActual, SystemNuevo):-
    tdaSystem(Fecha, Name, InitialChatbotCodeLink, Chatbots,Users,_,System),
    tdaSystem(Fecha, Name, InitialChatbotCodeLink, Chatbots,Users,UserActual,SystemNuevo).

