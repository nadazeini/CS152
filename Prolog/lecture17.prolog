%all facts no variables
villain(joker).
villain(penguin).
villain(catwoman).
villain(scarecrow).
villain(bang).

kills_people(jolser).
kills_people(penguin).
kills_people(bang).

power(scarecrow,fear).
power(bang,vendun).


%rules
scary(v):- villain(v),kills_people(v).
scary(v):- villain(v), power(v,_).

?- findall(V,scary(v),R).
    R =  [joker,penguin,bang,scarecrow.bang].
?- setof(V,scary(v),R).
    R = [joker,penguin,bang,scarecrow].


findscary(ScarySet):- 
    findall(V,scary(v),listOfScaries),
    get_unique(listOfScaries,ScarySet).
    !.
get_unique([],[]).
get_unique([H|Tail],Set):-
    get_unique(Tail,TailSet),
    \+ member(H,TailSet),
    Set = ([H|Tail],TailSet):-
        get_unique(Tail,TailSet):-
        member(H,TailSet).