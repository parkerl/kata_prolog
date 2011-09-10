% Printing output in different formats (say rounding up to 5 decimal places, truncating after 
% 4 decimal places, padding zeros to the right and left, right and left justification)(Input output operations) 

round_to(X,Places,Result) :-
Y is float_fractional_part(X),
atom_number(A,Y),
Trim is Places + 2,
sub_atom(A,0,Trim,C, _),
C == 0,
Result=X.



round_to(X,Places,Result) :-
Y is float_fractional_part(X),
Z is integer(float_integer_part(X)),
atom_number(A,Y),
Trim is Places + 3,
(sub_atom(A,0,Trim,_, Num),atom_number(Num, Fract),
Final is round(Fract * (10^Places))/(10^Places),
Result is Z + Final;Result = X).



pad(X,Pad,Result) :-
atom_length(X,Len),
(Len==Pad,Result=X;
atom_chars(X,L),
append(L,['0'],L2),
concat_atom(L2,X3),
pad(X3,Pad,Result)
).

padl(X,Pad,Result) :-
atom_length(X,Len),
(Len==Pad,Result=X;
atom_chars(X,L),
append(['0'],L,L2),
concat_atom(L2,X3),
padl(X3,Pad,Result)
).

