-module(math_functions).
-export([splitFilter/1,split/1, split/3, even/1, odd/1, filter/2]).

even(X) when X rem 2 =:= 0 -> true;
even(_) -> false.

odd(X) when X rem 2 =:= 1 -> true;
odd(_) -> false.

%ex: math_functions:filter(fun (X) -> math_functions:even(X) end, [1,2,3,4,5]).%
filter(F, L) -> [X || X <- L, F(X)].

split(L) -> split(L, [], []).
split([H|T], Odd, Even) ->
    case (H rem 2) of
        0 -> split(T, Odd, [H|Even]);
        1 -> split(T, [H|Odd], Even)
    end;
split([], Odd, Even) ->
    {Odd,Even}.

splitFilter(L) -> {filter(fun (X) -> odd(X) end, L), filter(fun (Y) -> even(Y) end, L)}.