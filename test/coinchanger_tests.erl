-module(coinchanger_tests).
-include_lib("eunit/include/eunit.hrl").
-include_lib("triq/include/triq.hrl").

-import(coinchanger, [change_for/1]).

prop_returns_the_same_amount() ->
  ?FORALL(
     Amount,
     int(),
     Amount == lists:sum(change_for(Amount))
    ).

property_test() ->
  true = (triq:check(prop_returns_the_same_amount())).
