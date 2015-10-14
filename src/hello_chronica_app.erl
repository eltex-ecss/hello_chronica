%%%-------------------------------------------------------------------
%%% -*- coding: utf-8 -*-
%%% @author Nikita Roshchupkin
%%% @copyright (C) 2015, Eltex, Novosibirsk, Russia
%%% @doc
%%%
%%% @end
%%% Created : Oct 2015
%%%-------------------------------------------------------------------
-module(hello_chronica_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, StartArgs) ->
    hello_chronica_supervisor:start_link(StartArgs).

stop(_State) ->
    ok.