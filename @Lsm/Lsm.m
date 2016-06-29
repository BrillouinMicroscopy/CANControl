classdef Lsm < com
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)
    properties
        prefix = 'IP';      % prefix for adressing with the device
    end
    
    methods
        %% Constructor
        function obj = Lsm(serial)
            obj@com(serial);
        end
        
        %% Available methods
        % function sets the position of collimator 1
        function set (obj, pos)
            obj.send(['CS25,' pos]);
        end
    end
end