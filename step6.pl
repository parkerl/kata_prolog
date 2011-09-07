% Scientific calculator supporting addition, subtraction, multiplication, division, square-root, square, cube, sin, cos, tan, Factorial, inverse, modulus

% defeine rules for each type of caculation

calc(Num1,Op,Result) :- Op == +,  write('Number: '), read(Num2), Result is Num1 + Num2.
calc(Num1,Op,Result) :- Op == -,  write('Number: '), read(Num2),Result is Num1 - Num2. 
calc(Num1,Op,Result) :- Op == /,  write('Number: '), read(Num2),Result is Num1 / Num2. 
calc(Num1,Op,Result) :- Op == *,  write('Number: '), read(Num2),Result is Num1 * Num2. 
calc(Num1,Op,Result) :- Op == ^,  write('Number: '), read(Num2),Result is Num1 ^ Num2. 
calc(Num1,Op,Result) :- Op == sq, Result is Num1 ^ 2. 
calc(_,_,'Unknown operation').

% define a predicate that takes 3 arguments, two numbers and an operator

%define a predicate that asks for user input
% if input = "=" then print the result else ask for a number. 
% then calculate.

calcloop(Num1) :-
write('Operation: '), read(Op),
(Op=exit;
calc(Num1,Op,Result),
write(Result),nl,calcloop(Result)).

main :-
write('Enter a number: '), read(Num1),
calcloop(Num1).