-module(clock).
-compile([export_all]).

start(Time) ->
    Fun = fun() -> io:format("now : ~p~n",[erlang:now()]) end,
    Pid = spawn(fun() -> timer(Time,Fun) end),
    register(clock,Pid).
    
stop(PName) ->
    PName ! stop.
timer(Time,Fun) ->
    receive
        stop ->
            stoped
    after Time ->
            Fun(),
            timer(Time,Fun)
    end.
