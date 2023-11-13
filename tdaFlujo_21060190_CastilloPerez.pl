:- module(tdaFlujo_21060190_CastilloPerez, [option/6,filtroDuplicados/2,existeId/2,getIdOption/2,tdaFlow/4,getIdFlow/2,getMessageFlow/2,getOptionFlow/2,agregarFinal/3,filtroDuplicadosFlow/2,existeIdFlow/2]).

%RF2
%Descripción: Predicado que construye una opción.
%Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword X Option.
%Metas primarias: option/6
%Metas secundarias: no tiene.

option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword , [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

%Descripción: Predicado que obtiene el ID de un option.
%Dominio: Option (list) X Id (int)
%Metas primarias: getIdOption/2
%Metas secundarias: no tiene

getIdOption(Option,Id):-
    option(Id,_,_,_,_,Option).


%Descripción: Predicado que toma una lista entregada por el usuario, y agrega en una nueva los no repetidos.
%Dominio: Lista original X Lista nueva
%Metas primarias: filtroDuplicados/2
%Metas secundarias: getIdOption/2,existeId/2
%Método: Recursión

filtroDuplicados([], []):-
    !.

filtroDuplicados([H | T], [H | ListaNueva]) :-
    getIdOption(H, Id),
    filtroDuplicados(T, ListaNueva),
    \+ existeId(Id, ListaNueva).


%Descripción: Predicado que verifica si existe un elemento en cierta lista.
%Dominio: Id (int) X Lista (list).
%Metas primarias: existeId/2
%Meta secundaria: getIdOption/2
%Método: Recursión.

existeId(Id, [PrimerOption | _]):-
    getIdOption(PrimerOption,Id).

existeId(Id, [_ | RestoOption]):-
    existeId(Id,RestoOption).
    
existeId(_,[]):-
    false.

%---CONSTRUCTOR--- 
%Descripción: Predicado que construye un flow sin el filtro.
%Dominio: Id X Message X Option
%Metas primarias: tdaFlow/4
%Metas secundarias: no tiene

tdaFlow(Id,Message,Option,[Id,Message,Option]).

%Descripción: Predicado que obtiene el ID de un flow
%Dominio: Flow X Id
%Metas primarias: getIdFlow/2
%Metas secundarias: tdaFlow/3

getIdFlow(Flow, Id) :-
   tdaFlow(Id , _ , _, Flow).

%Descripción: Predicado que obtiene el mensaje de un flow
%Dominio: Flow X Message
%Metas primarias: getMessageFlow/2
%Metas secundarias: tdaFlow/3

getMessageFlow(Flow, Message) :-
    tdaFlow(_ , Message , _, Flow).

%Descripción: Predicado que obtiene la lista de opciones de un flow
%Dominio: Flow X Option
%Metas primarias: getOptionFlow/2
%Metas secundarias: tdaFlow/3

getOptionFlow(Flow, Option) :-
    tdaFlow(_ , _ , Option, Flow).


%Descripción: Predicado que agrega un elemento al final de una lista
%Dominio: Lista Inicial X Elemento X Lista Resultante
%Metas primarias: agregarFinal/3
%Metodo: Recursión

agregarFinal([],ElementoParaAgregar,[ElementoParaAgregar]).

agregarFinal([H | T], ElementoParaAgregar, [H | ListaResultante]):-
	agregarFinal(T,ElementoParaAgregar,ListaResultante).


%Descripción: Predicado que toma una lista entregada por el usuario, y agrega en una nueva los no repetidos.
%Dominio: Lista original X Lista nueva
%Metas primarias: filtroDuplicados/2
%Metas secundarias: getIdOption/2,existeId/2


filtroDuplicadosFlow([],[]):-
    !.

filtroDuplicadosFlow([H | T],[H | ListaNueva]):-
    getIdFlow(H,Id),
    \+ existeIdFlow(Id, T),
    filtroDuplicadosFlow(T, ListaNueva).

%Descripción: Predicado que verifica si existe un elemento en cierta lista.
%Dominio: Id (int) X Lista (list).
%Metas primarias: existeIdFlow/2
%Meta secundaria: getIdFlow/2
%Método: Recursión.

existeIdFlow(Id, [PrimerOption | _]):-
    getIdFlow(PrimerOption,Id).

%caso recursivo
existeIdFlow(Id, [_ | RestoOption]):-
    existeIdFlow(Id,RestoOption).
    
existeIdFlow(_,[]):-
    false.