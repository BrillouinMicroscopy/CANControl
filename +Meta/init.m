classdef init < com & Meta.config
%Meta.init controls the LSM 510:Meta
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end