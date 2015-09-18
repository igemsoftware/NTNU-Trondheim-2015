function [date,dev,bio,tech]=parseFilename(filename)
    [b,e]=regexp(filename,'(\d\d\d\d\d\d)');
    date=filename(b:e);
    [tokens,~]=regexp(filename,'(?:_)(NC|PC|1|2|3)','tokens','match');
    dev=tokens{1};
    [tokens,~]=regexp(filename,'(A|B|C)(?:\d\.csv)$','tokens','match');
    bio=tokens{1};
    [tokens,~]=regexp(filename,'(\d)(?:\.csv)$','tokens','match');
    tech=tokens{1};
end