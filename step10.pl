

writeTimestampFile(List,FilePath) :-
    parse(FilePath,'.',Front,Back),
    getTime(Stamp),
    atom_concat(Front,Stamp,File1),
    atom_concat('.',Back,Ext),    
    atom_concat(File1,Ext,NewPath),
    writeFile(List,NewPath).    
    
    
getTime(FormattedTime) :- get_time(Time),
   format_time(atom(FormattedTime),'-%m-%d-%Y',Time).