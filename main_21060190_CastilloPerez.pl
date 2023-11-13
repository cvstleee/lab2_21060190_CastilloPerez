:- use_module(tdaFlujo_21060190_CastilloPerez).
:- use_module(tdaChatbot_21060190_CastilloPerez).
:- use_module(tdaSystem_21060190_CastilloPerez).


%constructores
%RF3
%Descripción: Predicado que construye un flow (flujo).
%Dominio: id (int) X namemsg (String)  X Option  (Lista de 0 o más opciones) X Flow.
%Metas primarias: flow/4
%Metas secundarias: filtrarDuplicados/2

flow(Id, Message, Option, [Id, Message, OptionResultante]):-
    filtroDuplicados(Option,OptionResultante).

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
%Metas primarias: chatbot/6
%Meta secundaria: filtroDuplicadosFlow/2.


chatbot(ChatbotId, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotId, Name, WelcomeMessage, StartFlowId, FlowsFiltrado]):-
    filtroDuplicadosFlow(Flows,FlowsFiltrado).

%RF6
%Descripción: Predicado que agrega un flow a un chatbot
%Dominio: chatbot X flow X chatbot
%Metas primarias: chatbotAddFlow/3
%Meta secundaria: getIdChatbot/2, getNameChatbot/2, getWelcomeMessageChatbot/2, getStartFlowIdChatbot/2, getFlowsChatbot/2, agregarFinal/3, chatbot/6

chatbotAddFlow(Chatbot,NuevoFlow,NuevoChatbot):-
    getIdChatbot(Chatbot,Id), 
    getNameChatbot(Chatbot,Name),
    getWelcomeMessageChatbot(Chatbot,WelcomeMessage),
    getStartFlowIdChatbot(Chatbot,StartFlowId),
    getFlowsChatbot(Chatbot,Flows),
    agregarFinal(Flows,NuevoFlow,FlowResultante),
    chatbot(Id,Name,WelcomeMessage,StartFlowId,FlowResultante,NuevoChatbot).



%RF7
%Descripción: Predicado que construye un sistema de chatbots.
%Dominio: name (string) X InitialChatbotCodeLink (Int) X chatbots (Lista de 0 o más chatbots) X system
%Metas primarias: system/4
%Meta secundaria: filtroDuplicadosChatbot/2,get_time/1,tdaSystem/7

system(Name, InitialChatbotCodeLink, Chatbots,NewSystem):-
    get_time(Fecha),
    filtroDuplicadosChatbot(Chatbots,ChatbotsFiltrados),
    tdaSystem(Fecha, Name, InitialChatbotCodeLink, ChatbotsFiltrados,[],[],NewSystem).


%RF8 
%Descripción: Predicado que añade un chatbot al sistema.
%Dominio: system X chatbot X system
%Metas primarias: systemAddChatbot/3
%Meta secundaria: getNameSystem/2, getInitialChatbotCodeLinkSystem/2,getChatbotsSystem/2,agregarFinal/3,system/4.

systemAddChatbot(System,ChatbotNuevo,NuevoSystem):-
    getNameSystem(System,Name),
    getInitialChatbotCodeLinkSystem(System,InitialChatbotCodeLink),
    getChatbotsSystem(System,Chatbots),
    agregarFinal(Chatbots,ChatbotNuevo,ChatbotFinal),
    system(Name,InitialChatbotCodeLink,ChatbotFinal,NuevoSystem).

%RF9
%Descripción: Predicado que añade usuarios a un sistema
%Dominio: system X user (string) X system
%Metas primarias: systemAddUser/3.
%Meta secundaria:  getFechaSystem/2, getNameSystem/2, getInitialChatbotCodeLinkSystem/2,getChatbotsSystem/2,getUsersSystem/2,getUserActual/2,agregarFinal/3,filtroDuplicadosUser/2,tdaSystem/7.

systemAddUser(System,UserAgregar,SystemNuevo):-
    getFechaSystem(System,Fecha),
    getNameSystem(System,Name),
    getInitialChatbotCodeLinkSystem(System,InitialChatbotCodeLink),
    getChatbotsSystem(System,Chatbots),
    getUsersSystem(System,Users),
    getUserActual(System,UserActual),
    agregarFinal(Users,UserAgregar,UsersSinFiltrado),
    filtroDuplicadosUser(UsersSinFiltrado,UsersFinal),
    tdaSystem(Fecha,Name,InitialChatbotCodeLink,Chatbots,UsersFinal,UserActual,SystemNuevo).


%RF10
%Descripción: Predicado que permite iniciar sesión en un sistema.
%Dominio: system X user (string) X system
%Metas primarias: systemLogin/3
%Meta secundaria: getUsersSystem/2, member/2, getUserActual/2,listaVacia/1,setSystemUserActual/3.

% Regla
listaVacia([]).

%caso donde si existe y no hay ningún usuario iniciado
systemLogin(System,User,SystemNuevo):-
    getUsersSystem(System,Users),
    member(User,Users), 
    getUserActual(System,UserActual),
    listaVacia(UserActual),
    setSystemUserActual(System,User,SystemNuevo).

%RF11
%Descripción: Predicado que permite cerrar sesión en un sistema.
%Dominio: system X system
%Metas primarias: systemLogout/3
%Metas secundarias: getUserActual/2,listaVacia/1,setSystemUserActual/3.

%caso donde si hay un usuario iniciado
systemLogout(System,SystemNuevo):-
    getUserActual(System,UserActual),
    \+ listaVacia(UserActual),
    setSystemUserActual(System,[],SystemNuevo).







