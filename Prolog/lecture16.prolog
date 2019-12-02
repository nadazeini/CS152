%using my append
myappend([H|T1])...

%reverse list
myreverse([],[]).
myreverse([H|T],L) :-
    myreverse(T,RT),
    append(RT,[H],L).


%class
%looking for element X in a list
in-list(X,[]): fail
%no need, IF SOMETHING IS NOT LISTED >> FALSE
in-list(X,[X|_]). % dont care about the tail >> change to in-list(X.[X|_]):- !.
in-list(X,[Y|tail]):- X\=Y, %need to make sure it matches someting different
 in-list(X,tail). %works but annoying >>
in-list(1,[1,2,1,3,5]). % true true false >> go to line 15 change

% quicksort
qsort([], []).
qsort([Pivot,Tail], Sorted):-
    divide(Pivot,Tail,Left,Right), %left right are outputs
    %recusevely call qsort
    qsort(Left,LSort),
    qsort(Right,RSort),
    append(LSort,[Pivot|RSort), Sorted), %sorted is output


%
divide(P,[],[],[]).
divide(P,[H|T], , ):- P>H,
                    divide(P,T,L,R).
            divide(P,[H|T],L,[H|R]):-
            P=<H
            divide(P,T,L,R).

%end quicksort


 