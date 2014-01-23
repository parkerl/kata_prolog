library(tty).

slide(0, [
"",
"",
"",
"         ** Welcome **",
"",
"     Strap on a helmet, Don't Panic",
"",
"",
"",
"",
""
]).

slide(1, [
"",
"",
"",
"         **PROLOG**",
"",
"      * Interpreted",
"      * Strongly (ish) and Dynamically typed",
"      * Declarative ",
"",
"",
""
]).

slide(2, [
"",
"",
"",
"         ",
"",
"      * Facts   - look like method calls",
"      * Rules   - this is where the magic happens",
"                - identified by their name and arity i.e. 'append/3'",
"                - made up of goals or 'subgoals'",
"                - evaluate to 'true' or 'false'",
"      * Queries - find out if the given data satisfies the set of rules",
"",
"",
""
]).

slide(3, [
"",
"",
"",
"         ",
"",
"      * Varibles - names starting with an uppercase letter",
"      * Atoms    - unquoted lowercase names and single quoted names (think Ruby :symbols)",
"      * Strings  - double quoted characters",
"      * Lists    - order collections of variable length",
"",
"",
""
]).

slide(4, [
"",
"",
"",
"         ",
"                *** Things That Make You Go ... huh? ***",
"      * Unification      - '=' does not mean what you think it should",
"                         - rules can work in many directions",
"      * Variable scoping - pass it in to get it out",
"      * Arguments        - pass an extra to collect the output",
"      * Tuples           - when the heck do you use these?",
"      * The Pipe         - list comprehension is crazy!",
"",
""
]).

slide(5, [
"",
"",
"",
"         ",
"                *** Getting Things Done ***",
"      * Lists            - the basic building block of doing work in prolog",
"      * Recursion        - impossible to do much in prolog without recursing",
"      * Pattern matching - goes hand in hand with recursion",
"",
"",
""
]).

slide(6, [
"",
"",
"",
"",
"                *** The Good ***",
"      * Succinct       - succinctly solve difficult puzzles",
"      * Complete       - libraries, etc.",
"      * Mind expanding - not you everyday language",
"",
"",
""
]).

slide(7, [
"",
"",
"",
"",
"                *** The Bad ***",
"      * Obtuse        - succinctly solve difficult puzzles",
"      * Debugging     - libraries, etc.",
"      * Repetitive    - lots of repeated code",
"      * Slow          - not a speed demon",
"      * Stackoverflow - blows its top",
"",
"",
""
]).

print_slide([]).
print_slide([Line|Lines]) :-
  write(Line), nl,
  print_slide(Lines).

present(Slide) :-
  tty_clear,
  slide(Slide,Content),
  print_slide(Content),
  nl,
  read(WhatShouldIDo),
  NextSlide is Slide+1,
  write(NextSlide),
  nl,
  (WhatShouldIDo=end;present(NextSlide)).

present :- 
  tty_clear,
  read(WhatShouldIDo),
  (WhatShouldIDo=end;present(0)).

