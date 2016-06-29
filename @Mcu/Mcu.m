classdef Mcu < com
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)
    properties
        prefix = 'N';      % prefix for adressing with the device
    end
    
    methods
        %% Constructor
        function obj = Mcu(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end