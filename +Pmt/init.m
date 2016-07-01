classdef init < com & Pmt.config
%Pmt.init controls the Detectors CAN11:T-PMT
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@com(serial);
        end
        
        %% Available methods
    end
end