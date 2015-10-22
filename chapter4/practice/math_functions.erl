%% File:math_functions.erl
%% Author:xue.shumeng@yahoo.com
%% Created:Thu Oct 22 10:53:29 2015
%% Description: TODO: Add description to meta_data_ops

-module(math_functions).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([even/1,filter/2,split/1,other_split/1]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

even(X)->
    io:format("even : ~p ",[X]),
    case X of
        X when X rem 2 =:= 0 ->
            io:format("true~n"),
            true;
        _ ->
            io:format("false~n"),
            false
    end.

%%filter(F,L) ->
%%    [X || X <- L,F(X)].

filter(F,L) ->
    internal_filter(F,L,[]).

split(L) ->
    Even = [X || X <- L,X rem 2 =:= 0],
    Odd = [X || X <- L ,X rem 2 =/=0],
    {Even,Odd}.

other_split(L) ->
    internal_split(L,[],[]).

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

internal_filter(F,[H|T],List) ->
    case F(H) of
        true ->
            internal_filter(F,T,[H|List]);
        false ->
            internal_filter(F,T,List)
    end;
internal_filter(_,[],List) ->
    List.

internal_split([H|T],Even,Odd)->
    case H rem 2 of
        0 ->
            internal_split(T,[H|Even],Odd);
        1 ->
            internal_split(T,Even,[H|Odd])
    end;
internal_split([],Even,Odd) ->
    {Even,Odd}.

                        
