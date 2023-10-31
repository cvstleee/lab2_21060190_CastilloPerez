:- module(tdaFlujo_21060190_CastilloPerez, [option/6, flow/4, flowAddOption/3,filtroDuplicadosFlow/2,existeIdFlow/2]).


%RF2
%Descripción: Predicado que construye una opción.
%Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword X Option.
%Metas primarias: option.
%Metas secundarias: no tiene.

option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword , [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]).

%Descripción: Predicado que toma una lista entregada por el usuario, y agrega en una nueva los no repetidos.
%Dominio: Lista original X Lista nueva
%Metas primarias: filtroDuplicados/2
%Metas secundarias: getIdOption/2,existeId/2


filtroDuplicados([],[]):-
    !.

filtroDuplicados([H | T],[H | ListaNueva]):-
    getIdOption(H,Id),
    filtroDuplicados(T, ListaNueva),
    \+ existeId(Id,ListaNueva).

filtroDuplicados([_ | T],ListaNueva):-
    filtroDuplicados(T, ListaNueva).

%Descripción: Predicado que verifica si existe un elemento en cierta lista.
%Dominio: Id (int) X Lista (list).
%Metas primarias: existeId/2
%Método: Recursión.

%si ocurre el primero
existeId(Id, [PrimerOption | _]):-
    getIdOption(PrimerOption,Id).

%caso recursivo
existeId(Id, [_ | RestoOption]):-
    existeId(Id,RestoOption).
    
existeId(_,[]):-
    false.

%Descripción: Predicado que obtiene el ID de un option.
%Dominio: Option (list) X Id (int)
%Metas primarias: getIdOption/2

getIdOption(Option,Id):-
    option(Id,_,_,_,_,Option).


%constructor flow
tdaFlow(Id,Message,Option,[Id,Message,Option]).


getIdFlow(Flow, Id) :-
   tdaFlow(Id , _ , _, Flow).

getMessageFlow(Flow, Message) :-
    tdaFlow(_ , Message , _, Flow).

getOptionFlow(Flow, Option) :-
    tdaFlow(_ , _ , Option, Flow).