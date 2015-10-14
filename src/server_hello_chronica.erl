%%%-------------------------------------------------------------------
%%% -*- coding: utf-8 -*-
%%% @author Nikita Roshchupkin
%%% @copyright (C) 2015, Eltex, Novosibirsk, Russia
%%% @doc
%%%
%%% @end
%%% Created : Oct 2015
%%%-------------------------------------------------------------------
-module(server_hello_chronica).
-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
     terminate/2, code_change/3, start_link/0, test/0]).

-include_lib("chronica/include/chronica.hrl").

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    process_flag(trap_exit, true),
    io:format("starting server_hello_chronica ~n"),
    {ok, 0}.

test() ->
    gen_server:call(?MODULE, hello_error),
    gen_server:call(?MODULE, hello_warning),
    gen_server:call(?MODULE, hello_info).

handle_call(hello_error, _From, _State) ->
  log:error([error],"header call hello_error ~n",[]),
  {reply, ok, _State};

handle_call(hello_warning, _From, _State) ->
  log:warning([warning],"header call hello_warning ~n",[]),
  {reply, ok, _State};

handle_call(hello_info, _From, _State) ->
  log:info([info],"header call hello_info ~n",[]),
  {reply, ok, _State}.

handle_cast(_Msg, N)  -> {noreply, N}.

handle_info(_Info, N)  -> {noreply, N}.

terminate(_Reason, _N) ->
    io:format("stopping server_hello_chronica ~n"),
    ok.

code_change(_OldVsn, N, _Extra) -> {ok, N}.