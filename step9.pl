%(9) Time and Date : Get system time and convert it in different formats ’DD-MON-YYYY’, ’mm-dd-yyyy’, ’dd/mm/yy’ etc. 

printTime :- get_time(Time),
  format_time(atom(F1),'%D',Time),
  print(F1),nl,
  format_time(atom(F2),'%d-%b-%Y',Time),
  print(F2),nl,
   format_time(atom(F3),'%m-%d-%Y',Time),
  print(F3),nl .