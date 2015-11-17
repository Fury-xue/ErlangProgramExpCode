%% File:practice.erl
%% Author:xue.shumeng@yahoo.com
%% Created:Thu Oct 15 14:06:06 2015
%% Description: TODO: Add description to meta_data_ops

-module(practice).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-compile(export_all).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------
-spec my_tuple_to_list(Arg :: tuple()) -> List :: list();
                      (Arg :: term()) -> ok.
my_tuple_to_list(Arg) when is_tuple(Arg) ->
    Parse = erl_parse:abstract(Arg),
    List = add_to_list(Parse),
    io:format("~p~n",[List]),
    List;
my_tuple_to_list(Arg) when not is_tuple(Arg) ->
    io:format("the arg is not a tuple~n").

-spec my_time_fun(F :: function()) -> ok.

my_time_fun(F) when is_function(F,0) ->
    {H,M,S} = erlang:time(),
    F(),
    {AH,AM,AS} = erlang:time(),
    io:format("the function start time : ~pH~pM~pS, and stop time : ~pH~pM~pS~n",[H,M,S,AH,AM,AS]).

-spec my_date_string() -> Now :: atom().
my_date_string() ->
    {Y,M,D} = erlang:date(),
    {AH,AM,AS} = erlang:time(),
    Now = erlang:integer_to_list(Y) ++ "/" ++ string:right(erlang:integer_to_list(M),2,$0) ++ "/" ++ string:right(erlang:integer_to_list(D),2,$0) ++ " " ++ string:right(erlang:integer_to_list(AH),2,$0) ++ ":" ++ string:right(erlang:integer_to_list(AM),2,$0) ++ " " ++ string:right(erlang:integer_to_list(AS),2,$0),
    list_to_atom(Now).
    

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

add_to_list(Arg) when is_list(Arg) ->
    lists:map(fun(X) -> add_to_list(X) end,Arg);
add_to_list({_,_,Res}) ->
    case is_list(Res) of
        true ->
            add_to_list(Res);
        false ->
            Res
    end.

            
        
            
        

