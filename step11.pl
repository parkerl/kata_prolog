% (11) Input is HTML table, Remove all tags and put data in a comma/tab separated file. 

convert2csv(FilePath) :-
  load_html_file(FilePath,Term),
  print_elements(Term,Result),
  parse(FilePath, '.',Front,_),
  atom_concat(Front,'.csv',NewPath),
  writeFile(Result,NewPath)
  .
  
print_elements(Term,Result) :-
  Term = [Head|Tail],
  element(Name,_,Content) = Head,
  Name \= tr,
  print_elements(Content,R1),
  print_elements(Tail,R2),
  append(R1,R2,Result).

print_elements(Term,[First|Rest]) :-
  Term = [Head|Tail],
  element(tr,_,Content) = Head,
  print_row(Content,Result),
  atomic_list_concat(Result, ',',R),
  First = R,
  nl,
  print_elements(Tail,Rest).

print_elements(Term,Result) :-
  Term = element(_,_,Content) ,
  print_elements(Content,Result).
  
print_elements([],Result) :- Result = [].

print_row([Cell|Rest],[Head|Tail]) :-
  Cell = element(_,_,[Head|_]),
  print_row(Rest,Tail).
  
print_row([],[]).

  
