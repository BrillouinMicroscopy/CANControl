classdef init < com & Stand.config
%Stand.init controls the Stand Axiovert 200:Stand
    properties (Dependent)
        reflector;
        objective;
        tubelens;
        baseport;
        sideport;
        mirror;
    end
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@com(serial);
        end
        
        %% Available methods
        %% Reflector
        % function returns the current position of the reflector
        function pos = get.reflector (obj)
            obj.send('Cr1,1');                      % request current position
            pos = str2double(obj.receive());
        end
        
        % function sets the position of the reflector
        function set.reflector (obj, pos)
            if ismember(pos, [1, 2, 3, 4, 5])
                obj.send(['CR1,' num2str(pos)]);    % set current position
            end
        end
        
        %% Objective
        % function returns the current position of the objective
        function pos = get.objective (obj)
            obj.send('Cr2,1');                      % request current position
            pos = str2double(obj.receive());
        end
        
        % function sets the position of the objective
        function set.objective (obj, pos)
            if ismember(pos, [1, 2, 3, 4, 5, 6])
                obj.send(['CR2,' num2str(pos)]);    % set current position
            end
        end
        
        %% Tubelens
        % function returns the current position of the tublens
        function pos = get.tubelens (obj)
            obj.send('Cr36,1');                      % request current position
            pos = str2double(obj.receive());
        end
        
        % function sets the position of the tublens
        function set.tubelens (obj, pos)
            if ismember(pos, [1, 2, 3])
                obj.send(['CR36,' num2str(pos)]);    % set current position
            end
        end
        
        %% Baseport
        % function returns the current position of the baseport
        function pos = get.baseport (obj)
            obj.send('Cr38,1');                      % request current position
            pos = str2double(obj.receive());
        end
        
        % function sets the position of the baseport
        function set.baseport (obj, pos)
            if ismember(pos, [1, 2, 3])
                obj.send(['CR38,' num2str(pos)]);    % set current position
            end
        end
        
        %% Sideport
        % function returns the current position of the sideport
        function pos = get.sideport (obj)
            obj.send('Cr39,1');                      % request current position
            pos = str2double(obj.receive());
        end
        
        % function sets the position of the sideport
        function set.sideport (obj, pos)
            if ismember(pos, [1, 2, 3])
                obj.send(['CR39,' num2str(pos)]);    % set current position
            end
        end
        
        %% Mirror
        % function returns the current position of the mirror
        function pos = get.mirror (obj)
            obj.send('Cr51,1');                      % request current position
            pos = str2double(obj.receive());
        end
        
        % function sets the position of the mirror
        function set.mirror (obj, pos)
            if ismember(pos, [1, 2])
                obj.send(['CR51,' num2str(pos)]);    % set current position
            end
        end
    end
end