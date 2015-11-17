-module(area_server).
-compile([export_all]).

start() ->
    Res = register(area_server,spawn(?MODULE,loop,[])),
    io:format("result : ~p~n",[Res]).

stop() ->
    area_server ! stop.

loop() ->
    receive
        {From,{area,R}} ->
            case area(R) of
                {area,Area} ->
                    io:format("Area : ~p~n",[Area]),
                    From ! {self(),Area},
                    loop();
                _->
                    io:format("error of server ~n"),
                    From ! {self(),error},
                    loop()
            end;
        {From,_} ->
            io:format("receive Other message ~n"),
            From ! {self(),error},
            loop()
    end.

area({yuan,R}) ->
    {area,3.1415926 * R * R};
area({rectangle,Width,Ht}) ->
    {area,Width * Ht}.

test() ->
    start(),
    spawn(fun() ->
                  area_server ! {self(),{area,{yuan,10}}},
                  area_server ! {self(),{area,{rectangle,10,9}}},
                  receive
                      {_,Area} ->
                          io:format("receive area : ~p~n",[Area]),
                          stop()
                  end
          end).

    
    
