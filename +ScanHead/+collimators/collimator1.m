classdef collimator1 < com & ScanHead.config
%collimator1 controls the z-position of collimator1
    properties (Dependent)
       z; 
    end
    
    methods
        %% Constructor
        function obj = collimator1(serial)
            obj@com(serial);
        end
        
        %% Available methods
        % function sets position
        function set.z (obj, pos)
            obj.send(['CS25,' num2str(pos)]);
        end
        
        % function gets position
        function pos = get.z (obj)
            obj.send('Cs25,1');
            pos = str2double(obj.receive());
        end
    end
end