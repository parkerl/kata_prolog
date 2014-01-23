% Prolog File
get_pairs(_,[],[]).
get_pairs(Dev,[OtherDev],[[Dev,OtherDev]]).

get_pairs(Dev, [OtherDev|RemainingDevs],[[Dev,OtherDev]|Pairs]) :-
  get_pairs(Dev,RemainingDevs,Pairs).

all_pairs([],[]).

all_pairs([Dev| RemainingDevs],Pairs) :-
  get_pairs(Dev,RemainingDevs, FirstPairs),
  all_pairs(RemainingDevs, MorePairs),
  append(FirstPairs, MorePairs, Pairs).
