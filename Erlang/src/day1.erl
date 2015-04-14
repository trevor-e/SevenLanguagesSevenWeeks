%%%-------------------------------------------------------------------
%%% @author trevor
%%% @copyright (C) 2015
%%% @doc
%%%
%%% @end
%%% Created : 13. Apr 2015 10:59 PM
%%%-------------------------------------------------------------------
-module(day1).
-author("trevor").

%% API
-export([]).
-export([run/0]).

run() -> io:write(count_words("This is a list of words")),
  io:nl(),
  io:write(count_to_ten(0)),
  io:nl(),
  selective_print({error, hello}),
  selective_print(success).

list_size([]) -> 0;
list_size(List) ->
  [_ | Tail] = List,
  list_size(Tail) + 1.

count_words(String) ->
  Words = string:tokens(String, " "),
  list_size(Words).

count_to_ten(10) -> io:write(10);
count_to_ten(N) when N<10 ->
  io:write(N), io:nl(),
  count_to_ten(N+1).

selective_print(success) -> io:fwrite("Success");
selective_print({error, Message}) -> io:fwrite("Error: ~s~n", [Message]).