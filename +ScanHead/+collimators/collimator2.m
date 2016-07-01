classdef collimator2 < com & ScanHead.config
%collimator2 controls the z-position of collimator2
    properties (Dependent)
       z; 
    end
    
    methods
        %% Constructor
        function obj = collimator2(serial)
            obj@com(serial);
        end
        
        %% Available methods
        % function sets position
        function set.z (obj, pos)
            obj.send(['CS26,' num2str(pos)]);
        end
        
        % function gets position
        function pos = get.z (obj)
            obj.send('Cs26,1');
            pos = str2double(obj.receive());
        end
    end
end