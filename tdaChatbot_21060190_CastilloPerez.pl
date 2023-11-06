:- module(tdaChatbot_21060190_CastilloPerez,[filtroDuplicadosChatbot/2,existeIdChatbot/2,tdaChatbot/6,getIdChatbot/2,getNameChatbot/2,getWelcomeMessageChatbot/2,getStartFlowIdChatbot/2,getFlowsChatbot/2]).
:- use_module(tdaFlujo_21060190_CastilloPerez).


%---FILTRO----

%Descripción: Predicado que toma una lista entregada por el usuario, y agrega en una nueva los no repetidos.
%Dominio: Lista original X Lista nueva
%Metas primarias: filtroDuplicados/2
%Metas secundarias: getIdOption/2,existeId/2


filtroDuplicadosChatbot([],[]):-
    !.

filtroDuplicadosChatbot([H | T],[H | ListaNueva]):-
    getIdChatbot(H,Id),
    \+ existeIdChatbot(Id, T),
    filtroDuplicadosChatbot(T, ListaNueva).

filtroDuplicadosChatbot([_ | T],ListaNueva):-
    filtroDuplicadosChatbot(T, ListaNueva).

%Descripción: Predicado que verifica si existe un elemento en cierta lista.
%Dominio: Id (int) X Lista (list).
%Metas primarias: existeId/2
%Método: Recursión.

%si ocurre el primero
existeIdChatbot(Id, [PrimerOption | _]):-
    getIdChatbot(PrimerOption,Id).

%caso recursivo
existeIdChatbot(Id, [_ | RestoOption]):-
    existeIdChatbot(Id,RestoOption).
    
existeIdChatbot(_,[]):-
    false.



%---CONSTRUCTOR---
tdaChatbot(ChatbotId, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotId, Name, WelcomeMessage, StartFlowId, Flows]).

getIdChatbot(Chatbot,Id):-
    tdaChatbot(Id,_,_,_,_,Chatbot).

getNameChatbot(Chatbot,Name):-
    tdaChatbot(_,Name,_,_,_,Chatbot).

getWelcomeMessageChatbot(Chatbot,WelcomeMessage):-
    tdaChatbot(_,_,WelcomeMessage,_,_,Chatbot).

getStartFlowIdChatbot(Chatbot,StartFlowId):-
    tdaChatbot(_,_,_,StartFlowId,_,Chatbot).

getFlowsChatbot(Chatbot,Flows):-
    tdaChatbot(_,_,_,_,Flows,Chatbot).

