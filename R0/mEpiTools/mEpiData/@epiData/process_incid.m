function process_incid(obj,incid) 
%PROCESS_I Convert the input 'incid' to a structure that EpiEstim
%understands.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Based on R function process_I from EpiEstim pacgage
% https://cran.r-project.org/web/packages/EpiEstim/index.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input:
%   incid 
%       Eather integer vector,  or structure with fields 'I' or 
%       'local' and 'imported'. 
%       Optionaly structure can have fields 'start_date' or 'dates'.
%       If 'dates' are given then start_date = dates(1).
%       'datesd' and 'start_date' must be  datetime class.
%
% Output:
%   incid -- a structure fith fields
%       incid.local 
%       incid.imported
%       incid.I (= incid.local  + incid.imported)
%

% 2020/07/28    Created

    if isstruct(incid)
        if isfield(incid,'local') && isfield(incid,'imported') ...
                && ~isfield(incid,'I')
            validateattributes(incid.local, {'numeric'},...
                {'integer','vector','nonnegative'});
            validateattributes(incid.imported, {'numeric'},...
                {'integer','vector','nonnegative'});
            obj.local = incid.local;
            obj.imported = incid.imported;
        elseif isfield(incid,'I') && ...
                ~isfield(incid,'local') && ~isfield(incid,'imported')
            validateattributes(incid.I, {'numeric'},...
                {'integer','vector','nonnegative'});
            obj.local = incid.I;
            obj.local(1) = 0;
            obj.imported = [incid.I(1),zeros(1,(length(incid.I)-1))];
        else
            error(['incid must be a vector or a structure with either',...
                'i) a field called ''I'', or ',...
                'ii) fields called ''local'' and ''imported''.']);
        end
    else
        % vector
        validateattributes(incid, {'numeric'},...
            {'integer','vector','nonnegative'});
        obj.local      = incid;
        obj.imported   = zeros(1,length(incid));
    end

    if ~isrow(obj.local)
        obj.local = obj.local';
    end
    if ~isrow(obj.imported)
        obj.imported = obj.imported';
    end

    if obj.local(1) > 0
%         warning(['incid.local(1) is >0 but must be 0, as all cases on the first',...
%             ' time step are assumed imported. This is corrected automatically',...
%             ' by cases being transferred to incid.imported.'])
        obj.imported(1) = obj.imported(1) + obj.local(1);
        obj.local(1) = 0;
    end

    obj.local(isnan(obj.local)) = 0;
    obj.imported(isnan(obj.imported)) = 0;
    obj.I = obj.local + obj.imported; % MB
end

