male(james1). 
male(charles1).
male(charles2).
male(james2).
male(george1).

female(catherine).
female(elizabeth).
female(sophia).
female(nada).
female(nadz).

parent(charles1, james1).
parent(james1,someone).
parent(elizabeth, sophia).
parent(charles2, james2).
parent(catherine, charles1).
parent(james2, james1).
parent(sophia, elizabeth).
parent(george1, sophia).
parent(nada,mom).
parent(nadz,mom).
grandparent(X,GP) :- parent(X,P) , parent(P,GP).
sister(X,Sis):- female(Sis),parent(X,P),parent(Sis,P),(X \== Sis).
brother(X,Bro):- male(Bro),parent(X,P),parent(Bro,P),(X \== Bro).
cousin(X,Cuz):- (brother(P1,P2);sister(P1,P2)),parent(X,P1),
                    parent(Cuz,P2),
                    X \== Cuz.
