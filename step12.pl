%(12) Extract uppercase words from a file, extract unique words 

filter(_,[],[]).
filter(P, [A0|As0], As) :-
    (
    	call(P, A0) -> As = [A0|As1]
    ;
    	As = As1
    )
    , filter(P, As0, As1).

split(S,D,List) :-
  List = [Head|Tail],
  atom_chars(S,L),
  member(D,L),
  append(F,End,L),
  append([D],B,End),
  atom_chars(Head,F),
  atom_chars(Back,B),
  split(Back,D,Tail).
  
split(S,D,End) :-  
  atom_chars(S,L),
  \+member(D,L),
  End = [S].
  
count_words(S,Count) :-
 split(S,' ',R),
 length(R,Count).
 
filter_caps([],[]).
 
filter_caps([A0|As0],As) :- 
 
 atom_chars(A0,Chars),
 
 (
   check_caps(Chars) -> As = [A0|As1]
   ;
   As = As1
 
 ),
 filter_caps(As0,As1).

check_caps([Head|Tail]) :-
 char_type(Head, upper),
 check_caps(Tail).
 
check_caps([]):-
!.


:-begin_tests(filter_caps).

  test(filter_caps) :-
    filter_caps(['TEST','TESt',test],['TEST']).
  
  test(no_caps) :-
    filter_caps([test,test,test],[]).
    
  test(contains_whitespace) :-
    filter_caps([test,'TEST test',test],[]).  
    
:-end_tests(filter_caps).


