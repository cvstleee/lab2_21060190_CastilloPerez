:- module(tdaChatbot_21060190_CastilloPerez,[filtroDuplicadosChatbot/2,existeIdChatbot/2,tdaChatbot/6,getIdChatbot/2,getNameChatbot/2,getWelcomeMessageChatbot/2,getStartFlowIdChatbot/2,getFlowsChatbot/2]).
:- use_module(tdaFlujo_21060190_CastilloPerez).


%---FILTRO----

%Descripción: Predicado que toma una lista entregada por el usuario, y agrega en una nueva los no repetidos.
%Dominio: Lista original X Lista nueva
%Metas primarias: filtroDuplicadosChatbot/2
%Metas secundarias: getIdChatbot/2,existeIdChatbot/2
%Metodo: Recursión

filtroDuplicadosChatbot([],[]):-
    !.

filtroDuplicadosChatbot([H | T],[H | ListaNueva]):-
    getIdChatbot(H,Id),
    \+ existeIdChatbot(Id, T),
    filtroDuplicadosChatbot(T, ListaNueva).


%Descripción: Predicado que verifica si existe un elemento en cierta lista.
%Dominio: Id (int) X Lista (list).
%Metas primarias: existeIdChatbot/2
%Meta secundaria: getIdChatbot/2
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

%Descripción: Predicado que construye un chatbot sin el filtro.
%Dominio: ChatbotId X Name X WelcomeMessage X StartFlowId X Flows X Chatbot
%Metas primarias: tdaChatbot/6
%Metas secundarias: no tiene

tdaChatbot(ChatbotId, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotId, Name, WelcomeMessage, StartFlowId, Flows]).

%Descripción: Predicado que obtiene el ID de un Chatbot
%Dominio: Chatbot X Id
%Metas primarias: getIdChatbot/2
%Metas secundarias:tdaChatbot/6

getIdChatbot(Chatbot,Id):-
    tdaChatbot(Id,_,_,_,_,Chatbot).

%Descripción: Predicado que obtiene el nombre de un Chatbot
%Dominio: Chatbot X Name
%Metas primarias: getNameChatbot/2
%Metas secundarias:tdaChatbot/6

getNameChatbot(Chatbot,Name):-
    tdaChatbot(_,Name,_,_,_,Chatbot).

%Descripción: Predicado que obtiene el WelcomeMessage de un Chatbot
%Dominio: Chatbot X WelcomeMessage
%Metas primarias: getWelcomeMessageChatbot/2
%Metas secundarias:tdaChatbot/6

getWelcomeMessageChatbot(Chatbot,WelcomeMessage):-
    tdaChatbot(_,_,WelcomeMessage,_,_,Chatbot).

%Descripción: Predicado que obtiene el StartFlowId de un Chatbot
%Dominio: Chatbot X StartFlowId
%Metas primarias: getStartFlowIdChatbot/2
%Metas secundarias:tdaChatbot/6

getStartFlowIdChatbot(Chatbot,StartFlowId):-
    tdaChatbot(_,_,_,StartFlowId,_,Chatbot).

%Descripción: Predicado que obtiene la lista de flows de un Chatbot
%Dominio: Chatbot X Flows
%Metas primarias: getFlowsChatbot/2
%Metas secundarias:tdaChatbot/6

getFlowsChatbot(Chatbot,Flows):-
    tdaChatbot(_,_,_,_,Flows,Chatbot).

