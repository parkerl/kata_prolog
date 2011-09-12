%(8) Open a text file and convert it into HTML file. (File operations/Strings)

readFile(FilePath,List):-
  open(FilePath, read, Stream),
  readText(Stream, List),
  close(Stream).

readText(Stream, [Head|Rest]):-
read_line_to_codes(Stream, Codes),
dif(Codes, end_of_file), !,
atom_codes(Head, Codes),
readText(Stream, Rest).

readText(Stream, []):- read_line_to_codes(Stream, end_of_file), !.

writeFile(List,FilePath) :-
  open(FilePath,write,Stream),
  writeList(Stream, List),
  close(Stream).

writeList(Stream, List) :-
  List = [Head|Tail],
  print(Head),nl,
  write(Stream,Head),
  nl(Stream),
  writeList(Stream,Tail).
  
writeList(_,[]) :-
  !.

convert(FilePath) :-
  readFile(FilePath,List),
  addEndTags(List,'br',L),
  parse(FilePath,'.',Front,_),
  atom_concat(Front,'.html',NewPath),
  append(['<html>'],L,L2),
  append(['<body>'],L2,L3),
  append(L3,['</body>'],L4),
  append(L4,['</html>'],L5),
  writeFile(L5,NewPath).
  
wrapTag(Value,Tag,Result) :-
  atom_concat('<',Tag,T1),
  atom_concat(T1,'>',Front),
  atom_concat('</',Tag,T2),
  atom_concat(T2,'>',Back),
  atom_concat(Front,Value,V1),
  atom_concat(V1,Back,Result).  
  
endTag(Value,Tag,Result) :-
  atom_concat('<',Tag,T2),
  atom_concat(T2,'>',Back),
    atom_concat(Value,Back,Result).  

addEndTags(List, Tag, [Head|Tail]) :-
  List = [First|Rest],
  endTag(First,Tag,Head),
  addEndTags(Rest,Tag,Tail).
  
addEndTags([],_,_) :-
  !.

parse(S,D,Front,Back) :-
  atom_chars(S,L),
  append(F,End,L),
  append([D],B,End),
  atom_chars(Front,F),
  atom_chars(Back,B).