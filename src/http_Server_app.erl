%%%-------------------------------------------------------------------
%% @doc http_Server public API
%% @end
%%%-------------------------------------------------------------------

-module(http_Server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
    {'_' ,[{"/sample",sample_handler, <<"Hello Muli !\n">>},
    {"/add/:num1/:num2" , [{num1 , int},{num2,int}],add_handler,[]}
    ]}
]),
    {ok,_} = cowboy:start_clear(http_listener,
    [{port,8080}],
    #{env => #{dispatch => Dispatch}}
    ),
    http_Server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions 
