classdef Laser < com
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)
    properties
        prefix = 'J';      % prefix for adressing with the device
    end
    
    methods
        %% Constructor
        function obj = Laser(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end