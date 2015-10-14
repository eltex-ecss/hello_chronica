%%%-------------------------------------------------------------------
%%% -*- coding: utf-8 -*-
%%% @author Nikita Roshchupkin
%%% @copyright (C) 2015, Eltex, Novosibirsk, Russia
%%% @doc
%%%
%%% @end
%%% Created : Oct 2015
%%%-------------------------------------------------------------------
-module(hello_chronica_supervisor).
-behaviour(supervisor).

-export([start/0, start_link/1, init/1]).

start() ->
    spawn(fun() ->
          supervisor:start_link({local,?MODULE}, ?MODULE, _Arg = [])
      end).

start_link(Args) ->
    supervisor:start_link({local,?MODULE}, ?MODULE, Args).

init([]) ->
    {ok, {{one_for_one, 1, 10},
        [{tag1,
            {server_hello_chronica, start_link, []},
            permanent,
            10000,
            worker,
            [server_hello_chronica]
        }]
    }}.