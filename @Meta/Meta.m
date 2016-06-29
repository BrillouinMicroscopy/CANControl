classdef Meta < com
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)
    properties
        prefix = 'C';      % prefix for adressing with the device
    end
    
    methods
        %% Constructor
        function obj = Meta(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end