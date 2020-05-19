-module(add_handler).
-export([init/2]).

init (Req0,State)->
Num1 = cowboy_req:binding(num1,Req0),
Num2 = cowboy_req:binding(num2,Req0),

Sum  = Num1 + Num2,

Req = cowboy_req:reply(200,#{
<<"content-type">> => <<"text/plain">>},
[<<"Sum is : ">>,integer_to_list(Sum) , <<"\n">>],
Req0
),
{ok,Req , State}.