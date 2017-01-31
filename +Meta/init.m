classdef init < BA_Utils.ScanControl.Utils.CANControl.com & BA_Utils.ScanControl.Utils.CANControl.Meta.config
%Meta.init controls the LSM 510:Meta
    
    methods
        %% Constructor
        function obj = init(serial)
            obj@BA_Utils.ScanControl.Utils.CANControl.com(serial);
        end
        
        %% Available methods
    end
end