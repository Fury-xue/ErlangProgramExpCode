%% File:read_config.erl
%% Author:xue.shumeng@yahoo.com
%% Created:Fri Oct 23 09:31:56 2015
%% Description: TODO: Add description to meta_data_ops

-module(read_config).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------
-compile(export_all).
%%-export([init/1,insert/1,update/1,delete/1]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

init()->
    {ok,Dir} = file:get_cwd(),
    FullDir = Dir ++ "/config",
    io:format("current work directory is : ~p~n",[Dir]),
    {ok,Files} = file:list_dir(FullDir),
    lists:foreach(fun(X) -> 
                          ContentList = open_file(FullDir ++ "/" ++X),
                          lists:foreach(fun(Json)->
                                                json2map(Json)
                                        end,ContentList)
                  end,Files).

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

open_file(File) ->
    io:format("File : ~p~n",[File]),
    {ok,Content} = file:read_file(File),
    ContentList = string:tokens(binary_to_list(Content),"\n"),
    file:close(File),
    ContentList.
    
json2map(Json) ->
    Strip1 = string:strip(Json,left,${),
    Strip  = string:strip(Strip1,right,$}),
    SplitStr = string:tokens(Strip,","),
    lists:foreach(fun(X)->
                          case erl_scan:string(X) of
                              {ok,[{_,_,Key},{':',_},{_,_,Value}],_} ->
                                  io:format("key=~p, value=~p~n",[Key,Value]);
                              _ ->
                                  %%io:format("please check configure file at ~p~n",[X]),
                                  exit("please check configure file at " ++ X)
                          end
                  end,SplitStr).
