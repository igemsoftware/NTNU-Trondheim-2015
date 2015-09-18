function x = str2num(s)
%STR2NUM String to number conversion.
%	X = STR2NUM(S)  converts the string S, which should be an
%	ASCII character representation of a numeric value, to MATLAB's
%	numeric representation.  The string may contain digits, a decimal
%	point, a leading + or - sign, an 'e' preceeding a power of 10 scale
%	factor, and an 'i' for a complex unit.
%
%	STR2NUM converts a string matrix representation of a matrix of
%	numbers to a numeric matrix. For example,
%	    
%	     A = ['1 2'         str2num(A) => [1 2;3 4]
%	          '3 4']
%
%	If the string S does not represent a valid number or matrix,
%	STR2NUM(S) returns the empty matrix.
%
%	See also NUM2STR, HEX2NUM.

%	Copyright (c) 1984-94 by The MathWorks, Inc.
%	$Revision: 5.1 $ 

semi = ';';
space = ' ';
if ~isstr(s)
   error('Requires string input.')
end
[m,n] = size(s);
if (m > 0),
    % String does not contain brackets
	if ~any(any(s == '[' | s == ']')),
		s = [['[';space(ones(m-1,1))],s,[semi(ones(m-1,1));' '], ...
                 [space(ones(m-1,1));']']]';
	elseif ~any(any(s(1:m-1,:) == semi)), % No ;'s in non-last rows
		s = [s,[ones(m-1,1)*semi;space]]';
	else,                               % Put ;'s where appropriate
		spost = ones(m,1)*space;
		for i = 1:m-1,
			last = find(fliplr(s(i,:)) ~= space);
			if s(i,n-last(1)+1) ~= semi,
				spost(i) = semi;
			end
		end
		s = [s,spost]';
	end
end

x = eval(s,'[]');

if isstr(x)
   x = [];
end