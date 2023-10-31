:-use_module(tdaChatbot_21060190_CastilloPerez.pl).
:use_module(tdaFlujo_21060190_CastilloPerez.pl).

%constructores
%RF3
%Descripción: Predicado que construye un flow (flujo).
%Dominio: id (int) X namemsg (String)  X Option  (Lista de 0 o más opciones) X Flow.
%Metas primarias: flow.
%Metas secundarias: filtrarDuplicados/3

flow(Id, Message, Option, [Id, Message, OptionFiltrado]):-
    filtroDuplicados(Option, OptionFiltrado).

%RF5
%Descripción: Predicado que construye un chatbot.
%Dominio: chatbotID (int) X name (String) X welcomeMessage (String) X startFlowId(int) X  flows (Lista de 0 o más flujos) X chatbot
%Metas primarias: chatbot/5


chatbot(ChatbotId, Name, WelcomeMessage, StartFlowId, Flows, [ChatbotId, Name, WelcomeMessage, StartFlowId, FlowsFiltrado]):-
    filtroDuplicadosFlow(Flows,FlowsFiltrado).