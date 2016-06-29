classdef com < handle
%com provides methods to communicate with the Zeiss ECU
    properties (Access = private)
        s;  % serialPort
    end
    properties (Abstract)
        prefix;
    end

    methods
        %% Constructor
        function obj = com(serial)
            obj.s = serial;
        end
        
        %% Receive the answer
        function ret = receive (obj)
            msg = fscanf(obj.s);    % read answer
            ret = regexp(msg, ['P' obj.prefix '([a-zA-Z\d]*).'], 'tokens');  %Strip the message from prefix and suffix
            ret = ret{1};
        end
        
        %% Send a message
        function send (obj, msg)
            fprintf(obj.s, [obj.prefix 'P' msg]);
        end
    end
end