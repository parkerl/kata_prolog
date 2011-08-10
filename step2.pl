#!/usr/local/bin/pl2wam -s

fib(0,0).
fib(1,1).
fib(N,F) :-
  succ(N1,N), succ(N2,N1), fib(N1,F1), fib(N2,F2), plus(F1,F2,F).
  
fib_print(N) :-
  write(N), write('th fib is '), fib(N,X),write(X),nl.
  

main :-
  fib_print(10), halt(1).
  