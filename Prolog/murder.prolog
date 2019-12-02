victim(mr_boddy).
victim(cook).
victim(motorist).
victim(police_officer).
victim(yvette).
victim(singing_telegram).

suspect(professor_plum).
suspect(mrs_peacock).
suspect(mrs_white).
suspect(miss_scarlet).
suspect(colonel_mustard).
suspect(mr_green).
suspect(wadsworth).

weapon(wrench).
weapon(candlestick).
weapon(lead_pipe).
weapon(knife).
weapon(revolver).
weapon(rope).

room(hall).
room(kitchen).
room(lounge).
room(library).
room(billiard_room).

murder(mr_boddy,candlestick,hall).
murder(cook,knife,kitchen).
murder(motorist,wrench,lounge).
murder(police_officer,lead_pipe,library).
murder(singing_telegram,revolver,hall).
murder(yvette,rope,billiard_room).


motive(everyone, mr_boddy) :- everyone \= wadsworth.
motive(mrs_peacock,cook).
motive(colonel_mustard,motorist).
motive(yvette,miss_scarlet).
motive(colonel_mustard,yvette).
motive(mrs_white,yvette).
%mrs white motive colonel?
motive(police_officer,miss_scarlet).
motive(professor_plum,singing_telegram).
motive(wadsworth,singing_telegram).

not_used(colonel,rope).
not_used(professor_plum,revolver).
not_used(mrs_peacock,candlestick).

not_visited(professor_plum,kitchen).
not_visited(colonel_mustard,R) :- murder(mr_boddy, _, R).
not_visited(miss_scarlet,billiard_room).

alibi(mrs_white,mr_boddy).
alibi(mr_green,_).
alibi(miss_scarlet,V) :- murder(V,revolver,_).  

% Update accuse to solve the murders.
% Add more facts and rules as needed.
accuse(V,S) :- murder(V,W,R), suspect(S), victim(V), room(R), weapon(W), \+not_used(S,W), \+not_visited(S,R),\+alibi(S,_).
