%%%-------------------------------------------------------------------
%%% @author trevor
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(day2).
-author("trevor").

-export([]).
-export([run/0, grab_by_key/2, compute_total_price/1]).

run() ->
  Result = grab_by_key(testing, [{blah, "Some blah"}, {testing, "Found it!"}, {moreBlah, "Hiding"}]),
  io:fwrite(Result),
  io:nl(),
  ShoppingList = [{"apple", 5, 1}, {"banana", 3, 2}, {"pepper", 1, 3}],
  WithTotalPrice = compute_total_price(ShoppingList).

grab_by_key(Key, List) ->
  case lists:keyfind(Key, 1, List) of
    {Key, Value} -> Value;
    false -> nothing
  end.

compute_total_price(ShoppingList) ->
  [{Product, Quantity, Price, Price * Quantity} || {Product, Quantity, Price} <- ShoppingList].
