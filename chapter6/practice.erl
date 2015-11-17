%% File:practice.erl
%% Author:xue.shumeng@yahoo.com
%% Created:Fri Oct 23 13:32:45 2015
%% Description: TODO: Add description to meta_data_ops

-module(practice).

%% ------------------------------------------------------------------
%% API Function Exports
%% ------------------------------------------------------------------

-export([my_read/1]).

%% ------------------------------------------------------------------
%% API Function Definitions
%% ------------------------------------------------------------------

my_read(File)->
    case file:read_file(File) of
        {ok,Bin} ->
            Bin;
        _ ->
            throw("read file exception")
    end.

%% ------------------------------------------------------------------
%% Internal Function Definitions
%% ------------------------------------------------------------------

