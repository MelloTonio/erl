-module(main).
-export([fibo/1, my_time_func/1, area/1, my_tuple_to_list/3, my_tuple_to_list2/4, invert_tuple_list/3, my_tuple_to_list/1, my_tuple_to_list2/1, invert_tuple_list/1]).

area({circle, R}) -> (R * R) * 3.14;
area({triangle, A, B}) -> A*B/2.

my_tuple_to_list(Tuple) -> my_tuple_to_list(Tuple, 1, tuple_size(Tuple)).
my_tuple_to_list(Tuple, Pos, Size) when Pos =< Size -> [element(Pos,Tuple) | my_tuple_to_list(Tuple, Pos+1, Size)]; 
my_tuple_to_list(_, _, _) -> [].

invert_tuple_list(Tuple) -> invert_tuple_list(Tuple, tuple_size(Tuple), []).
invert_tuple_list(_, 0, _) -> [];
invert_tuple_list(Tuple, Pos, Arr) -> Arr ++ [element(Pos, Tuple)] ++ invert_tuple_list(Tuple, Pos - 1, Arr).


my_tuple_to_list2(Tuple) -> my_tuple_to_list2(Tuple, 1, tuple_size(Tuple), []).
my_tuple_to_list2(Tuple,Pos, _, _) when tuple_size(Tuple) =:= Pos -> [element(Pos, Tuple)];
my_tuple_to_list2(Tuple, Pos, Size, Acc) -> Acc ++ [element(Pos, Tuple)] ++ my_tuple_to_list2(Tuple, Pos+1, Size, Acc).


%ex: main:my_time_func(fun() ->  main:fibo(43) end).%
my_time_func(F) -> {IHour, IMinute, ISecond } = erlang:time(),
    F(),
    {FHour, FMinute, FSecond } = erlang:time(),
    RHour = FHour - IHour,
    RMinute = FMinute - IMinute,
    RSecond = FSecond - ISecond,
    Result = {RHour, RMinute, RSecond},
    io:fwrite("~w",[Result]).

fibo(0) -> 1;
fibo(1) -> 1;
fibo(2) -> 1;
fibo(Times) -> fibo(Times - 1) + fibo(Times - 2).
