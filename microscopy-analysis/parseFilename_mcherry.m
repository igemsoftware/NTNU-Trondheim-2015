function [promoter,glucose]=parseFilename_mcherry(filename)
    [tokens,~]=regexp(filename,'^(Edd|Gad|Kgu|Zwf)','tokens','match');
    promoter=tokens{1};
    [tokens,~]=regexp(filename,'(1|5|10|20)%.csv$','tokens','match');
    glucose=tokens{1};
end