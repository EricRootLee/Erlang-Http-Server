-module(sample_handler).
-export([init/2]).

init(Req0 ,State) ->
     io:format("Inside Web handler ....", []),
     Req = cowboy_req:reply(200 , #{
         <<"Content-type">> => <<"text">>
     },State,Req0),

    {ok,Req,State}.