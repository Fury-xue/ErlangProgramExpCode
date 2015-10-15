%%%-------------------------------------------------------------------
%%% @author Simon <xue.shumeng@yahoo.com>
%%% @copyright (C) 2015, nomal
%%% @doc
%%%
%%% @end
%%% Created : 15 Oct 2015 by root <>
%%%-------------------------------------------------------------------
-module(geometry).

%% API
-export([area/1]).

%%%===================================================================
%%% API
%%%===================================================================


area({circular,Radii}) ->
    Area = 3.1415926 * Radii * Radii,
    io:format("Circular Area is : ~p~n",[Area]),
    Area;

area({rightTriangle,SideLen1,SideLen2}) ->
    Area = (SideLen1 * SideLen2)/2,
    io:format("RightTriangle Area is : ~p~n",[Area]),
    Area.

    
