% Scientific calculator supporting addition, subtraction, multiplication, division, square-root, square, cube, sin, cos, tan, Factorial, inverse, modulus

% defeine rules for each type of caculation

factorial(0,1). 

factorial(N,F) :-  
   N>0, 
   N1 is N-1, 
   factorial(N1,F1), 
   F is N * F1.

calc(Num1,Op,Result) :- Op == +,  write('Number: '), read(Num2), Result is Num1 + Num2.
calc(Num1,Op,Result) :- Op == -,  write('Number: '), read(Num2),Result is Num1 - Num2. 
calc(Num1,Op,Result) :- Op == /,  write('Number: '), read(Num2),Result is Num1 / Num2. 
calc(Num1,Op,Result) :- Op == *,  write('Number: '), read(Num2),Result is Num1 * Num2. 
calc(Num1,Op,Result) :- Op == ^,  write('Number: '), read(Num2),Result is Num1 ^ Num2. 
calc(Num1,Op,Result) :- Op == sq, Result is Num1 ^ 2. 
calc(Num1,Op,Result) :- Op == cu, Result is Num1 ^ 3. 
calc(Num1,Op,Result) :- Op == sqrt, Result is sqrt(Num1). 
calc(Num1,Op,Result) :- Op == sin, Result is sin(Num1). 
calc(Num1,Op,Result) :- Op == tan, Result is tan(Num1). 
calc(Num1,Op,Result) :- Op == cos, Result is cos(Num1). 
calc(Num1,Op,Result) :- Op == log, Result is log(Num1). 
calc(Num1,Op,Result) :- Op == fact, factorial(Num1,F), Result is F. 
calc(Num1,_,Result) :- write('Unknown operation'),nl, Result is Num1.

calcloop(Num1) :-
write('Operation: '), read(Op),
(Op=exit;
calc(Num1,Op,Result),
write(Result),nl,calcloop(Result)).

main :-
write('Enter a number: '), read(Num1),
calcloop(Num1).