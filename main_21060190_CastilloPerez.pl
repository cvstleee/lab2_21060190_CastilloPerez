%aqui solo van use_module.
:- use_module(tdaFlujo_21060190_CastilloPerez).
:- use_module(tdaChatbot_21060190_CastilloPerez).
:- use_module(tdaSystem_21060190_CastilloPerez).


%constructores
%RF3
%Descripción: Predicado que construye un flow (flujo).
%Dominio: id (int) X namemsg (String)  X Option  (Lista de 0 o más opciones) X Flow.
%Metas primarias: flow.
%Metas secundarias: filtrarDuplicados/3

flow(Id, Message, Option, [Id, Message, OptionFiltrado]):-
    filtroDuplicados(Option, OptionFiltrado).

%RF4
%Descripción: Predicado que agrega un option a un flow
%Dominio: id (int) X Option  (Lista de 0 o más opciones) X Flow.
%Metas primarias: flowAddOption/3.
%Metas secundarias: getIdFlow/2,getMessageFlow/2,getOptionFlow/2,agregarFinal/3,flow/4.

flowAddOption(Flow, OptionNuevo,FlowModificado):-
	getIdFlow(Flow, IdAntiguo),
	getMessageFlow(Flow, MessageAntiguo),
    getOptionFlow(Flow, OptionAntiguo),
    agregarFinal(OptionAntiguo,OptionNuevo,OptionResultante),
	flow(IdAntiguo, MessageAntiguo, OptionResultante,FlowModificado).

%RF5
%Descripción: Predicado que construye un chatbot.
%Dominio: chatbotID (int) X name (String) X welcomeMessage (String) X startFlowId(int) X  flows (Lista de 0 o más flujos) X chatbot
%Metas primarias: chatbot/5
%Meta secundaria: filtroDuplicadosFlow/2.


chatbot(ChatbotId, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotId, Name, WelcomeMessage, StartFlowId, FlowsFiltrado]):-
    filtroDuplicadosFlow(Flows,FlowsFiltrado).

%RF6
%agrega flow a un chatbot
%sec: agrega un flow a la lista de flows y dsp agrega al chatbot

chatbotAddFlow(Chatbot,NuevoFlow,NuevoChatbot):-
    getIdChatbot(Chatbot,Id), %error aqui con consola pc
    getNameChatbot(Chatbot,Name),
    getWelcomeMessageChatbot(Chatbot,WelcomeMessage),
    getStartFlowIdChatbot(Chatbot,StartFlowId),
    getFlowsChatbot(Chatbot,Flows),
    agregarFinal(Flows,NuevoFlow,FlowResultante),
    chatbot(Id,Name,WelcomeMessage,StartFlowId,FlowResultante,NuevoChatbot).



%RF7
%Descripción: Predicado que construye un sistema de chatbots.
%Dominio: name (string) X InitialChatbotCodeLink (Int) X chatbots (Lista de 0 o más chatbots) X system
%Metas primarias: chatbot/5
%Meta secundaria: filtroDuplicadosChatbot/2,get_time/1

%dudas con si va o no la fecha

system(Name, InitialChatbotCodeLink, Chatbots,[Fecha,Name,InitialChatbotCodeLink,ChatbotsFiltrados]):-
    get_time(Fecha),
    filtroDuplicadosChatbot(Chatbots,ChatbotsFiltrados).


%RF8 (tengo que documentarlo bien)
%Descripción: Predicado que construye un sistema de chatbots.
%Dominio: name (string) X InitialChatbotCodeLink (Int) X chatbots (Lista de 0 o más chatbots) X system
%Metas primarias: chatbot/5
%Meta secundaria: filtroDuplicadosChatbot/2,get_time/1

systemAddChatbot(System,ChatbotNuevo,NuevoSystem):-
    getNameSystem(System,Name),
    getInitialChatbotCodeLinkSystem(System,InitialChatbotCodeLink),
    getChatbotsSystem(System,Chatbots),
    agregarFinal(Chatbots,ChatbotNuevo,ChatbotFinal),
    system(Name,InitialChatbotCodeLink,ChatbotFinal,NuevoSystem).
