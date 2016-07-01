classdef init < com & Stand.config
%Lsm controls the laser scanning module (pinholes, filters, beamsplitters,
%collimators)    
    methods
        %% Constructor
        function obj = init(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end