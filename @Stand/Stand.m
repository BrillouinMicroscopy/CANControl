classdef Stand < com
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)
    properties
        prefix = 'H';      % prefix for adressing with the device
    end
    
    methods
        %% Constructor
        function obj = Stand(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end