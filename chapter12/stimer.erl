-module(stimer).
-compile([export_all]).

start(Time,Fun) ->
    spawn(fun () -> timer(Time,Fun) end).

cancel(Pid) ->
    Pid ! cancel.

timer(Time,Fun) ->
    receive
        cancel ->
            void
    after
        Time-> 
            Fun()
    end.
        
