classdef init < com & Laser.config
%Laser.init controls the Laser Module R3.2:LM Interface
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end