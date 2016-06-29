classdef Pmt < com
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)
    properties
        prefix = 'K';      % prefix for adressing with the device
    end
    
    methods
        %% Constructor
        function obj = Pmt(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end