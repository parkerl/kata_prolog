calcflow(0,0,0,0,0).
calcflow(D,V,Rho,0,0).
clacflow(D,V,Rho,Mu,Result):-
Result is ((D*Rho)*V)/Mu.

flowtype(F,'Laminar flow') :- F < 2100.
flowtype(F,'Transient flow') :- F >= 2100, F =< 4000.
flowtype(F,'Turbulent flow') :- F > 4000.


flowloop:-write('Flow calculator '),
nl,
write('Diameter: '),read(D),
write('Velocity: '),read(V),
write('Density: '),read(Rho),
write('Viscosity: '),read(Mu),
write('Result is: '),clacflow(D,V,Rho,Mu,Result),write(Result),nl,
write('Flow type is: '),flowtype(Result, Flow),write(Flow),nl,
write('Type end to end '),nl,read(Word),
(Word=end;flowloop).
