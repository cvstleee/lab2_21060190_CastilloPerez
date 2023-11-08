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



